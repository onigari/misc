#NoTrayIcon

;volume
#If MouseIsOver("ahk_class Shell_TrayWnd")
   WheelUp::Send {Volume_Up}
   WheelDown::Send {Volume_Down}
   ;MButton::Send {Volume_Mute}

#If 
MouseIsOver(WinTitle)
{  MouseGetPos,,, Win
   Return WinExist(WinTitle . " ahk_id " . Win)
}
