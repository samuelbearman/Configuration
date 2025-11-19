Del Alias:ls
Set-Alias -Name ls -Value "C:\bin\eza"

# oh-my-posh init pwsh --config $env:POSH_THEMES_PATH\craver.omp.json | Invoke-Expression
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
        fzf --tac --prompt="History> "

    if ($item) {
        # Insert the result back into the prompt buffer
        Set-Clipboard $item
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

    if ($selection) {
        Set-Clipboard $selection
    }
}

Set-PSReadLineKeyHandler -Key Ctrl+r `
    -BriefDescription "FuzzyFullHistory" `
    -LongDescription "Search full PSReadLine history with fzf" `
    -ScriptBlock { fzf-fh }