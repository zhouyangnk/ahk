Break::Suspend  ; 设置一个切换挂起功能的热键(键盘的pause break键)
^Up:: Send #^{d}
^Down:: Send #^{F4}
^Left:: Send #^{Left}
^Right:: Send #^{Right}
;;参考https://www.cnblogs.com/west-link/archive/2011/10/08/2201804.html
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2    
global prev:=WinActive("A")
Activate(t)
{
  IfWinActive,%t%
  {
    ;;WinMinimize
    WinHide  
    WinActivate, ahk_id %prev%
    return
  }
  SetTitleMatchMode 2    
  DetectHiddenWindows,on
  prev := WinExist("A")
  IfWinExist,%t%
  {
    WinShow
    WinActivate           
    return 1
  }
  return 0
}

ActivateAndOpen(t,p)
{
  if Activate(t)==0
  {
    Run %p%
    WinActivate
    return
  }
}

!2::
Activate("ahk_class OrpheusBrowserHost")
return 

!1::
Activate("ahk_class StandardFrame_DingTalk")
return 


!w::!+w
!e::!+e
;;参考http://www.cnblogs.com/Vonng/p/4240219.html

!3::run https://www.baidu.com/
!r::Send #r  


!Esc::Send, !{F4}


^!=::
Send, {Volume_Up}
return

^!-::
Send, {Volume_Down}
return



!`::
Send, !{F4}
return


$^n::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe 360chrome.exe")
{
	send, ^t
}
else
{
	Send, ^n
}
return

;;=============================Navigator============================||
;===========================;f = PageDown
CapsLock & f::
if getkeystate("alt") = 0
Send, {PgUp}
else
Send, +{PgUp}
return
;===========================;b = PageDown
CapsLock & b::
if getkeystate("alt") = 0
Send, {PgDn}
else
Send, +{PgDn}
return
;===========================;H = Left
CapsLock & h::
	if getkeystate("alt") = 0
	Send, {Left}
	else
	Send, +{Left}
return
;===========================;J = Down
CapsLock & j::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe 360chrome.exe") or WinActive("ahk_exe ApplicationFrameHost.exe")
{
	send, ^+{Tab}
}
else
{
	if getkeystate("alt") = 0
	Send, {Down}
	else
	Send, +{Down}
}
return
;===========================;K = UP
CapsLock & k::
if WinActive("ahk_exe chrome.exe") or WinActive("ahk_exe 360chrome.exe") or WinActive("ahk_exe ApplicationFrameHost.exe")
{
	send, ^{Tab}
}
else
{
	if getkeystate("alt") = 0
	Send, {Up}
	else
	Send, +{Up}
}
return
;===========================;L = Right
CapsLock & l::
	if getkeystate("alt") = 0
	Send, {Right}
	else
	Send, +{Right}

return
;===========================;I = backspace
CapsLock & i::
  Send, {backspace}
return
;===========================;o = del
CapsLock & o::
  Send, {delete}
return


;将连续书写的三个中文句号转换成三个英文句号
:*:...::
SendInput {Text}...
return

