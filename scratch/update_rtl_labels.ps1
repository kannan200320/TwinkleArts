# PowerShell script to replace RTL (Arabic) with RTL across all HTML files

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    $content = [System.IO.File]::ReadAllText($filePath)
    
    $content = $content -replace 'RTL \(Arabic\)', 'RTL'
    
    [System.IO.File]::WriteAllText($filePath, $content)
    Write-Host "Updated RTL labels in: $name"
}
