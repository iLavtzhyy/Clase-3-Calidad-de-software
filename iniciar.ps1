$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$server = Join-Path $root '.runtime\run\wildfly-ee-10-41.0.1.Final'
$jdk = Join-Path $root '.runtime\jdk17\jdk-17.0.20.1+1'
$maven = Join-Path $root '.runtime\apache-maven-3.10.0\bin\mvn.cmd'
if (-not (Test-Path (Join-Path $server 'bin\standalone.bat'))) { throw 'No está instalado WildFly. Ejecuta primero preparar-wildfly.ps1.' }
$env:JAVA_HOME = (Resolve-Path $jdk).Path
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$env:TEMP = 'C:\Windows\Temp'
$env:TMP = $env:TEMP
Push-Location $root
try {
  & $maven -B clean package
  if ($LASTEXITCODE -ne 0) { throw "Maven terminó con código $LASTEXITCODE." }
  Copy-Item (Join-Path $root 'target\ejb-demo.war') (Join-Path $server 'standalone\deployments\ejb-demo.war') -Force
  & (Join-Path $server 'bin\standalone.bat') -c standalone.xml
} finally { Pop-Location }
