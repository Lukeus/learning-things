#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

# Check for Node.js
if (-not (Get-Command node -ErrorAction SilentlyContinue)) {
    Write-Error "Node.js not found. Please install Node.js 22 LTS."
    exit 1
}

# Check for npm
if (-not (Get-Command npm -ErrorAction SilentlyContinue)) {
    Write-Error "npm not found. Please install npm."
    exit 1
}

# Check for pnpm
function Get-PnpmVersion {
    if (Get-Command pnpm -ErrorAction SilentlyContinue) {
        try {
            $version = pnpm -v
            return @{ Version = ($version | Select-Object -Last 1).Trim(); Source = 'pnpm' }
        } catch {
            # continue to fallback paths
        }
    }

    Write-Host "pnpm not installed. Attempting to activate via Corepack..."
    if (Get-Command corepack -ErrorAction SilentlyContinue) {
        try {
            corepack enable 2>$null
            corepack prepare pnpm@latest --activate 2>$null
            if (Get-Command pnpm -ErrorAction SilentlyContinue) {
                $version = pnpm -v
                return @{ Version = ($version | Select-Object -Last 1).Trim(); Source = 'pnpm' }
            }
        } catch {
            Write-Host "Unable to activate pnpm via Corepack."
        }
    } else {
        Write-Host "Corepack not available; checking for npx fallback."
    }

    if (Get-Command npx -ErrorAction SilentlyContinue) {
        Write-Host "Using npx to invoke pnpm temporarily..."
        try {
            $versionOutput = & npx --yes pnpm@latest -- --version 2>$null
            if ($LASTEXITCODE -eq 0 -and $versionOutput) {
                $version = ($versionOutput | Select-Object -Last 1).Trim()
                if ($version) {
                    return @{ Version = $version; Source = 'npx pnpm@latest' }
                }
            }
        } catch {
            # fall through to manual guidance
        }
    }

    return $null
}

$pnpmInfo = Get-PnpmVersion
if ($pnpmInfo) {
    Write-Host "pnpm ($($pnpmInfo.Source)): $($pnpmInfo.Version)"
} else {
    Write-Host "Unable to locate pnpm. Install pnpm manually if you prefer it over npm."
}

# Check for spec-kit CLI
if (Get-Command specify -ErrorAction SilentlyContinue) {
    try {
        $specKitVersion = specify --version 2>$null
        Write-Host "GitHub Spec Kit: $specKitVersion"
    } catch {
        Write-Host "GitHub Spec Kit detected. (version unavailable)"
    }
} else {
    Write-Host "GitHub Spec Kit CLI not found. Attempting install via npm..."
    try {
        npm install -g @github/specify 2>$null | Out-Null
        Write-Host "GitHub Spec Kit CLI installed."
    } catch {
        Write-Host "Unable to install GitHub Spec Kit automatically."
        Write-Host "Install manually by following https://github.com/github/spec-kit"
    }
}

Write-Host ""
Write-Host "Repo ready. Open repo in VS Code and start with labs/lab-a-greenfield."
