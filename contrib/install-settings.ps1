function main {
  $repo="https://raw.githubusercontent.com/fnichol/windows-cmder-settings"

  $xml = "user-ConEmu.xml"
  $xml_url = "$repo/master/$xml"
  $new_xml = [System.IO.Path]::GetTempFileName()
  $installed_xml = "$env:SystemDrive\tools\cmder\config\$xml"

  Check-ForCmder

  Write-Host "Downloading XML from $xml_url"
  Invoke-WebRequest -Uri "$xml_url" -OutFile "$new_xml" -UseBasicParsing
  Copy-Item -Force "$new_xml" "$installed_xml"
  Remove-Item "$new_xml"
  Write-Host "cmder preferences installed or updated in $installed_xml."
}

function Check-ForCmder {
  $cmder_process = Get-Process ConEmu64 -ErrorAction SilentlyContinue

  if ($cmder_process) {
    Write-Warning "You appear to have cmder or ConEmu currently running. Please"
    Write-Warning "quit the application so your updates won't get overridden"
    Write-Warning "on quit."
    Write-Error "cmder cannot be running"
    exit 1
  }
}

main
