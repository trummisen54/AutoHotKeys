; Redefine only when the active window is a console window 
#IfWinActive ahk_class ConsoleWindowClass

; Close Command Window with Ctrl+w
$^w::
WinGetTitle sTitle
If (InStr(sTitle, "-")=0) { 
	Send EXIT{Enter}
} else {
	Send ^w
}

return 


; Ctrl+up / Down to scroll command window back and forward
^Up::
Send {WheelUp}
return

^Down::
Send {WheelDown}
return


; Use backslash instead of backtick (yes, I am a C++ programmer).
#EscapeChar \

; Paste in command window.
^V::
StringReplace clipboard2, clipboard, \r\n, \n, All
SendInput {Raw}%clipboard2%
return

#IfWinActive