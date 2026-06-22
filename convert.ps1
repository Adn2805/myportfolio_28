$photoPath = "C:\Users\admin\.gemini\antigravity\brain\9aae2a2c-ff29-42c1-8a1e-6a129124cbd4\media__1782151926405.jpg"
$outPath = "C:\Users\admin\.gemini\antigravity\scratch\adnan-portfolio\photo_b64.txt"
$photoBytes = [System.IO.File]::ReadAllBytes($photoPath)
$b64 = [System.Convert]::ToBase64String($photoBytes)
[System.IO.File]::WriteAllText($outPath, $b64)
Write-Host "Done. Length: $($b64.Length)"
