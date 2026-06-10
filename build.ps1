$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$indexPath = Join-Path $root 'index.html'
$sectionNames = @('home', 'about', 'portfolio', 'certificates', 'services', 'contact')

$index = [System.IO.File]::ReadAllText($indexPath, [System.Text.Encoding]::UTF8)

foreach ($name in $sectionNames) {
  $sectionPath = Join-Path $root "sections\$name\section.html"
  $section = [System.IO.File]::ReadAllText($sectionPath, [System.Text.Encoding]::UTF8).Trim()
  $marker = "<!-- Section source: sections/$name/section.html -->"
  $pattern = "(?s)<!-- Section source: sections/$name/section\.html -->\s*<section id=`"$name`">.*?</section>"
  $replacement = $marker + [Environment]::NewLine + $section
  $index = [regex]::Replace($index, $pattern, [System.Text.RegularExpressions.MatchEvaluator]{ param($m) $replacement }, 1)
}

[System.IO.File]::WriteAllText($indexPath, $index, [System.Text.UTF8Encoding]::new($false))
Write-Host "Rebuilt index.html from section files."
