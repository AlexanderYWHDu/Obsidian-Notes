# sync.ps1 - Obsidian Vault Git Sync
# 主 vault (Obsidian-Notes) 由 obsidian-git 插件自动管理
# 本脚本专门负责同步 Daily/ → 私有仓库 Obsidian-Personal

$vaultRoot = $PSScriptRoot
$dailyPath = Join-Path $vaultRoot "Daily"
$timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm'

function Sync-Repo {
    param (
        [string]$Path,
        [string]$Name
    )

    Write-Host ""
    Write-Host "=== Syncing $Name ===" -ForegroundColor Cyan

    if (-not (Test-Path "$Path\.git")) {
        Write-Host "  [SKIP] No .git found in $Path" -ForegroundColor Yellow
        return
    }

    Set-Location $Path

    # Pull latest first to avoid conflicts
    git pull --rebase 2>&1 | Out-Host

    $status = git status --porcelain
    if (-not $status) {
        Write-Host "  [OK] Nothing to commit." -ForegroundColor Green
        return
    }

    git add .
    git commit -m "daily backup: $timestamp"
    git push

    if ($LASTEXITCODE -eq 0) {
        Write-Host "  [OK] Pushed successfully." -ForegroundColor Green
    } else {
        Write-Host "  [ERROR] Push failed. Check your network or credentials." -ForegroundColor Red
    }
}

# 同步私有日记仓库 Daily/ → Obsidian-Personal
Sync-Repo -Path $dailyPath -Name "Daily (Obsidian-Personal)"

Write-Host ""
Write-Host "Done! 主 vault 由 obsidian-git 插件自动管理，无需手动 sync。" -ForegroundColor Green
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
