$ErrorActionPreference = "Stop"

$skillName = "hermes-codex-supervisor"
$sourceSkillRoot = (Resolve-Path (Join-Path $PSScriptRoot "..")).Path
$userHome = [Environment]::GetFolderPath("UserProfile")
$targetSkillRoot = Join-Path $userHome ".codex\skills\$skillName"
$pluginRoot = Join-Path $userHome "plugins\$skillName"
$pluginSkillRoot = Join-Path $pluginRoot "skills\$skillName"
$pluginManifestPath = Join-Path $pluginRoot ".codex-plugin\plugin.json"
$marketplacePath = Join-Path $userHome ".agents\plugins\marketplace.json"

function Backup-And-PrepareTarget {
    param(
        [Parameter(Mandatory = $true)][string]$TargetPath
    )

    if (Test-Path -LiteralPath $TargetPath) {
        $resolvedTarget = (Resolve-Path -LiteralPath $TargetPath).Path
        if ($resolvedTarget -ne $sourceSkillRoot) {
            $timestamp = Get-Date -Format "yyyyMMdd_HHmmss"
            $backupPath = "$TargetPath.bak_$timestamp"
            Move-Item -LiteralPath $TargetPath -Destination $backupPath
            Write-Host "Backed up existing path to $backupPath"
        }
    }

    New-Item -ItemType Directory -Force -Path $TargetPath | Out-Null
}

function Copy-DirectoryContents {
    param(
        [Parameter(Mandatory = $true)][string]$SourcePath,
        [Parameter(Mandatory = $true)][string]$TargetPath
    )

    $resolvedSource = (Resolve-Path -LiteralPath $SourcePath).Path
    if ((Test-Path -LiteralPath $TargetPath) -and ((Resolve-Path -LiteralPath $TargetPath).Path -eq $resolvedSource)) {
        Write-Host "Skill source already equals target: $TargetPath"
        return
    }

    Backup-And-PrepareTarget -TargetPath $TargetPath
    Get-ChildItem -LiteralPath $SourcePath -Force | ForEach-Object {
        Copy-Item -LiteralPath $_.FullName -Destination $TargetPath -Recurse -Force
    }
}

function Write-PluginManifest {
    $manifestDir = Split-Path -Parent $pluginManifestPath
    New-Item -ItemType Directory -Force -Path $manifestDir | Out-Null

    $manifest = [ordered]@{
        name = $skillName
        version = "0.1.0"
        description = "Install Hermes Codex Supervisor as a reusable local plugin and skill so Codex can auto-trigger it for control-plane work."
        skills = "./skills/"
        interface = [ordered]@{
            displayName = "Hermes Codex Supervisor"
            shortDescription = "Take over Codex control-plane work, thread supervision, acceptance, and merge"
            longDescription = "Use Hermes Codex Supervisor when you want Codex to act as the control tower: freeze truth, split multi-thread work, supervise execution, rerun acceptance, merge results, and only escalate on real blockers or red lines."
            developerName = "Local Workspace"
            category = "Productivity"
            capabilities = @("Interactive", "Read", "Write")
            defaultPrompt = @(
                "Take over this Codex campaign and run the threads end to end",
                "Split this project into threads, supervise them, then rerun acceptance",
                "Stop making me relay between threads and handle the merge yourself"
            )
            brandColor = "#0F766E"
        }
    }

    $manifest | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 -LiteralPath $pluginManifestPath
}

function Update-Marketplace {
    $marketplaceDir = Split-Path -Parent $marketplacePath
    New-Item -ItemType Directory -Force -Path $marketplaceDir | Out-Null

    if (Test-Path -LiteralPath $marketplacePath) {
        $marketplace = Get-Content -Raw -LiteralPath $marketplacePath | ConvertFrom-Json
    } else {
        $marketplace = [pscustomobject]@{
            name = "local-user-plugins"
            interface = [pscustomobject]@{
                displayName = "Local User Plugins"
            }
            plugins = @()
        }
    }

    $hasInterface = $null -ne ($marketplace.PSObject.Properties["interface"])
    if (-not $hasInterface) {
        $marketplace | Add-Member -NotePropertyName interface -NotePropertyValue ([pscustomobject]@{
            displayName = "Local User Plugins"
        })
    }

    $hasPlugins = $null -ne ($marketplace.PSObject.Properties["plugins"])
    if (-not $hasPlugins) {
        $marketplace | Add-Member -NotePropertyName plugins -NotePropertyValue @()
    }

    $entry = [pscustomobject]@{
        name = $skillName
        source = [pscustomobject]@{
            source = "local"
            path = "./plugins/$skillName"
        }
        policy = [pscustomobject]@{
            installation = "INSTALLED_BY_DEFAULT"
            authentication = "ON_INSTALL"
        }
        category = "Productivity"
    }

    $existing = @($marketplace.plugins | Where-Object { $_.name -eq $skillName })
    if ($existing.Count -gt 0) {
        $marketplace.plugins = @($marketplace.plugins | Where-Object { $_.name -ne $skillName }) + @($entry)
    } else {
        $marketplace.plugins = @($marketplace.plugins) + @($entry)
    }

    $marketplace | ConvertTo-Json -Depth 10 | Set-Content -Encoding UTF8 -LiteralPath $marketplacePath
}

Write-Host "Installing skill to $targetSkillRoot"
Copy-DirectoryContents -SourcePath $sourceSkillRoot -TargetPath $targetSkillRoot

Write-Host "Installing plugin to $pluginRoot"
Copy-DirectoryContents -SourcePath $sourceSkillRoot -TargetPath $pluginSkillRoot
Write-PluginManifest
Update-Marketplace

Write-Host ""
Write-Host "Installed Hermes Codex Supervisor."
Write-Host "Skill: $targetSkillRoot"
Write-Host "Plugin: $pluginRoot"
Write-Host "Marketplace: $marketplacePath"
Write-Host "Restart Codex to pick up the new or updated plugin cleanly."
