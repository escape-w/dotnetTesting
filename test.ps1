Write-Host "Hello World"
          
$configurationTable = @{
  abc = 'buffalorun'
  xyz = 'macusooke'
mnc = 'default'
}

get-childitem

$folders=$(git diff HEAD HEAD~ --name-only  |%{Split-Path $_ -Parent }| %{Split-Path $_ -Leaf})

$jsonObject = @{}

foreach ($folder in $folders) {
  if ($configurationTable.ContainsKey($folder)) {
      Write-Output "$folder exists in the hashtable with value $($configurationTable[$folder])"
    $jsonObject[$folder] = @{
          'conf' = $configurationTable[$folder]
      }
  } else {
      Write-Output "$folder does not exist in the hashtable"
  }
}


$jsonContent = $jsonObject | ConvertTo-Json -Depth 100

write-host "$jsonContent"

Write-Host "##vso[task.setvariable variable=targets;isOutput=true]$jsonContent "
