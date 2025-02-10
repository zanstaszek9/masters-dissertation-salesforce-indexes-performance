$insertData = ./scripts/dataInsertion/insertData.ps1


$jobId = ($insertData[1]-split ' ' )[1]


$result = sf data upsert resume --job-id $jobId -o stanislaw.zan@mindful-bear-ur0tdg.com --json

#(| ConvertFrom-Json).result.jobInfo.totalProcessingTime #Getting JSON data

return $result


