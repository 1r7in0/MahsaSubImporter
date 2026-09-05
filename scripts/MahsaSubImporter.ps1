# MahsaSubImporter.ps1
# Automatically fetch the latest MahsaNet free configs and copy them to clipboard for v2rayN

param(
    [ValidateSet("mci", "mtn", "both")]
    [string]$Source = "both"
)

$ErrorActionPreference = "Stop"

Write-Host "`n=== MahsaSubImporter ===" -ForegroundColor Cyan
Write-Host "Fetching latest MahsaNet free configs...`n"

$baseUrl = "https://raw.githubusercontent.com/mahsanet/MahsaFreeConfig/main"
$files = @()

if ($Source -eq "mci" -or $Source -eq "both") {
    $files += "$baseUrl/mci/sub_1.txt"
    $files += "$baseUrl/mci/sub_2.txt"
    $files += "$baseUrl/mci/sub_3.txt"
    $files += "$baseUrl/mci/sub_4.txt"
}

if ($Source -eq "mtn" -or $Source -eq "both") {
    $files += "$baseUrl/mtn/sub_1.txt"
    $files += "$baseUrl/mtn/sub_2.txt"
    $files += "$baseUrl/mtn/sub_3.txt"
    $files += "$baseUrl/mtn/sub_4.txt"
}

$allLinks = [System.Collections.Generic.List[string]]::new()

foreach ($url in $files) {
    try {
        Write-Host "Downloading: $url" -ForegroundColor DarkGray
        $base64 = Invoke-RestMethod -Uri $url -TimeoutSec 15

        if ([string]::IsNullOrWhiteSpace($base64)) { continue }

        $decoded = [System.Text.Encoding]::UTF8.GetString(
            [System.Convert]::FromBase64String($base64.Trim())
        )

        $lines = $decoded -split "`n" | ForEach-Object { $_.Trim() } | Where-Object { $_ -match '^(vmess|vless|ss|trojan|hysteria|hy2|tuic)://' }

        foreach ($line in $lines) {
            if (-not $allLinks.Contains($line)) {
                $allLinks.Add($line)
            }
        }
    }
    catch {
        Write-Host "  Failed to fetch $url" -ForegroundColor Yellow
    }
}

if ($allLinks.Count -eq 0) {
    Write-Host "`nNo configs found. Check your internet connection or try again later." -ForegroundColor Red
    exit 1
}

# Join all links with newlines
$clipboardContent = $allLinks -join "`n"

# Copy to clipboard
Set-Clipboard -Value $clipboardContent

Write-Host "`nSuccessfully fetched $($allLinks.Count) unique configs." -ForegroundColor Green
Write-Host "Configs have been copied to your clipboard.`n" -ForegroundColor Green

Write-Host "Next steps:" -ForegroundColor Cyan
Write-Host "1. Open v2rayN"
Write-Host "2. Go to:  Configurations  →  Import Share Links from Clipboard"
Write-Host "   (or use the keyboard shortcut if you have one set)"
Write-Host "3. The configs will be imported.`n"

Write-Host "Tip: You can also run the script with a specific source:" -ForegroundColor DarkGray
Write-Host "  .\MahsaSubImporter.ps1 -Source mci"
Write-Host "  .\MahsaSubImporter.ps1 -Source mtn"
Write-Host "  .\MahsaSubImporter.ps1 -Source both   (default)`n"
