$ErrorActionPreference = 'Stop'

$minimumPesterVersion = [version]'5.0.0'

$loadedPester = Get-Module -Name Pester -ErrorAction SilentlyContinue
if ($loadedPester -and $loadedPester.Version -lt $minimumPesterVersion) {
    Remove-Module -Name Pester -Force -ErrorAction SilentlyContinue
}

try {
    Import-Module Pester -MinimumVersion $minimumPesterVersion -ErrorAction Stop | Out-Null
} catch {
    throw "Pester $minimumPesterVersion or higher is required. Install it with: Install-Module Pester -Scope CurrentUser -Force -SkipPublisherCheck. Original error: $($_.Exception.Message)"
}

Describe 'scripts/setup.ps1' {
    BeforeAll {
        $scriptsDir = Split-Path -Path $PSScriptRoot -Parent
        $script:scriptPath = Join-Path -Path $scriptsDir -ChildPath 'setup.ps1'
        
        $script:PwshExecutable = (Get-Command pwsh).Source
        $script:InvokeSetupScript = {
            param(
                [string]$ScriptPath,
                [string]$PathOverride
            )

            $psi = New-Object System.Diagnostics.ProcessStartInfo
            $psi.FileName = $script:PwshExecutable
            $psi.Arguments = "-NoLogo -NoProfile -File `"$ScriptPath`""
            $psi.UseShellExecute = $false
            $psi.RedirectStandardOutput = $true
            $psi.RedirectStandardError = $true

            # Copy current environment and override PATH
            foreach ($key in [System.Environment]::GetEnvironmentVariables().Keys) {
                $psi.EnvironmentVariables[$key] = [System.Environment]::GetEnvironmentVariable($key)
            }

            if ($PSBoundParameters.ContainsKey('PathOverride')) {
                $psi.EnvironmentVariables['PATH'] = $PathOverride
            }

            $process = [System.Diagnostics.Process]::Start($psi)
            $process.WaitForExit()

            $result = [pscustomobject]@{
                ExitCode = $process.ExitCode
                StdOut = $process.StandardOutput.ReadToEnd()
                StdErr = $process.StandardError.ReadToEnd()
            }

            $process.Dispose()
            return $result
        }
    }

    Context 'tooling validation' {
        It 'succeeds when required tooling is present' {
            $tempDir = Join-Path -Path ([IO.Path]::GetTempPath()) -ChildPath ([Guid]::NewGuid().ToString())
            New-Item -ItemType Directory -Path $tempDir | Out-Null

            try {
                # Run setup.ps1 with real system tools (node, npm, pnpm, specify)
                # Prepend empty temp dir to PATH to ensure PATH passing works
                $result = & $script:InvokeSetupScript $script:scriptPath ($tempDir + ';' + $env:PATH)
                $combined = $result.StdOut + $result.StdErr

                $result.ExitCode | Should -Be 0
                $combined | Should -Match 'pnpm .+: \d+\.\d+\.\d+'
                $combined | Should -Match 'Repo ready'
            }
            finally {
                Remove-Item -Path $tempDir -Recurse -Force -ErrorAction SilentlyContinue
            }
        }
    }
}
