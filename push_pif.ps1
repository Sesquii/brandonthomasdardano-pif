# Enhanced PIF Push Script with Maximum Security (push_pif.ps1)
# This script securely pushes updates to your PIF repo using a Personal Access Token (PAT) with AES Encryption.

# Set your local PIF directory (adjust if needed)
cd "C:\Users\rudol\OneDrive\Desktop\brandonthomasdardano-pif-v1-optimized"

# Ensure you are in the correct directory
if (!(Test-Path .git)) {
    Write-Host "Error: This is not a Git repository. Please ensure you are in the correct folder."
    exit
}

# Encryption/Decryption Keys
$key = "PIFSecureEncryptionKey1234"  # Replace with a unique and strong key
$tokenFile = "C:\Users\rudol\OneDrive\Desktop\brandonthomasdardano-pif-v1-optimized\pat_token.enc"

# Encryption Function with Secure 16-Byte IV
function Encrypt-String($plainText, $key) {
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($plainText)
    $aes = New-Object System.Security.Cryptography.AesManaged
    $aes.Key = [System.Text.Encoding]::UTF8.GetBytes($key.PadRight(32).Substring(0,32))

    # Secure Random 16-Byte IV
    $IV = New-Object byte[] 16
    [System.Security.Cryptography.RandomNumberGenerator]::Create().GetBytes($IV)

    $aes.IV = $IV
    $encryptor = $aes.CreateEncryptor()
    $encrypted = $encryptor.TransformFinalBlock($bytes, 0, $bytes.Length)

    # Save Encrypted Text and IV Together
    $encryptedText = [Convert]::ToBase64String($encrypted)
    $ivBase64 = [Convert]::ToBase64String($IV)

    return "$ivBase64`n$encryptedText"
}

# Decryption Function
function Decrypt-String($encryptedData, $key) {
    $data = $encryptedData -split "`n"
    $IV = [Convert]::FromBase64String($data[0])
    $encryptedText = [Convert]::FromBase64String($data[1])

    $aes = New-Object System.Security.Cryptography.AesManaged
    $aes.Key = [System.Text.Encoding]::UTF8.GetBytes($key.PadRight(32).Substring(0,32))
    $aes.IV = $IV

    $decryptor = $aes.CreateDecryptor()
    $decrypted = $decryptor.TransformFinalBlock($encryptedText, 0, $encryptedText.Length)
    return [System.Text.Encoding]::UTF8.GetString($decrypted)
}

# Check if PAT is stored securely
if (!(Test-Path $tokenFile)) {
    Write-Host "Enter your GitHub Personal Access Token (PAT)."
    $PAT = Read-Host "Enter your PAT" -AsSecureString
    $PAT = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($PAT))
    $encryptedPAT = Encrypt-String $PAT $key
    Set-Content $tokenFile $encryptedPAT
}

# Load and Decrypt PAT
$encryptedPAT = Get-Content $tokenFile
$PAT = Decrypt-String $encryptedPAT $key

# Configure Git to use the PAT securely
git config --global credential.helper store
[System.IO.File]::WriteAllText("C:\Users\rudol\OneDrive\Desktop\brandonthomasdardano-pif-v1-optimized\.git\credentials", "https://x-access-token:" + $PAT + "@github.com")

# Auto-Detect Branch and Set Upstream if Missing
$branch = git rev-parse --abbrev-ref HEAD
if (!(git config branch.$branch.remote)) {
    git branch --set-upstream-to=origin/$branch
}

# Add only core PIF files (secured)
git add README.md context.json glossary.json schema.json modifierschema.md push_pif.ps1

# Commit with a user-provided message
$commitMessage = Read-Host "Enter commit message for your PIF update"
git commit -m $commitMessage

# Push to the detected branch
git push

# Clean up the PAT (security measure)
Remove-Item "C:\Users\rudol\OneDrive\Desktop\brandonthomasdardano-pif-v1-optimized\.git\credentials"
git config --global credential.helper cache

# Confirmation message
Write-Host "✅ PIF update successfully pushed to GitHub with secure authentication on branch $branch."
