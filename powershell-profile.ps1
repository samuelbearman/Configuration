Del Alias:ls
Set-Alias -Name ls -Value "C:\bin\eza"

oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\apple.omp.json | Invoke-Expression