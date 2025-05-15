param(
    [string]$modifierText,
    [string]$commitMessage = "Updated modifier schema"
)

Set-Location -Path "C:\Users\rudol\brandonthomasdardano-pif"

$schemaPath = "modifierschema.md"
Add-Content -Path $schemaPath -Value "`n$modifierText"

git add $schemaPath
git commit -m $commitMessage
git push origin main

Start-Process "https://github.com/Sesquii/brandonthomasdardano-pif"
