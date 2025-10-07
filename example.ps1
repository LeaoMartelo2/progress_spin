Import-Module .\progress_spin.psm1 

# load the module setup
load_progress_spin

# optionally configure it to your liking
$global:pg_spin_progress_chars = @('|', '\', '-', '/')
$global:pg_spin_update_ms = 200

# any setting can be changed like this. See README.md for more info


# start a async job 
$job = Start-Job -ScriptBlock{
    Start-Sleep -Seconds 10
}

Write-Host "Not hanging, doing async job"
$progress_message = "Performing Task"
while($job.State -eq 'Running'){
    write_progress -ProgressMessage $progress_message
}

$a = Wait-Job $job

progress_completed -ProgressMessage $progress_message
