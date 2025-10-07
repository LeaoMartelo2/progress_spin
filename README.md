# progress spin

A simple Microsoft Powershell 7+ ([pwsh.exe](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell-on-windows?view=powershell-7.5)) module for a spinning progress bar so I dont need to keep re-implementing it every time

<img align="center" src="readme/slash_spin.gif"/>

> [!WARNING]
> I don't daily drive Windows, neither a powershell expert
> this follows no guidelines, or best practices, make of that what you will.

## Usage

Usage is very simple, just copy the `progress_spin.psm1` file to your project and 
```powershell
Import-Module .\progress_spin.psm1 
```
Just read the example, configuring is very easy

### Configuration options

just replace add these lines to your script after `load_progress_spin` and change what you need

```ps1
$global:pg_spin_progress_chars = @('/', '-', '\', '|') # default character order, you can add more or less
$global:pg_spin_progress_chars_color = "`e[93m"        # light yellow
$global:pg_spin_progress_completed_color = "`e[32m"    # bright green
$global:pg_spin_update_ms = 100                        # how long does it take to update the char
```


