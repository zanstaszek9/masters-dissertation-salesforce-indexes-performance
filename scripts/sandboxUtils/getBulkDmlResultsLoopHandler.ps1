# .\scripts\sandboxUtils\getBulkDmlResultsLoopHandler.ps1 -j 750d10000018z92AAA

param (
    [Alias("j")][string]$jobId
)

$jobResult = ./scripts/sandboxUtils/getBulkDmlResults.ps1 -j $jobId
$tries = 0

Write-Warning "getBulkDmlResultsLoopHandler: $jobId."

while ($jobResult.state -ne "JobComplete") {
    if ($jobResult.state -eq "Failed") {
        Write-Warning "Job Failed! Bulk DML Check. JobId: $jobId."
        Write-Warning "Error for Bulk DML Check. Failed Job: $jobResult."
        throw "Error for Bulk DML Check"
    }

    if ($tries -ge 20) {
        Write-Warning "Error for Bulk DML Check. Exceeded 20 tries. JobId: $jobId."
        Write-Warning "Error for Bulk DML Check. Exceeded 20 tries. Last Job: $jobResult."
        throw "Error for Bulk DML Check"
    }
    Start-Sleep -Seconds (60*2)
    $tries += 1
    $jobResult = ./scripts/sandboxUtils/getBulkDmlResults.ps1 -j $jobId
}

return $jobResult