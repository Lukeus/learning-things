$ErrorActionPreference = 'Stop'

Describe 'scripts/setup.ps1' {
    $scriptsDir = Split-Path -Path $PSScriptRoot -Parent
    $scriptPath = Join-Path -Path $scriptsDir -ChildPath 'setup.ps1'

    function Invoke-SetupScript {
        param(
            [string]$PathOverride
        )

        $psi = New-Object System.Diagnostics.ProcessStartInfo
        $psi.FileName = 'pwsh'
        $psi.Arguments = "-NoLogo -NoProfile -File `"$scriptPath`""
        $psi.UseShellExecute = $false
        $psi.RedirectStandardOutput = $true
        $psi.RedirectStandardError = $true

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

    Context 'tooling validation' {
        It 'fails with exit code 1 when Node.js is missing' {
            $result = Invoke-SetupScript -PathOverride ''
            $combined = $result.StdOut + $result.StdErr

            $result.ExitCode | Should Be 1
            $combined | Should Match 'Node\.js not found'
        }

        It 'succeeds when required tooling is present' {
            $tempDir = Join-Path -Path ([IO.Path]::GetTempPath()) -ChildPath ([Guid]::NewGuid().ToString())
            New-Item -ItemType Directory -Path $tempDir | Out-Null

            try {
                Set-Content -Path (Join-Path $tempDir 'node.cmd') -Value @(
                    '@echo off'
                    'echo node stub'
                ) -Encoding ASCII

                Set-Content -Path (Join-Path $tempDir 'npm.cmd') -Value @(
                    '@echo off'
                    'echo npm stub'
                ) -Encoding ASCII

                Set-Content -Path (Join-Path $tempDir 'pnpm.cmd') -Value @(
                    '@echo off'
                    'if "%1"=="-v" ('
                    '  echo 9.0.0'
                    ') else ('
                    '  echo pnpm stub'
                    ')'
                ) -Encoding ASCII

                Set-Content -Path (Join-Path $tempDir 'specify.cmd') -Value @(
                    '@echo off'
                    'if "%1"=="--version" ('
                    '  echo 1.2.3'
                    ') else ('
                    '  echo specify stub'
                    ')'
                ) -Encoding ASCII

                $result = Invoke-SetupScript -PathOverride ($tempDir + ';' + $env:PATH)
                $combined = $result.StdOut + $result.StdErr

                $result.ExitCode | Should Be 0
                $combined | Should Match 'pnpm \(pnpm\): 9\.0\.0'
                $combined | Should Match 'GitHub Spec Kit: 1\.2\.3'
                $combined | Should Match 'Repo ready'
            }
            finally {
                Remove-Item -Path $tempDir -Recurse -Force
            }
        }
    }
}
