function main {
  $working_xml = "$env:SystemDrive\tools\cmder\config\user-ConEmu.xml"
  $repo_xml = "$PSScriptRoot\..\user-ConEmu.xml"

  Write-Host "Copying working preferences from: $working_xml"
  Copy-Item -Force "$working_xml" "$repo_xml"
  Write-Host "Updated XML in user-ConEmu.xml"
  Write-Host "Run: ``git diff`` to see changes."
}

main
