$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$server = Join-Path $root '.runtime\run\wildfly-ee-10-41.0.1.Final'
$maven = Join-Path $root '.runtime\apache-maven-3.10.0\bin\mvn.cmd'
$url = 'http://127.0.0.1:8080/ejb-demo/app'
Push-Location $root
try {
  & $maven -B clean package
  if ($LASTEXITCODE -ne 0) { throw "Maven terminó con código $LASTEXITCODE." }
  Copy-Item (Join-Path $root 'target\ejb-demo.war') (Join-Path $server 'standalone\deployments\ejb-demo.war') -Force
  New-Item -ItemType File -Path (Join-Path $server 'standalone\deployments\ejb-demo.war.dodeploy') -Force | Out-Null
  Start-Sleep -Seconds 8
  $response = Invoke-WebRequest -Uri $url -UseBasicParsing -TimeoutSec 10
  if ($response.StatusCode -ne 200) { throw "WildFly respondió HTTP $($response.StatusCode)." }
  Write-Host "Aplicación actualizada: $url"
} finally { Pop-Location }
