#Requires AutoHotkey v1.1+

; Variables
autoPress := false
pressKey := "z"
interval := 100

; GUI Setup
Gui, New, , AutoMash (made by pomsaddons.xyz)
Gui, Add, Text, x10 y10, AutoMash (pomsaddons.xyz)
Gui, Add, Text, x10 y40, Key to Press:
Gui, Add, Edit, vKeyInput w100 x120 y40, %pressKey%
Gui, Add, Text, x10 y70, Interval (ms):
Gui, Add, Edit, vIntervalInput w100 x120 y70, %interval%
Gui, Add, Button, gStartAutoPress x10 y100 w130, Start
Gui, Add, Button, gStopAutoPress x150 y100 w130, Stop
Gui, Show, w300 h150
return

StartAutoPress:
Gui, Submit, NoHide
pressKey := KeyInput
interval := IntervalInput
autoPress := true
SetTimer, PressKeyLoop, %interval%
return

StopAutoPress:
autoPress := false
SetTimer, PressKeyLoop, Off
return

PressKeyLoop:
if (autoPress) {
    Send, {%pressKey%}
}
return

GuiClose:
ExitApp
