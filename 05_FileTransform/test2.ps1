(Get-Content $env:System_DefaultWorkingDirectory\05_FileTransform\test.txt) -replace 'environment','POC' | Out-File $env:System_DefaultWorkingDirectory\05_FileTransform\NewFile.txt