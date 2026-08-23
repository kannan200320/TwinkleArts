# PowerShell script to inject missing custom colors (black-deep, black-light, gray-850, slate-905) into tailwind.config across all HTML pages

$targetBlock = @'
          colors: {
            magenta: {
              DEFAULT: '#91117a',
              hover: '#730d61',
              light: '#b01a95',
            },
            darknavy: {
              DEFAULT: '#000000',
              light: '#111111',
              deep: '#000000',
            }
          }
'@

$replacementBlock = @'
          colors: {
            magenta: {
              DEFAULT: '#91117a',
              hover: '#730d61',
              light: '#b01a95',
            },
            darknavy: {
              DEFAULT: '#000000',
              light: '#111111',
              deep: '#000000',
            },
            black: {
              deep: '#0a0a0a',
              light: '#171717',
              DEFAULT: '#000000',
            },
            gray: {
              850: '#202020',
            },
            slate: {
              905: '#0f172a',
            }
          }
'@

Get-ChildItem -Filter *.html | ForEach-Object {
    $filePath = $_.FullName
    $name = $_.Name
    
    $content = [System.IO.File]::ReadAllText($filePath)
    
    # Try literal match first
    if ($content.Contains($targetBlock)) {
        $content = $content.Replace($targetBlock, $replacementBlock)
        [System.IO.File]::WriteAllText($filePath, $content)
        Write-Host "Updated color config via literal match in: $name"
    } else {
        # Fallback to regex in case of slight spacing differences
        $regexPattern = '(?s)colors:\s*\{\s*magenta:\s*\{.*?darknavy:\s*\{.*?deep:\s*.*?\}\s*\}'
        $regexReplacement = @'
colors: {
            magenta: {
              DEFAULT: '#91117a',
              hover: '#730d61',
              light: '#b01a95',
            },
            darknavy: {
              DEFAULT: '#000000',
              light: '#111111',
              deep: '#000000',
            },
            black: {
              deep: '#0a0a0a',
              light: '#171717',
              DEFAULT: '#000000',
            },
            gray: {
              850: '#202020',
            },
            slate: {
              905: '#0f172a',
            }
          }
'@
        if ($content -match $regexPattern) {
            $content = [System.Text.RegularExpressions.Regex]::Replace($content, $regexPattern, $regexReplacement)
            [System.IO.File]::WriteAllText($filePath, $content)
            Write-Host "Updated color config via regex in: $name"
        } else {
            Write-Warning "Could not match tailwind colors block in: $name"
        }
    }
}
