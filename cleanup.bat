@echo off
:: Request admin privileges
:: Run this script as administrator
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo Requesting administrative privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b
)

:: Execute PowerShell script
powershell -NoProfile -ExecutionPolicy Bypass -Command "& {
    Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchBoxTaskbarMode -Value 1 -Type DWord -Force;
    New-ItemProperty -Path 'HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'ShowTaskViewButton' -Value 0 -Force;

    Get-AppxPackage -AllUsers | Where-Object { $_.Name -like '*WebExperience*' } | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue;
    Get-AppxPackage MicrosoftTeams* | Remove-AppxPackage;
    Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage;
    Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage;
    Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage;
    Get-AppxPackage *GetHelp* | Remove-AppxPackage;
    Get-AppxPackage *WindowsMaps* | Remove-AppxPackage;
    Get-AppxPackage *Todos* | Remove-AppxPackage;
    Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage;
    Get-AppxPackage *People* | Remove-AppxPackage;
    Get-AppxPackage *BingWeather* | Remove-AppxPackage;
    Get-AppxPackage *Xbox* | Remove-AppxPackage;
    Get-AppxPackage *GamingApp* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.XboxGameOverlay* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.XboxGamingOverlay* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.XboxIdentityProvider* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.XboxGameCallableUI* | Remove-AppxPackage;
    Get-AppxPackage *YourPhone* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.BingSearch* | Remove-AppxPackage;
    Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage;
    Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage;
    Get-AppxPackage *ZuneMusic* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.Microsoft3DViewer* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.MixedReality.Portal* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.Office.OneNote* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.Print3D* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.Wallet* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.OutlookForWindows* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.WindowsFeedbackHub* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.Getstarted* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *ActiproSoftwareLLC* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers Microsoft.BingNews* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Duolingo* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *EclipseManager* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *king.com.FarmHeroesSaga* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Flipboard* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *HiddenCityMysteryofShadows* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *HuluLLC.HuluPlus* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Pandora* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *ROBLOXCORPORATION.ROBLOX* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage;
    Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *Wunderlist* | Remove-AppxPackage;
    Get-AppxPackage -AllUsers *clipchamp.clipchamp* | Remove-AppxPackage;

    New-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'HideRecommendedSection' -PropertyType DWord -Value 1 -Force;

    iwr -useb https://christitus.com/win | iex;
}"
