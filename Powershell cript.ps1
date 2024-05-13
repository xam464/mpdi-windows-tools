#set Search icon only (To select the “Search icon only” option the value is 1, use 2 for the “Search box,” and 3 for the “Search button” option.)
Set-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Search -Name SearchBoxTaskbarMode -Value 1 -Type DWord -Force

#Hide taskview button
New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "ShowTaskViewButton" -Value 0 -Force 

#hide Widget form taskbar Remove the installed package for each user
Get-AppxPackage -AllUsers | Where-Object {$_.Name -like "*WebExperience*"} | Remove-AppxPackage -AllUsers -ErrorAction SilentlyContinue

#Remove Teams/Chat
Get-AppxPackage MicrosoftTeams* | Remove-AppxPackage
#Remove Solitaire
Get-AppxPackage *MicrosoftSolitaireCollection* | Remove-AppxPackage
#Remove Skype
Get-AppxPackage *Microsoft.549981C3F5F10* | Remove-AppxPackage
#remove Feedback Hub
Get-AppxPackage *WindowsFeedbackHub* | Remove-AppxPackage
#Remove Help and Tips
Get-AppxPackage *GetHelp* | Remove-AppxPackage
#Remove Maps
Get-AppxPackage *WindowsMaps* | Remove-AppxPackage
#Remove ToDO
Get-AppxPackage *Todos* | Remove-AppxPackage
#Remove Office
Get-AppxPackage *MicrosoftOfficeHub* | Remove-AppxPackage
#Remove People
Get-AppxPackage *People* | Remove-AppxPackage
#Remove Weather
Get-AppxPackage *BingWeather* | Remove-AppxPackage
#Remove Xbox
Get-AppxPackage *Xbox* | Remove-AppxPackage
Get-AppxPackage *GamingApp* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxGamingOverlay* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxIdentityProvider* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxPackage -allusers Microsoft.XboxGameCallableUI* | Remove-AppxPackage
#Remove Phone
Get-AppxPackage *YourPhone* | Remove-AppxPackage
#Remove Bing Search
Get-AppxPackage -allusers Microsoft.BingSearch* | Remove-AppxPackage
#Remove DevHome
Get-AppxPackage *Windows.DevHome* | Remove-AppxPackage
#Remove Alarms and Clocks
Get-AppxPackage *WindowsAlarms* | Remove-AppxPackage
#remove Music app
Get-AppxPackage *ZuneMusic* | Remove-AppxPackage
#remove 3d-viewer
Get-AppxPackage -allusers Microsoft.Microsoft3DViewer* | Remove-AppxPackag
#Remove sticky notes:
Get-AppxPackage -allusers Microsoft.MicrosoftStickyNotes* | Remove-AppxPackage
#Remove Mixed Reality Portal
Get-AppxPackage -allusers Microsoft.MixedReality.Portal* | Remove-AppxPackage
#Remove Onenote
Get-AppxPackage -allusers Microsoft.Office.OneNote* | Remove-AppxPackage
#Remove Print3D
Get-AppxPackage -allusers Microsoft.Print3D* | Remove-AppxPackage
#Remove Wallet
Get-AppxPackage -allusers Microsoft.Wallet* | Remove-AppxPackage
#Remove Outlook
Get-AppxPackage -allusers Microsoft.OutlookForWindows* | Remove-AppxPackage
#Remove Feedbackhub
Get-AppxPackage -allusers Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
#Remove get-started
Get-AppxPackage -allusers Microsoft.Getstarted* | Remove-AppxPackage
#remove Bloadware
Get-AppxPackage -AllUsers *ActiproSoftwareLLC* | Remove-AppxPackage
Get-AppxPackage -AllUsers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage
Get-AppxPackage -AllUsers Microsoft.BingNews* | Remove-AppxPackage
Get-AppxPackage -AllUsers *CandyCrush* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Duolingo* | Remove-AppxPackage
Get-AppxPackage -AllUsers *EclipseManager* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Facebook* | Remove-AppxPackage
Get-AppxPackage -AllUsers *king.com.FarmHeroesSaga* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Flipboard* | Remove-AppxPackage
Get-AppxPackage -AllUsers *HiddenCityMysteryofShadows* | Remove-AppxPackage
Get-AppxPackage -AllUsers *HuluLLC.HuluPlus* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Pandora* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Plex* | Remove-AppxPackage
Get-AppxPackage -AllUsers *ROBLOXCORPORATION.ROBLOX* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Spotify* | Remove-AppxPackage
Get-AppxPackage *SpotifyAB.SpotifyMusic* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Netflix* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Microsoft.SkypeApp* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Twitter* | Remove-AppxPackage
Get-AppxPackage -AllUsers *Wunderlist* | Remove-AppxPackage
Get-AppxPackage -AllUsers *clipchamp.clipchamp* | Remove-AppxPackage

#Remove Recommended
New-ItemProperty -Path “HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer” -Name “HideRecommendedSection” -PropertyType DWord -Value 1 -Force


#start Chris Titus script
iwr -useb https://christitus.com/win | iex