# PowerShell script to solidify the mobile menu drawer and remove the glassy blur effect

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    
    if ($name -eq "dashboard.html" -or $name -eq "login-register.html") {
        return
    }
    
    $content = [System.IO.File]::ReadAllText($filePath)
    
    # 1. Remove backdrop blur and increase black overlay opacity
    $content = $content -replace 'bg-black/50 backdrop-blur-sm', 'bg-black/60'
    
    # 2. Set dark background of drawer to solid neutral-900
    $content = $content -replace 'bg-white dark:bg-darknavy p-6 shadow-2xl', 'bg-white dark:bg-neutral-900 p-6 shadow-2xl'
    
    [System.IO.File]::WriteAllText($filePath, $content)
    Write-Host "Solidified mobile drawer in: $name"
}
