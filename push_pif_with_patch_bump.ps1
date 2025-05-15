param (
    [string]$commitMessage = "Patch update of PIF modifiers"
)

# File where the version is stored (adjust if needed)
$versionFile = "modifierschema.md"

# Read file content
$content = Get-Content $versionFile

# Regex to find version string like v1.2.3
$versionRegex = "v(\d+)\.(\d+)\.(\d+)"

# Extract current version
if ($content -match $versionRegex) {
    $major = [int]$matches[1]
    $minor = [int]$matches[2]
    $patch = [int]$matches[3]

    # Increment patch version
    $patch++

    $newVersion = "v$major.$minor.$patch"

    # Replace old version with new version in content
    $newContent = $content -replace $versionRegex, $newVersion

    # Write back to file
    Set-Content -Path $versionFile -Value $newContent

    Write-Host "Version bumped to $newVersion"
} else {
    Write-Host "Version string not found in $versionFile."
    exit 1
}

# Git commands
git add .
git commit -m "$commitMessage ($newVersion)"
git push origin main
