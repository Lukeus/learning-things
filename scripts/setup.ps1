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
if (Get-Command pnpm -ErrorAction SilentlyContinue) {
    $pnpmVersion = pnpm -v
    Write-Host "pnpm: $pnpmVersion"
} else {
    Write-Host "pnpm not installed. Attempting to activate via Corepack..."
    if (Get-Command corepack -ErrorAction SilentlyContinue) {
        try {
            corepack enable 2>$null
            corepack prepare pnpm@latest --activate 2>$null
            $pnpmVersion = pnpm -v
            Write-Host "pnpm: $pnpmVersion"
        } catch {
            Write-Host "Unable to activate pnpm via Corepack."
            Write-Host "Install pnpm manually if you prefer it over npm."
        }
    } else {
        Write-Host "Corepack not available; install pnpm manually if desired."
    }
}

# Check for spec-kit CLI
if (Get-Command spec-kit -ErrorAction SilentlyContinue) {
    try {
        $specKitVersion = spec-kit --version 2>$null
        Write-Host "GitHub Spec Kit: $specKitVersion"
    } catch {
        Write-Host "GitHub Spec Kit detected. (version unavailable)"
    }
} else {
    Write-Host "GitHub Spec Kit CLI not found. Attempting install via npm..."
    try {
        npm install -g @github/spec-kit 2>$null | Out-Null
        Write-Host "GitHub Spec Kit CLI installed."
    } catch {
        Write-Host "Unable to install GitHub Spec Kit automatically."
        Write-Host "Install manually by following https://github.com/github/spec-kit"
    }
}

Write-Host ""
Write-Host "Repo ready. Start with labs/lab-a-greenfield."
