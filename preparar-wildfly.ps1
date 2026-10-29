$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$runtime = Join-Path $root '.runtime\run'
$archive = Join-Path $runtime 'wildfly-ee-10-41.0.1.Final.zip'
$server = Join-Path $runtime 'wildfly-ee-10-41.0.1.Final'
$url = 'https://github.com/wildfly/wildfly/releases/download/41.0.1.Final/wildfly-ee-10-41.0.1.Final.zip'
New-Item -ItemType Directory -Path $runtime -Force | Out-Null
if (-not (Test-Path (Join-Path $server 'bin\standalone.bat'))) {
  if (-not (Test-Path $archive)) { Write-Host 'Descargando WildFly EE 10 41.0.1...'; Invoke-WebRequest -Uri $url -OutFile $archive }
  Expand-Archive -LiteralPath $archive -DestinationPath $runtime -Force
}
Write-Host "WildFly listo en $server"
