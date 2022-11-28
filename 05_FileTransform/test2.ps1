param ($input1, $input2)
Write-Host "$input1 $input2"
Out-File $(Build.SourcesDirectory)\05_FileTransform\NewFile.txt