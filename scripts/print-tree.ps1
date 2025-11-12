#!/usr/bin/env pwsh
$ErrorActionPreference = "Stop"

# Check if tree command is available
if (Get-Command tree -ErrorAction SilentlyContinue) {
    # On Windows, tree.com is built-in but has different syntax
    tree /F /A
} else {
    # Fallback: use Get-ChildItem recursively
    Get-ChildItem -Recurse -Exclude node_modules | 
        Where-Object { $_.FullName -notmatch 'node_modules' } |
        ForEach-Object {
            $indent = "  " * (($_.FullName.Replace($PWD.Path, "").Split([IO.Path]::DirectorySeparatorChar).Count) - 2)
            "$indent$($_.Name)"
        }
}
