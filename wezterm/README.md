# WezTerm

## Install

Download the latest installer from the official site:
https://wezterm.org/install/windows.html

Choose: **Windows x64 MSI**

Install it like any normal Windows application.

## Verify

1. Open the Start Menu.
2. Search for `WezTerm`.
3. Open it.

## Configuration

To create and open the configuration file in VS Code, run the following in PowerShell:

```powershell
if (!(Test-Path "$HOME\.wezterm.lua")) {
    New-Item -Path "$HOME\.wezterm.lua" -ItemType File | Out-Null
}
code "$HOME\.wezterm.lua"
```

## Set Default Shell to WSL

Instead of opening PowerShell and then typing `wsl`, you can make Ubuntu launch directly.

Add this inside the Lua table in your `.wezterm.lua` configuration:

```lua
confg.default_prog = { "wsl.exe" }
```

Now WezTerm will start directly in Ubuntu.

## Set limit in wsl

```shell
powershell -Command "Set-Content -Path $env:USERPROFILE\.wslconfig -Value '[wsl2]', 'memory=10GB', 'processors=6', 'swap=4GB', 'pageReporting=true', 'autoMemoryReclaim=gradual'"

# Restart
wsl --shutdown
```