;
; AutoHotkey Version: 1.x
; Language:       English
; Platform:       Win9x/NT
; Author:         cy18 <thecy18@gmail.com>
;
; An improved script to use space as modifier
; In normal cases, if space is pressed for more than 0.1 second, it becomes a modifier, this time could be modified in the script
; If no other keys are pressed during space is pressed, a space is output when space is released
; Severial tunes are made so that the script works well when typing in fast speed
; Note that repeating space no longer works

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

AnyKeyPressedOtherThanSpace(mode = "P") {
    keys = 1234567890-=qwertyuiop[]\asdfghjkl;'zxcvbnm,./
    Loop, Parse, keys
    {        
        isDown :=  GetKeyState(A_LoopField, mode)
        if(isDown)
            return True
    }   
    return False
}
 
Space Up::
    space_up := true
    Send, {F24}
    return
Space::
    if AnyKeyPressedOtherThanSpace(){
        SendInput, {Blind}{Space}
        Return
    }
    space_up := False
    inputed := False
    input, UserInput, L1 T0.1, {F24}
    if (space_up) {
        Send, {Blind}{Space}
        return
    }else if (StrLen(UserInput) == 1){
        Send, {Space}%UserInput%
        return
    }
    while true{
        input, UserInput, L1, {F24}
        if (space_up) {
            if (!inputed){
                Send, {Blind}{Space}
            }
            break
        }else if (StrLen(UserInput) == 1) {
            inputed := True
            StringLower, UserInput, UserInput
            if (UserInput == "1")
                Send, {Blind}{F1}
            else if (UserInput == "2")
                Send, {Blind}{F2}
            else if (UserInput == "3")
                Send, {Blind}{F3}
            else if (UserInput == "4")
                Send, {Blind}{F4}
            else if (UserInput == "5")
                Send, {Blind}{F5}
            else if (UserInput == "6")
                Send, {Blind}{F6}
            else if (UserInput == "7")
                Send, {Blind}{F7}
            else if (UserInput == "8")
                Send, {Blind}{F8}
            else if (UserInput == "9")
                Send, {Blind}{F9}
            else if (UserInput == "0")
                Send, {Blind}{F10}
            else if (UserInput == "-")
                Send, {Blind}{F11}
            else if (UserInput == "=")
                Send, {Blind}{F12}
            else if (UserInput == "j")
                Send, {Blind}{PgDn}
            else if (UserInput == "k")
                Send, {Blind}{PgUp}
            else if (UserInput == "h")
                Send, {Blind}{Home}
            else if (UserInput == "l")
                Send, {Blind}{End}
            else if (UserInput == "d")
                Send, {Blind}{DEL}
            else
                Send, {Blind}%UserInput%
        }
    }
    return