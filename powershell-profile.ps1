Del Alias:ls
Set-Alias -Name ls -Value "C:\bin\eza"

oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\apple.omp.json | Invoke-Expression

function LL {
    & "C:\bin\eza.exe" -la @args
}

function fzf-p {
    fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"
}

function fzf-h {
    $item = Get-History |
        Sort-Object Id -Descending |
        ForEach-Object { $_.CommandLine } |
        fzf --tac --prompt="History> " --preview "echo {}"

    if ($item) {
        # Insert the result back into the prompt buffer
        Set-Clipboard $item
        Write-Host "`nPasted to clipboard (Ctrl+V to run):`n$item"
    }
}

function fzf-fh {
    # Path to PSReadLine persistent history
    $histFile = (Get-PSReadLineOption).HistorySavePath

    if (-not (Test-Path $histFile)) {
        Write-Warning "No PSReadLine history file found."
        return
    }

    # Read full history (unique + oldest→newest)
    $commands = Get-Content $histFile | Select-Object -Unique

    $selection = $commands |
        fzf --prompt="History> " `
            --tac `
            --preview "echo {}"

    if ($selection) {
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert($selection)
    }
}