$script:index = 0
$script:Reset = "`e[0m"

$global:pg_spin_progress_chars = @('/', '-', '\', '|')
$global:pg_spin_progress_chars_color = "`e[93m"
$global:pg_spin_progress_completed_color = "`e[32m"
$global:pg_spin_update_ms = 100

function load_progress_spin {

$script:index = 0
$script:Reset = "`e[0m"


$global:pg_spin_progress_chars = @('/', '-', '\', '|')
$global:pg_spin_progress_chars_color = "`e[93m"
$global:pg_spin_progress_completed_color = "`e[32m"
$global:pg_spin_update_ms = 100


}

function write_progress {
    param([string]$ProgressMessage)

    $msg = "`r$($ProgressMessage) "
    $msg += "${global:pg_spin_progress_chars_color}$($global:pg_spin_progress_chars[$script:index])${Reset}"

    Write-Host -NoNewLine "${msg}"
    Start-Sleep -Milliseconds $global:pg_spin_update_ms

    $script:index = ($script:index + 1) % $global:pg_spin_progress_chars.Count
}

function progress_completed {
    param([string]$ProgressMessage)

    $msg = "`r$($ProgressMessage) "
    $msg += "${global:pg_spin_progress_completed_color}" + ([Char]8730) + "${script:Reset}"
    #                                                             ^ checkmark symbol
    
    Write-Host "${msg}"
}


Export-ModuleMember -Function write_progress
Export-ModuleMember -Function progress_completed
Export-ModuleMember -Function load_progress_spin
