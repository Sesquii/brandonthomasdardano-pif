# push_pif.ps1
# Script to add, commit, and push changes to GitHub repo

param(
    [string]$commitMessage = "Update PIF schema"
)

Write-Host "Staging all changes..."
git add .

Write-Host "Committing changes with message: '$commitMessage'"
git commit -m $commitMessage

Write-Host "Pushing to origin main branch..."
git push origin main

Write-Host "Done."
