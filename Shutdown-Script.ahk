#NoTrayIcon

; Parameter #1: Pass 1 instead of 0 to hibernate rather than suspend.
; Parameter #2: Pass 1 instead of 0 to suspend immediately rather than asking each application for permission.
; Parameter #3: Pass 1 instead of 0 to disable all wake events.
#+F1::
DllCall("PowrProf\SetSuspendState", "Int", 1, "Int", 1, "Int", 0)

#F1::
Sleep 1000  ; Give user a chance to release keys (in case their release would wake up the monitor again).
; Turn Monitor Off:
SendMessage, 0x0112, 0xF170, 2,, Program Manager  ; 0x0112 is WM_SYSCOMMAND, 0xF170 is SC_MONITORPOWER.
return