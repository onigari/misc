#NoTrayIcon
; Variables
Increments 			:= 10 ; < lower for a more granular change, higher for larger jump in brightness 
CurrentBrightness 	:= GetCurrentBrightNess()

; Hot Keys
; Win + Num 4/6
#Numpad4::     ChangeBrightness( CurrentBrightness -= Increments ) ; decrease brightness
;#Numpad5::     ChangeBrightness( CurrentBrightness := 30 ) ; default
#Numpad6::     ChangeBrightness( CurrentBrightness += Increments ) ; increase brightness

; Win + Num 2/5/8
#Numpad2::Send {Volume_Down}
#Numpad5::Send {Volume_Mute}
#Numpad8::Send {Volume_Up}

; Functions
ChangeBrightness( ByRef brightness := 50, timeout = 1 )
{
	if ( brightness >= 0 && brightness <= 100 )
	{
		For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightnessMethods" )
			property.WmiSetBrightness( timeout, brightness )	
	}
 	else if ( brightness > 100 )
 	{
 		brightness := 100
 	}
 	else if ( brightness < 0 )
 	{
 		brightness := 0
 	}
}

GetCurrentBrightNess()
{
	For property in ComObjGet( "winmgmts:\\.\root\WMI" ).ExecQuery( "SELECT * FROM WmiMonitorBrightness" )
		currentBrightness := property.CurrentBrightness	

	return currentBrightness
}