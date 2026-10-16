Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

[System.Windows.Forms.Application]::EnableVisualStyles()

$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = New-Object Security.Principal.WindowsPrincipal($identity)
$adminRole = [Security.Principal.WindowsBuiltInRole]::Administrator

if (-not $principal.IsInRole($adminRole)) {
    $scriptLocation = $MyInvocation.MyCommand.Definition
    if (-not $scriptLocation -and $PSCommandPath) {
        $scriptLocation = $PSCommandPath
    }
    if ($scriptLocation) {
        Start-Process -FilePath "powershell.exe" -ArgumentList "-NoProfile -ExecutionPolicy Bypass -File `"$scriptLocation`"" -Verb RunAs
        Exit
    }
}

$form = New-Object System.Windows.Forms.Form
$form.Text = "Windows 11 Debloater & Restore Tool - Made by lavenderpoet608"
$form.Size = New-Object System.Drawing.Size(660, 825)
$form.StartPosition = [System.Windows.Forms.FormStartPosition]::CenterScreen
$form.FormBorderStyle = [System.Windows.Forms.FormBorderStyle]::FixedDialog
$form.MaximizeBox = $false
$form.BackColor = [System.Drawing.Color]::FromArgb(245, 247, 250)
$form.Font = New-Object System.Drawing.Font("Segoe UI", 9)

$lblTitle = New-Object System.Windows.Forms.Label
$lblTitle.Location = New-Object System.Drawing.Point(20, 15)
$lblTitle.Size = New-Object System.Drawing.Size(380, 30)
$lblTitle.Text = "Windows 11 Debloater & Restore Tool"
$lblTitle.Font = New-Object System.Drawing.Font("Segoe UI", 14, [System.Drawing.FontStyle]::Bold)
$lblTitle.ForeColor = [System.Drawing.Color]::FromArgb(20, 20, 20)
$form.Controls.Add($lblTitle)

$lnkAuthor = New-Object System.Windows.Forms.LinkLabel
$lnkAuthor.Location = New-Object System.Drawing.Point(405, 20)
$lnkAuthor.Size = New-Object System.Drawing.Size(220, 25)
$lnkAuthor.Text = "Made by lavenderpoet608"
$lnkAuthor.TextAlign = [System.Drawing.ContentAlignment]::MiddleRight
$lnkAuthor.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$lnkAuthor.LinkColor = [System.Drawing.Color]::FromArgb(0, 120, 212)
$lnkAuthor.ActiveLinkColor = [System.Drawing.Color]::FromArgb(0, 90, 158)
$lnkAuthor.Add_Click({
    Start-Process "https://t.me/lavenderpoet608"
})
$form.Controls.Add($lnkAuthor)

$lblSub = New-Object System.Windows.Forms.Label
$lblSub.Location = New-Object System.Drawing.Point(22, 48)
$lblSub.Size = New-Object System.Drawing.Size(600, 22)
$lblSub.Text = "Pilih fitur optimasi yang diinginkan atau gunakan tombol Restore untuk memulihkan pengaturan."
$lblSub.ForeColor = [System.Drawing.Color]::FromArgb(100, 100, 100)
$form.Controls.Add($lblSub)

$grpOptions = New-Object System.Windows.Forms.GroupBox
$grpOptions.Location = New-Object System.Drawing.Point(20, 78)
$grpOptions.Size = New-Object System.Drawing.Size(605, 220)
$grpOptions.Text = "Pilihan Pembersihan & Optimasi"
$grpOptions.BackColor = [System.Drawing.Color]::White
$form.Controls.Add($grpOptions)

$chkRestorePoint = New-Object System.Windows.Forms.CheckBox
$chkRestorePoint.Location = New-Object System.Drawing.Point(20, 28)
$chkRestorePoint.Size = New-Object System.Drawing.Size(560, 24)
$chkRestorePoint.Text = "Buat System Restore Point (BeforeDebloat)"
$chkRestorePoint.Checked = $true
$grpOptions.Controls.Add($chkRestorePoint)

$chkEdge = New-Object System.Windows.Forms.CheckBox
$chkEdge.Location = New-Object System.Drawing.Point(20, 58)
$chkEdge.Size = New-Object System.Drawing.Size(560, 24)
$chkEdge.Text = "Uninstall Paksa Microsoft Edge & Blokir Update"
$chkEdge.Checked = $true
$grpOptions.Controls.Add($chkEdge)

$chkApps = New-Object System.Windows.Forms.CheckBox
$chkApps.Location = New-Object System.Drawing.Point(20, 88)
$chkApps.Size = New-Object System.Drawing.Size(560, 24)
$chkApps.Text = "Hapus Aplikasi Bawaan (Bloatware Windows 11)"
$chkApps.Checked = $true
$grpOptions.Controls.Add($chkApps)

$chkOneDrive = New-Object System.Windows.Forms.CheckBox
$chkOneDrive.Location = New-Object System.Drawing.Point(20, 118)
$chkOneDrive.Size = New-Object System.Drawing.Size(560, 24)
$chkOneDrive.Text = "Uninstall OneDrive Secara Menyeluruh"
$chkOneDrive.Checked = $true
$grpOptions.Controls.Add($chkOneDrive)

$chkTelemetry = New-Object System.Windows.Forms.CheckBox
$chkTelemetry.Location = New-Object System.Drawing.Point(20, 148)
$chkTelemetry.Size = New-Object System.Drawing.Size(560, 24)
$chkTelemetry.Text = "Matikan Telemetri, Iklan, Copilot & Widgets"
$chkTelemetry.Checked = $true
$grpOptions.Controls.Add($chkTelemetry)

$chkTemp = New-Object System.Windows.Forms.CheckBox
$chkTemp.Location = New-Object System.Drawing.Point(20, 178)
$chkTemp.Size = New-Object System.Drawing.Size(560, 24)
$chkTemp.Text = "Bersihkan File Temporary (Temp)"
$chkTemp.Checked = $true
$grpOptions.Controls.Add($chkTemp)

$btnSelectAll = New-Object System.Windows.Forms.Button
$btnSelectAll.Location = New-Object System.Drawing.Point(20, 312)
$btnSelectAll.Size = New-Object System.Drawing.Size(120, 36)
$btnSelectAll.Text = "Batal Pilih"
$btnSelectAll.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnSelectAll.BackColor = [System.Drawing.Color]::FromArgb(230, 233, 238)
$form.Controls.Add($btnSelectAll)

$btnDebloat = New-Object System.Windows.Forms.Button
$btnDebloat.Location = New-Object System.Drawing.Point(150, 312)
$btnDebloat.Size = New-Object System.Drawing.Size(230, 36)
$btnDebloat.Text = "Jalankan Pembersihan (Debloat)"
$btnDebloat.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnDebloat.BackColor = [System.Drawing.Color]::FromArgb(16, 124, 65)
$btnDebloat.ForeColor = [System.Drawing.Color]::White
$btnDebloat.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btnDebloat)

$btnRestore = New-Object System.Windows.Forms.Button
$btnRestore.Location = New-Object System.Drawing.Point(390, 312)
$btnRestore.Size = New-Object System.Drawing.Size(235, 36)
$btnRestore.Text = "Restore / Kembalikan Semua"
$btnRestore.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnRestore.BackColor = [System.Drawing.Color]::FromArgb(0, 120, 212)
$btnRestore.ForeColor = [System.Drawing.Color]::White
$btnRestore.Font = New-Object System.Drawing.Font("Segoe UI", 9, [System.Drawing.FontStyle]::Bold)
$form.Controls.Add($btnRestore)

$btnSysRestore = New-Object System.Windows.Forms.Button
$btnSysRestore.Location = New-Object System.Drawing.Point(20, 356)
$btnSysRestore.Size = New-Object System.Drawing.Size(605, 34)
$btnSysRestore.Text = "Buka System Restore Windows (rstrui.exe)"
$btnSysRestore.FlatStyle = [System.Windows.Forms.FlatStyle]::Flat
$btnSysRestore.BackColor = [System.Drawing.Color]::FromArgb(65, 65, 65)
$btnSysRestore.ForeColor = [System.Drawing.Color]::White
$form.Controls.Add($btnSysRestore)

$lblLog = New-Object System.Windows.Forms.Label
$lblLog.Location = New-Object System.Drawing.Point(20, 400)
$lblLog.Size = New-Object System.Drawing.Size(200, 20)
$lblLog.Text = "Status & Riwayat Log:"
$lblLog.ForeColor = [System.Drawing.Color]::FromArgb(50, 50, 50)
$form.Controls.Add($lblLog)

$txtLog = New-Object System.Windows.Forms.TextBox
$txtLog.Location = New-Object System.Drawing.Point(20, 424)
$txtLog.Size = New-Object System.Drawing.Size(605, 318)
$txtLog.Multiline = $true
$txtLog.ScrollBars = [System.Windows.Forms.ScrollBars]::Vertical
$txtLog.ReadOnly = $true
$txtLog.BackColor = [System.Drawing.Color]::FromArgb(28, 28, 28)
$txtLog.ForeColor = [System.Drawing.Color]::FromArgb(235, 235, 235)
$txtLog.Font = New-Object System.Drawing.Font("Consolas", 9)
$form.Controls.Add($txtLog)

$lnkFooter = New-Object System.Windows.Forms.LinkLabel
$lnkFooter.Location = New-Object System.Drawing.Point(20, 750)
$lnkFooter.Size = New-Object System.Drawing.Size(605, 24)
$lnkFooter.Text = "Made by lavenderpoet608  •  Telegram: https://t.me/lavenderpoet608"
$lnkFooter.TextAlign = [System.Drawing.ContentAlignment]::MiddleCenter
$lnkFooter.Font = New-Object System.Drawing.Font("Segoe UI", 9)
$lnkFooter.LinkColor = [System.Drawing.Color]::FromArgb(0, 120, 212)
$lnkFooter.ActiveLinkColor = [System.Drawing.Color]::FromArgb(0, 90, 158)
$lnkFooter.Add_Click({
    Start-Process "https://t.me/lavenderpoet608"
})
$form.Controls.Add($lnkFooter)

function Write-LogMessage {
    param([string]$Message)
    $currentTime = (Get-Date).ToString("HH:mm:ss")
    $txtLog.AppendText("[$currentTime] $Message`r`n")
    $txtLog.SelectionStart = $txtLog.Text.Length
    $txtLog.ScrollToCaret()
    [System.Windows.Forms.Application]::DoEvents()
}

function Set-ControlsState {
    param([bool]$Enabled)
    $btnDebloat.Enabled = $Enabled
    $btnRestore.Enabled = $Enabled
    $btnSelectAll.Enabled = $Enabled
    $btnSysRestore.Enabled = $Enabled
    $grpOptions.Enabled = $Enabled
    [System.Windows.Forms.Application]::DoEvents()
}

$btnSelectAll.Add_Click({
    $targetState = -not $chkRestorePoint.Checked
    $chkRestorePoint.Checked = $targetState
    $chkEdge.Checked = $targetState
    $chkApps.Checked = $targetState
    $chkOneDrive.Checked = $targetState
    $chkTelemetry.Checked = $targetState
    $chkTemp.Checked = $targetState
    if ($targetState) {
        $btnSelectAll.Text = "Batal Pilih"
    } else {
        $btnSelectAll.Text = "Pilih Semua"
    }
})

$btnSysRestore.Add_Click({
    Write-LogMessage "Membuka wizard System Restore Windows..."
    Start-Process "rstrui.exe"
})

$btnDebloat.Add_Click({
    Set-ControlsState $false
    Write-LogMessage "Memulai proses pembersihan dan optimasi Windows 11..."

    if ($chkRestorePoint.Checked) {
        Write-LogMessage "Membuat System Restore Point 'BeforeDebloat'..."
        try {
            Enable-ComputerRestore -Drive "C:\" -ErrorAction SilentlyContinue
            Checkpoint-Computer -Description "BeforeDebloat" -RestorePointType "MODIFY_SETTINGS" -ErrorAction Stop
            Write-LogMessage "System Restore Point berhasil dibuat."
        } catch {
            try {
                $srClass = [wmiclass]"\\localhost\root\default:SystemRestore"
                $srClass.CreateRestorePoint("BeforeDebloat", 0, 100) | Out-Null
                Write-LogMessage "System Restore Point dibuat via WMI."
            } catch {
                Write-LogMessage "Peringatan: Gagal membuat Restore Point ($($_.Exception.Message))."
            }
        }
    }

    if ($chkEdge.Checked) {
        Write-LogMessage "Menonaktifkan Startup Boost & Background Preloading Edge..."
        $edgePolMain = "HKLM:\SOFTWARE\Policies\Microsoft\Edge"
        if (-not (Test-Path $edgePolMain)) { New-Item -Path $edgePolMain -Force | Out-Null }
        Set-ItemProperty -Path $edgePolMain -Name "StartupBoostEnabled" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $edgePolMain -Name "BackgroundModeEnabled" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue

        $edgePreloadMain = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\Main"
        if (-not (Test-Path $edgePreloadMain)) { New-Item -Path $edgePreloadMain -Force | Out-Null }
        Set-ItemProperty -Path $edgePreloadMain -Name "AllowPrelaunch" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue

        $edgePreloadTab = "HKLM:\SOFTWARE\Policies\Microsoft\MicrosoftEdge\TabPreloader"
        if (-not (Test-Path $edgePreloadTab)) { New-Item -Path $edgePreloadTab -Force | Out-Null }
        Set-ItemProperty -Path $edgePreloadTab -Name "AllowTabPreloading" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue

        Write-LogMessage "Menghentikan seluruh proses Microsoft Edge & komponen terkait..."
        $edgeProcesses = @("msedge", "MicrosoftEdge*", "chredge", "edge", "msedgeupdate", "MicrosoftEdgeUpdate")
        foreach ($proc in $edgeProcesses) {
            Get-Process -Name $proc -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        }
        Start-Sleep -Seconds 1

        Write-LogMessage "Menghentikan & menonaktifkan layanan Edge Update..."
        $edgeServices = @("edgeupdate", "edgeupdatem", "MicrosoftEdgeElevationService")
        foreach ($srv in $edgeServices) {
            Get-Service -Name $srv -ErrorAction SilentlyContinue | Stop-Service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $srv -StartupType Disabled -ErrorAction SilentlyContinue
        }

        Write-LogMessage "Membuka proteksi uninstall Microsoft Edge pada Registry..."
        $systemAppsEdge = "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
        if (-not (Test-Path $systemAppsEdge)) {
            New-Item -Path $systemAppsEdge -ItemType Directory -Force -ErrorAction SilentlyContinue | Out-Null
        }
        New-Item -Path "$systemAppsEdge\MicrosoftEdge.exe" -ItemType File -Force -ErrorAction SilentlyContinue | Out-Null

        $devKeys = @(
            "HKLM:\SOFTWARE\Microsoft\EdgeUpdateDev",
            "HKLM:\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev"
        )
        foreach ($devKey in $devKeys) {
            if (-not (Test-Path $devKey)) { New-Item -Path $devKey -Force -ErrorAction SilentlyContinue | Out-Null }
            Set-ItemProperty -Path $devKey -Name "AllowUninstall" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
            Set-ItemProperty -Path $devKey -Name "CanContinueWithMissingUpdate" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
        }

        $edgeUninstallRegs = @(
            "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge",
            "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Microsoft Edge"
        )
        foreach ($regPath in $edgeUninstallRegs) {
            if (Test-Path $regPath) {
                Set-ItemProperty -Path $regPath -Name "NoRemove" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path $regPath -Name "NoModify" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path $regPath -Name "NoRepair" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path $regPath -Name "ForceRemove" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
                Set-ItemProperty -Path $regPath -Name "Delete" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
            }
        }

        $edgeDirCandidates = @(
            "${env:ProgramFiles(x86)}\Microsoft\Edge\Application",
            "$env:ProgramFiles\Microsoft\Edge\Application"
        )
        foreach ($baseDir in $edgeDirCandidates) {
            if (Test-Path $baseDir) {
                $installerSetups = Get-ChildItem -Path $baseDir -Filter "setup.exe" -Recurse -ErrorAction SilentlyContinue
                foreach ($setupItem in $installerSetups) {
                    if ($setupItem.FullName -like "*Installer\setup.exe") {
                        Write-LogMessage "Menjalankan uninstaller Edge: $($setupItem.FullName)"
                        Start-Process -FilePath $setupItem.FullName -ArgumentList "--uninstall --msedge --system-level --force-uninstall --delete-profile --verbose-logging" -Wait -WindowStyle Hidden
                    }
                }
            }
        }
        Start-Sleep -Seconds 2

        Write-LogMessage "Menghapus paket AppX Microsoft Edge (Windows 11)..."
        $edgeAppxNames = @(
            "Microsoft.MicrosoftEdge.Stable",
            "Microsoft.Edge.GameAssist",
            "Microsoft.EdgeDevtoolsPlugin",
            "Microsoft.MicrosoftEdgeDevToolsClient",
            "Microsoft.MicrosoftEdge"
        )
        foreach ($appxName in $edgeAppxNames) {
            Get-AppxPackage -AllUsers -Name "*$appxName*" -ErrorAction SilentlyContinue | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue
            Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$appxName*" -or $_.PackageName -like "*$appxName*" } | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null
        }

        Write-LogMessage "Membersihkan sisa folder & file instalasi Microsoft Edge..."
        foreach ($proc in @("msedge", "MicrosoftEdge*")) {
            Get-Process -Name $proc -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        }
        $edgeFoldersToClean = @(
            "${env:ProgramFiles(x86)}\Microsoft\Edge\Application",
            "$env:ProgramFiles\Microsoft\Edge\Application",
            "${env:ProgramFiles(x86)}\Microsoft\EdgeUpdate",
            "$env:ProgramData\Microsoft\EdgeUpdate",
            "$env:LocalAppData\Microsoft\Edge"
        )
        foreach ($folder in $edgeFoldersToClean) {
            if (Test-Path $folder) {
                Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
            }
        }

        Write-LogMessage "Menghapus shortcut Microsoft Edge dari Desktop, Start Menu & Taskbar..."
        $edgeShortcuts = @(
            "C:\Users\Public\Desktop\Microsoft Edge.lnk",
            "$env:USERPROFILE\Desktop\Microsoft Edge.lnk",
            "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk",
            "$env:APPDATA\Microsoft\Windows\Start Menu\Programs\Microsoft Edge.lnk",
            "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\Microsoft Edge.lnk",
            "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Microsoft Edge.lnk",
            "$env:APPDATA\Microsoft\Internet Explorer\Quick Launch\User Pinned\TaskBar\Tombstones\Microsoft Edge.lnk"
        )
        foreach ($shortcut in $edgeShortcuts) {
            if (Test-Path $shortcut) {
                Remove-Item -Path $shortcut -Force -ErrorAction SilentlyContinue
            }
        }

        Write-LogMessage "Menerapkan Registry Policy untuk memblokir instalasi ulang Edge..."
        $edgeUpdateKey = "HKLM:\SOFTWARE\Microsoft\EdgeUpdate"
        if (-not (Test-Path $edgeUpdateKey)) {
            New-Item -Path $edgeUpdateKey -Force | Out-Null
        }
        Set-ItemProperty -Path $edgeUpdateKey -Name "DoNotUpdateToEdgeWithChromium" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $edgeUpdateKey -Name "UpdaterExperimentationAndConfigurationServiceControl" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue

        $edgePoliciesKey = "HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"
        if (-not (Test-Path $edgePoliciesKey)) {
            New-Item -Path $edgePoliciesKey -Force | Out-Null
        }
        Set-ItemProperty -Path $edgePoliciesKey -Name "InstallDefault" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $edgePoliciesKey -Name "Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $edgePoliciesKey -Name "Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -Value 2 -Type DWord -Force -ErrorAction SilentlyContinue

        $edgeUpdateKey64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate"
        if (-not (Test-Path $edgeUpdateKey64)) { New-Item -Path $edgeUpdateKey64 -Force -ErrorAction SilentlyContinue | Out-Null }
        Set-ItemProperty -Path $edgeUpdateKey64 -Name "DoNotUpdateToEdgeWithChromium" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue

        $edgePoliciesKey64 = "HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate"
        if (-not (Test-Path $edgePoliciesKey64)) { New-Item -Path $edgePoliciesKey64 -Force -ErrorAction SilentlyContinue | Out-Null }
        Set-ItemProperty -Path $edgePoliciesKey64 -Name "InstallDefault" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $edgePoliciesKey64 -Name "Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue

        Write-LogMessage "Menonaktifkan tugas terjadwal pembaruan Edge..."
        Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { 
            ($_.TaskName -like "*MicrosoftEdgeUpdate*" -or $_.TaskName -like "*Edge*") -and $_.TaskName -notlike "*WebView*" 
        } | Disable-ScheduledTask -ErrorAction SilentlyContinue | Out-Null

        $edgeRemaining = (Test-Path "${env:ProgramFiles(x86)}\Microsoft\Edge\Application\msedge.exe") -or (Test-Path "$env:ProgramFiles\Microsoft\Edge\Application\msedge.exe")
        if (-not $edgeRemaining) {
            Write-LogMessage "SUKSES: Microsoft Edge berhasil dihapus sepenuhnya dan diblokir."
        } else {
            Write-LogMessage "Microsoft Edge telah di-uninstall. Jika masih ada file terkunci, silakan restart komputer."
        }
    }

    if ($chkApps.Checked) {
        Write-LogMessage "Menghapus aplikasi bawaan (bloatware)..."
        $bloatList = @(
            "Microsoft.BingNews",
            "Microsoft.BingWeather",
            "Microsoft.BingSearch",
            "Microsoft.BingFinance",
            "Microsoft.BingSports",
            "Clipchamp.Clipchamp",
            "Microsoft.549981C3F5F10",
            "Microsoft.Copilot",
            "Microsoft.GetHelp",
            "Microsoft.Getstarted",
            "Microsoft.MicrosoftSolitaireCollection",
            "Microsoft.MixedReality.Portal",
            "Microsoft.Office.OneNote",
            "Microsoft.OutlookForWindows",
            "Microsoft.People",
            "Microsoft.PowerAutomateDesktop",
            "Microsoft.SkypeApp",
            "Microsoft.Todos",
            "Microsoft.WindowsAlarms",
            "Microsoft.WindowsFeedbackHub",
            "Microsoft.WindowsMaps",
            "Microsoft.WindowsSoundRecorder",
            "Microsoft.ZuneMusic",
            "Microsoft.ZuneVideo",
            "MicrosoftTeams",
            "Microsoft.Teams",
            "Microsoft.Windows.DevHome"
        )

        foreach ($pkg in $bloatList) {
            $foundAppx = Get-AppxPackage -AllUsers -Name "*$pkg*" -ErrorAction SilentlyContinue
            $foundProv = Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*$pkg*" }
            if ($foundAppx -or $foundProv) {
                Write-LogMessage "Menghapus paket: $pkg"
                if ($foundAppx) { $foundAppx | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue }
                if ($foundProv) { $foundProv | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null }
            }
        }

        Write-LogMessage "Mendeteksi otomatis status Phone Link (Microsoft.YourPhone)..."
        $yourPhoneAppx = Get-AppxPackage -AllUsers -Name "*Microsoft.YourPhone*" -ErrorAction SilentlyContinue
        $yourPhoneProv = Get-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Where-Object { $_.DisplayName -like "*Microsoft.YourPhone*" }

        if ($yourPhoneAppx -or $yourPhoneProv) {
            $isPhoneLinked = $false

            $phoneProcesses = Get-Process -Name "PhoneExperienceHost", "YourPhone" -ErrorAction SilentlyContinue
            if ($phoneProcesses) {
                $isPhoneLinked = $true
            }

            $ypPkgDir = "$env:LocalAppData\Packages\Microsoft.YourPhone_8wekyb3d8bbwe"
            if (Test-Path $ypPkgDir) {
                $deviceCache = Get-ChildItem -Path $ypPkgDir -Recurse -Filter "*device*" -ErrorAction SilentlyContinue
                if ($deviceCache -and $deviceCache.Count -gt 0) {
                    $isPhoneLinked = $true
                }
                $settingsDat = "$ypPkgDir\Settings\settings.dat"
                if (Test-Path $settingsDat) {
                    if ((Get-Item $settingsDat -ErrorAction SilentlyContinue).Length -gt 65536) {
                        $isPhoneLinked = $true
                    }
                }
            }

            $mobKey = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Mobility"
            if (Test-Path $mobKey) {
                $phoneLinkSub = Get-ChildItem -Path $mobKey -ErrorAction SilentlyContinue
                if ($phoneLinkSub -and $phoneLinkSub.Count -gt 0) {
                    $isPhoneLinked = $true
                }
            }

            if ($isPhoneLinked) {
                Write-LogMessage "Auto-detect: Phone Link terdeteksi aktif/terhubung dengan smartphone. Aplikasi dipertahankan (tidak dihapus)."
            } else {
                Write-LogMessage "Auto-detect: Phone Link terpasang tetapi tidak terhubung dengan smartphone. Menghapus paket Microsoft.YourPhone..."
                if ($yourPhoneAppx) { $yourPhoneAppx | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue }
                if ($yourPhoneProv) { $yourPhoneProv | Remove-AppxProvisionedPackage -Online -ErrorAction SilentlyContinue | Out-Null }
                Write-LogMessage "Paket Phone Link (YourPhone) berhasil dibersihkan."
            }
        } else {
            Write-LogMessage "Auto-detect: Microsoft.YourPhone tidak terpasang di sistem (dilewati)."
        }
        Write-LogMessage "Pembersihan aplikasi bloatware selesai."
    }

    if ($chkOneDrive.Checked) {
        Write-LogMessage "Menghentikan proses OneDrive..."
        Get-Process -Name "OneDrive" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
        Start-Sleep -Seconds 1

        $oneDriveSetups = @(
            "$env:SystemRoot\SysWOW64\OneDriveSetup.exe",
            "$env:SystemRoot\System32\OneDriveSetup.exe",
            "$env:LocalAppData\Microsoft\OneDrive\Update\OneDriveSetup.exe"
        )
        $validODSetup = $oneDriveSetups | Where-Object { Test-Path $_ } | Select-Object -First 1

        if ($validODSetup) {
            Write-LogMessage "Menjalankan uninstall OneDrive dari: $validODSetup"
            Start-Process -FilePath $validODSetup -ArgumentList "/uninstall" -Wait -WindowStyle Hidden
        }

        $oneDriveFolders = @(
            "$env:UserProfile\OneDrive",
            "$env:LocalAppData\Microsoft\OneDrive",
            "$env:ProgramData\Microsoft OneDrive"
        )
        foreach ($folder in $oneDriveFolders) {
            if (Test-Path $folder) {
                Remove-Item -Path $folder -Recurse -Force -ErrorAction SilentlyContinue
            }
        }

        Remove-Item -Path "HKCU:\Software\Microsoft\OneDrive" -Recurse -Force -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path "HKCU:\Environment" -Name "OneDrive" -ErrorAction SilentlyContinue

        $clsids = @(
            "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
            "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
        )
        foreach ($clsKey in $clsids) {
            if (Test-Path $clsKey) {
                Set-ItemProperty -Path $clsKey -Name "System.IsPinnedToNameSpaceTree" -Value 0 -Type DWord -Force -ErrorAction SilentlyContinue
            }
        }
        Write-LogMessage "OneDrive dan sisa foldernya berhasil dibersihkan."
    }

    if ($chkTelemetry.Checked) {
        Write-LogMessage "Menonaktifkan Widgets & News..."
        $dshPath = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"
        if (-not (Test-Path $dshPath)) {
            New-Item -Path $dshPath -Force | Out-Null
        }
        Set-ItemProperty -Path $dshPath -Name "AllowNewsAndInterests" -Value 0 -Type DWord -Force

        Write-LogMessage "Menonaktifkan Bing Search di Start Menu..."
        $searchCU = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
        if (-not (Test-Path $searchCU)) {
            New-Item -Path $searchCU -Force | Out-Null
        }
        Set-ItemProperty -Path $searchCU -Name "BingSearchEnabled" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $searchCU -Name "CortanaConsent" -Value 0 -Type DWord -Force

        $explorerPol = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
        if (-not (Test-Path $explorerPol)) {
            New-Item -Path $explorerPol -Force | Out-Null
        }
        Set-ItemProperty -Path $explorerPol -Name "DisableSearchBoxSuggestions" -Value 1 -Type DWord -Force

        Write-LogMessage "Menonaktifkan Windows Copilot..."
        $copilotUser = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"
        if (-not (Test-Path $copilotUser)) {
            New-Item -Path $copilotUser -Force | Out-Null
        }
        Set-ItemProperty -Path $copilotUser -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord -Force

        $copilotLM = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
        if (-not (Test-Path $copilotLM)) {
            New-Item -Path $copilotLM -Force | Out-Null
        }
        Set-ItemProperty -Path $copilotLM -Name "TurnOffWindowsCopilot" -Value 1 -Type DWord -Force

        Write-LogMessage "Menonaktifkan Consumer Features & Saran Aplikasi..."
        $cloudContent = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
        if (-not (Test-Path $cloudContent)) {
            New-Item -Path $cloudContent -Force | Out-Null
        }
        Set-ItemProperty -Path $cloudContent -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord -Force

        $cloudContentUser = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"
        if (-not (Test-Path $cloudContentUser)) {
            New-Item -Path $cloudContentUser -Force | Out-Null
        }
        Set-ItemProperty -Path $cloudContentUser -Name "DisableWindowsConsumerFeatures" -Value 1 -Type DWord -Force

        $contentDelivery = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        if (-not (Test-Path $contentDelivery)) {
            New-Item -Path $contentDelivery -Force | Out-Null
        }
        Set-ItemProperty -Path $contentDelivery -Name "SilentInstalledAppsEnabled" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $contentDelivery -Name "SystemPaneSuggestionsEnabled" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $contentDelivery -Name "SoftLandingEnabled" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $contentDelivery -Name "SubscribedContent-338388Enabled" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $contentDelivery -Name "SubscribedContent-338389Enabled" -Value 0 -Type DWord -Force

        Write-LogMessage "Menonaktifkan Telemetri Windows..."
        $dataCol = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
        if (-not (Test-Path $dataCol)) {
            New-Item -Path $dataCol -Force | Out-Null
        }
        Set-ItemProperty -Path $dataCol -Name "AllowTelemetry" -Value 0 -Type DWord -Force
        Set-ItemProperty -Path $dataCol -Name "DoNotShowFeedbackNotifications" -Value 1 -Type DWord -Force

        Write-LogMessage "Menghentikan & menonaktifkan layanan Telemetri..."
        $servicesToDisable = @("DiagTrack", "dmwappushservice")
        foreach ($srv in $servicesToDisable) {
            Get-Service -Name $srv -ErrorAction SilentlyContinue | Stop-Service -Force -ErrorAction SilentlyContinue
            Set-Service -Name $srv -StartupType Disabled -ErrorAction SilentlyContinue
        }

        Write-LogMessage "Menonaktifkan Scheduled Tasks telemetri..."
        $telemetryTasks = @(
            "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
            "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
            "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
            "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
        )
        foreach ($task in $telemetryTasks) {
            Disable-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue | Out-Null
        }
        Write-LogMessage "Pengaturan telemetri dan privasi selesai."
    }

    if ($chkTemp.Checked) {
        Write-LogMessage "Membersihkan file temporary..."
        $tempFolders = @($env:TEMP, "$env:SystemRoot\Temp")
        foreach ($folder in $tempFolders) {
            if (Test-Path $folder) {
                Get-ChildItem -Path $folder -Recurse -Force -ErrorAction SilentlyContinue | Remove-Item -Recurse -Force -ErrorAction SilentlyContinue
            }
        }
        Write-LogMessage "File temporary berhasil dibersihkan."
    }

    Write-LogMessage "Memulai ulang Windows Explorer..."
    Get-Process -Name "explorer" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Start-Process "explorer.exe"

    Write-LogMessage "Seluruh proses pembersihan dan optimasi selesai dijalankan!"
    Set-ControlsState $true
    [System.Windows.Forms.MessageBox]::Show("Proses pembersihan dan optimasi Windows 11 telah berhasil diselesaikan!", "Selesai", [System.Windows.Forms.MessageBoxButtons]::OK, [System.Windows.Forms.MessageBoxIcon]::Information)
})

$btnRestore.Add_Click({
    Set-ControlsState $false
    Write-LogMessage "Memulai proses pemulihan (Restore) seluruh konfigurasi..."

    Write-LogMessage "Mengembalikan Registry Policy & izin instalasi Edge..."
    $edgeUpdateKey = "HKLM:\SOFTWARE\Microsoft\EdgeUpdate"
    if (Test-Path $edgeUpdateKey) {
        Remove-ItemProperty -Path $edgeUpdateKey -Name "DoNotUpdateToEdgeWithChromium" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $edgeUpdateKey -Name "UpdaterExperimentationAndConfigurationServiceControl" -ErrorAction SilentlyContinue
    }
    $edgeUpdateKey64 = "HKLM:\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdate"
    if (Test-Path $edgeUpdateKey64) {
        Remove-ItemProperty -Path $edgeUpdateKey64 -Name "DoNotUpdateToEdgeWithChromium" -ErrorAction SilentlyContinue
    }
    $edgePoliciesKey = "HKLM:\SOFTWARE\Policies\Microsoft\EdgeUpdate"
    if (Test-Path $edgePoliciesKey) {
        Remove-ItemProperty -Path $edgePoliciesKey -Name "InstallDefault" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $edgePoliciesKey -Name "Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $edgePoliciesKey -Name "Update{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -ErrorAction SilentlyContinue
    }
    $edgePoliciesKey64 = "HKLM:\SOFTWARE\WOW6432Node\Policies\Microsoft\EdgeUpdate"
    if (Test-Path $edgePoliciesKey64) {
        Remove-ItemProperty -Path $edgePoliciesKey64 -Name "InstallDefault" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $edgePoliciesKey64 -Name "Install{56EB18F8-B008-4CBD-B6D2-8C97FE7E9062}" -ErrorAction SilentlyContinue
    }
    $systemAppsEdge = "$env:SystemRoot\SystemApps\Microsoft.MicrosoftEdge_8wekyb3d8bbwe"
    if (Test-Path $systemAppsEdge) {
        Remove-Item -Path $systemAppsEdge -Recurse -Force -ErrorAction SilentlyContinue
    }
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdateDev" -Name "AllowUninstall" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\EdgeUpdateDev" -Name "CanContinueWithMissingUpdate" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" -Name "AllowUninstall" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\EdgeUpdateDev" -Name "CanContinueWithMissingUpdate" -ErrorAction SilentlyContinue

    $edgeServices = @("edgeupdate", "edgeupdatem", "MicrosoftEdgeElevationService")
    foreach ($srv in $edgeServices) {
        Set-Service -Name $srv -StartupType Manual -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali Widgets & News..."
    $dshPath = "HKLM:\SOFTWARE\Policies\Microsoft\Dsh"
    if (Test-Path $dshPath) {
        Remove-ItemProperty -Path $dshPath -Name "AllowNewsAndInterests" -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali Bing Search di Start Menu..."
    $searchCU = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
    if (Test-Path $searchCU) {
        Set-ItemProperty -Path $searchCU -Name "BingSearchEnabled" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
        Set-ItemProperty -Path $searchCU -Name "CortanaConsent" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
    }
    $explorerPol = "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
    if (Test-Path $explorerPol) {
        Remove-ItemProperty -Path $explorerPol -Name "DisableSearchBoxSuggestions" -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali Copilot..."
    $copilotUser = "HKCU:\Software\Policies\Microsoft\Windows\WindowsCopilot"
    if (Test-Path $copilotUser) {
        Remove-ItemProperty -Path $copilotUser -Name "TurnOffWindowsCopilot" -ErrorAction SilentlyContinue
    }
    $copilotLM = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot"
    if (Test-Path $copilotLM) {
        Remove-ItemProperty -Path $copilotLM -Name "TurnOffWindowsCopilot" -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali Consumer Features & Telemetri..."
    $cloudContent = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent"
    if (Test-Path $cloudContent) {
        Remove-ItemProperty -Path $cloudContent -Name "DisableWindowsConsumerFeatures" -ErrorAction SilentlyContinue
    }
    $cloudContentUser = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"
    if (Test-Path $cloudContentUser) {
        Remove-ItemProperty -Path $cloudContentUser -Name "DisableWindowsConsumerFeatures" -ErrorAction SilentlyContinue
    }
    $dataCol = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
    if (Test-Path $dataCol) {
        Remove-ItemProperty -Path $dataCol -Name "AllowTelemetry" -ErrorAction SilentlyContinue
        Remove-ItemProperty -Path $dataCol -Name "DoNotShowFeedbackNotifications" -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali ikon OneDrive di File Explorer..."
    $clsids = @(
        "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}",
        "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}"
    )
    foreach ($clsKey in $clsids) {
        if (Test-Path $clsKey) {
            Set-ItemProperty -Path $clsKey -Name "System.IsPinnedToNameSpaceTree" -Value 1 -Type DWord -Force -ErrorAction SilentlyContinue
        }
    }

    Write-LogMessage "Mengaktifkan kembali layanan telemetri & Diagnostics..."
    $servicesToEnable = @("DiagTrack", "dmwappushservice")
    foreach ($srv in $servicesToEnable) {
        Set-Service -Name $srv -StartupType Automatic -ErrorAction SilentlyContinue
        Start-Service -Name $srv -ErrorAction SilentlyContinue
    }

    Write-LogMessage "Mengaktifkan kembali Scheduled Tasks..."
    $telemetryTasks = @(
        "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser",
        "\Microsoft\Windows\Application Experience\ProgramDataUpdater",
        "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator",
        "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
    )
    foreach ($task in $telemetryTasks) {
        Enable-ScheduledTask -TaskName $task -ErrorAction SilentlyContinue | Out-Null
    }
    Get-ScheduledTask -ErrorAction SilentlyContinue | Where-Object { $_.TaskName -like "*MicrosoftEdgeUpdate*" -or ($_.TaskName -like "*Edge*" -and $_.TaskPath -like "*Microsoft\Edge*") } | Enable-ScheduledTask -ErrorAction SilentlyContinue | Out-Null

    Write-LogMessage "Mencoba menginstal ulang Microsoft Edge via winget..."
    $edgeInstalledViaWinget = $false
    try {
        $wingetProc = Start-Process -FilePath "winget" -ArgumentList "install --id Microsoft.Edge --exact --source winget --accept-source-agreements --accept-package-agreements --silent" -Wait -WindowStyle Hidden -PassThru -ErrorAction Stop
        if ($wingetProc.ExitCode -eq 0) {
            $edgeInstalledViaWinget = $true
            Write-LogMessage "Microsoft Edge berhasil diinstal ulang via winget."
        }
    } catch {}

    if (-not $edgeInstalledViaWinget) {
        Write-LogMessage "Winget tidak berhasil. Mengunduh installer Edge resmi dari Microsoft..."
        try {
            $installerPath = "$env:TEMP\MicrosoftEdgeSetup.exe"
            [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
            Invoke-WebRequest -Uri "https://go.microsoft.com/fwlink/?linkid=2108834&Channel=Stable&language=en" -OutFile $installerPath -ErrorAction Stop
            Start-Process -FilePath $installerPath -ArgumentList "/silent /install" -Wait -WindowStyle Hidden
            Write-LogMessage "Microsoft Edge berhasil diinstal ulang menggunakan installer resmi."
        } catch {
            Write-LogMessage "Peringatan: Gagal mengunduh otomatis ($($_.Exception.Message)). Kebijakan dan izin instalasi Edge telah dipulihkan."
        }
    }

    Write-LogMessage "Memeriksa penginstal OneDrive..."
    $oneDriveSetups = @(
        "$env:SystemRoot\SysWOW64\OneDriveSetup.exe",
        "$env:SystemRoot\System32\OneDriveSetup.exe"
    )
    $validODSetup = $oneDriveSetups | Where-Object { Test-Path $_ } | Select-Object -First 1
    if ($validODSetup) {
        Write-LogMessage "Menjalankan instalasi ulang OneDrive dari: $validODSetup"
        Start-Process -FilePath $validODSetup -ArgumentList "/silent" -Wait -WindowStyle Hidden
        Write-LogMessage "OneDrive berhasil diinstal ulang."
    } else {
        Write-LogMessage "File installer OneDrive lokal tidak ditemukan."
    }

    Write-LogMessage "Mendaftarkan dan menginstal ulang seluruh aplikasi bawaan Windows..."
    Get-ChildItem -Path "$env:ProgramFiles\WindowsApps\*\AppXManifest.xml" -ErrorAction SilentlyContinue | ForEach-Object {
        $manifestPath = $_.FullName
        Add-AppxPackage -DisableDevelopmentMode -Register $manifestPath -ErrorAction SilentlyContinue
    }
    Write-LogMessage "Pendaftaran aplikasi bawaan selesai."

    Write-LogMessage "Memulai ulang Windows Explorer..."
    Get-Process -Name "explorer" -ErrorAction SilentlyContinue | Stop-Process -Force -ErrorAction SilentlyContinue
    Start-Sleep -Seconds 1
    Start-Process "explorer.exe"

    Write-LogMessage "Pemulihan pengaturan selesai!"
    Set-ControlsState $true

    $restoreDialog = [System.Windows.Forms.MessageBox]::Show("Pemulihan pengaturan telah selesai dikerjakan.`r`n`r`nApakah Anda ingin membuka wizard System Restore bawaan Windows sekarang?", "Restore Selesai", [System.Windows.Forms.MessageBoxButtons]::YesNo, [System.Windows.Forms.MessageBoxIcon]::Question)
    if ($restoreDialog -eq [System.Windows.Forms.DialogResult]::Yes) {
        Start-Process "rstrui.exe"
    }
})

$form.ShowDialog() | Out-Null
