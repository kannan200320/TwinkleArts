# PowerShell script to inject theme check script into the <head> of all HTML pages

$themeCheckScript = @'
<head>
  <script>
    if (localStorage.getItem('color-theme') === 'dark' || (!('color-theme' in localStorage) && window.matchMedia('(prefers-color-scheme: dark)').matches)) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  </script>
'@

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    
    $content = [System.IO.File]::ReadAllText($filePath)
    
    # Avoid duplicate injections
    if (-not $content.Contains("localStorage.getItem('color-theme')")) {
        $content = $content -replace '<head>', $themeCheckScript
        [System.IO.File]::WriteAllText($filePath, $content)
        Write-Host "Injected theme check in: $name"
    } else {
        Write-Host "Theme check already present in: $name"
    }
}
