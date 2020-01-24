# admin rights check
function checkadmin {
    $user = [Security.Principal.WindowsIdentity]::GetCurrent();
    $checkresult = (New-Object Security.Principal.WindowsPrincipal $user).IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
    if ($checkresult -eq $False) {
        write-host "------------------------------------------------------------------------"
        write-host "No administrator rights found, please run the script as an administrator"
        write-host "------------------------------------------------------------------------"
        PAUSE
        exit
    }

}

# suppress errormessages from removing apps because clear-host didn't work
$ErrorActionPreference = "SilentlyContinue"

checkadmin
clear-host

#To uninstall 3D Builder:
get-appxpackage -allusers *3dbuilder* | remove-appxpackage

#To uninstall Alarms & Clock:
get-appxpackage -allusers *alarms* | remove-appxpackage

#To uninstall App Connector:
#get-appxpackage -allusers *appconnector* | remove-appxpackage

#To uninstall App Installer:
#get-appxpackage -allusers *appinstaller* | remove-appxpackage

#To uninstall Calendar and Mail apps together:
get-appxpackage -allusers *communicationsapps* | remove-appxpackage

#To uninstall Calculator:
#get-appxpackage -allusers *calculator* | remove-appxpackage

#To uninstall Camera:
#get-appxpackage -allusers *camera* | remove-appxpackage

#To uninstall Feedback Hub:
get-appxpackage -allusers *feedback* | remove-appxpackage

#To uninstall Get Office:
get-appxpackage -allusers *officehub* | remove-appxpackage

#To uninstall Get Started or Tips:
get-appxpackage -allusers *getstarted* | remove-appxpackage

#To uninstall Get Skype:
get-appxpackage -allusers *skypeapp* | remove-appxpackage

#To uninstall Groove Music:
get-appxpackage -allusers *zunemusic* | remove-appxpackage

#To uninstall Groove Music and Movies & TV apps together:
get-appxpackage -allusers *zune* | remove-appxpackage

#To uninstall Maps:
get-appxpackage -allusers *maps* | remove-appxpackage

#To uninstall Messaging and Skype Video apps together:
get-appxpackage -allusers *messaging* | remove-appxpackage

#To uninstall Microsoft Solitaire Collection:
get-appxpackage -allusers *solitaire* | remove-appxpackage

#To uninstall Microsoft Wallet:
get-appxpackage -allusers *wallet* | remove-appxpackage

#To uninstall Microsoft Wi-Fi:
get-appxpackage -allusers *connectivitystore* | remove-appxpackage

#To uninstall Money:
get-appxpackage -allusers *bingfinance* | remove-appxpackage

#To uninstall Movies & TV:
get-appxpackage -allusers *zunevideo* | remove-appxpackage

#To uninstall News:
get-appxpackage -allusers *bingnews* | remove-appxpackage

#To uninstall OneNote:
#get-appxpackage -allusers *onenote* | remove-appxpackage

#To uninstall Paid Wi-Fi & Cellular:
get-appxpackage -allusers  *oneconnect* | remove-appxpackage

#To uninstall Paint 3D:
#get-appxpackage -allusers *mspaint* | remove-appxpackage

#To uninstall People:
get-appxpackage -allusers  *people* | remove-appxpackage

#To uninstall Phone:
get-appxpackage -allusers *commsphone* | remove-appxpackage

#To uninstall Phone Companion:
get-appxpackage -allusers *windowsphone* | remove-appxpackage

#To uninstall Phone and Phone Companion apps together:
#get-appxpackage -allusers *phone* | remove-appxpackage

#To uninstall Photos:
get-appxpackage -allusers *photos* | remove-appxpackage

#To uninstall Sports:
get-appxpackage -allusers *bingsports* | remove-appxpackage

#To uninstall Sticky Notes:
#get-appxpackage -allusers *sticky* | remove-appxpackage

#To uninstall Sway:
get-appxpackage -allusers *sway* | remove-appxpackage

#To uninstall View 3D:
get-appxpackage -allusers *3dViewer* | remove-appxpackage

#To uninstall Voice Recorder:
#get-appxpackage -allusers *soundrecorder* | remove-appxpackage

#To uninstall Weather:
#get-appxpackage -allusers *bingweather* | remove-appxpackage

#To uninstall Get-Help App:
get-appxpackage -allusers *GetHelp* | remove-appxpackage

#To uninstall Windows Holographic:
get-appxpackage -allusers *holographic* | remove-appxpackage

#To Windows Camera:
get-appxpackage -allusers *WindowsCamera* | remove-appxpackage

#To uninstall Windows Store:
#get-appxpackage -allusers *windowsstore* | remove-appxpackage

#To uninstall Xbox Apps:
get-appxpackage -allusers *xbox* | remove-appxpackage

clear-host
