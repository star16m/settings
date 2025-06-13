#InstallKeybdHook

*Space::Send,{Blind}{Space}

;上下左右
Space & h::Send,{Blind}{Left}
Space & j::Send,{Blind}{Down}
Space & k::Send,{Blind}{Up}
Space & l::Send,{Blind}{Right}

;Home / End
;Space & 0::Send,{Blind}{Home} 
;Space & 4::Send,{Blind}{End}

Space & i::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, {Home}                                                 ;|
    else                                                             ;|
        Send, +{Home}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, ^{Home}                                                ;|
    else                                                             ;|
        Send, +^{Home}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|
;-----------------------------------o                                ;|
Space & o::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, {End}                                                  ;|
    else                                                             ;|
        Send, +{End}                                                 ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, ^{End}                                                 ;|
    else                                                             ;|
        Send, +^{End}                                                ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|

;行追加（i,I,a,Aは意味がないので定義しない）
Space & '::
	GetKeyState,state,Shift
	if state=U
	{
		Send,{End}
		Send,{Enter}
	}
	else
	{
		Send,{Home}
		Send,{Enter}
		Send,{Up}
		Send,{End}
	}
	return

Space & x::
	GetKeyState,state,Shift
	if state=U
		Send,{BS}
	else
		Send,{Delete}
	return

;Space & d::Send,^x
Space & d::
	GetKeyState,state,Shift
	if state=U
		Send,^x
	else
		Send,{Delete}
	return

;Space & i::Send,{Tab}
;Space & /::Send,^f

Space & y::Send,^c
Space & p::
	GetKeyState,state,Shift
	if state=U
		Send,^v
	else
	{
		Send,!e
		Send,s
		Send,v
		Send,{Enter}
	}
	return

Space & 7::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, {PgUp}                                                 ;|
    else                                                             ;|
        Send, +{PgUp}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, ^{PgUp}                                                ;|
    else                                                             ;|
        Send, +^{PgUp}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|


Space & 8::                                                       ;|
if GetKeyState("control") = 0                                        ;|
{                                                                    ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, {PgDn}                                                 ;|
    else                                                             ;|
        Send, +{PgDn}                                                ;|
    return                                                           ;|
}                                                                    ;|
else {                                                               ;|
    if GetKeyState("shift") = 0                                        ;|
        Send, ^{PgDn}                                                ;|
    else                                                             ;|
        Send, +^{PgDn}                                               ;|
    return                                                           ;|
}                                                                    ;|
return                                                               ;|

Space & ,:: Send, {Del}
Space & .:: Send, ^{Del}
Space & m:: Send, {BS}
Space & n:: Send, ^{BS}
Space & w:: Send, ^{Right}
Space & b:: Send, ^{Left}


Space & u::Send,^z
Space & r::Send,^y

;Excel
#ifWinActive ahk_class XLMAIN
Space & 1::Send,^{1}
Space & a::Send,{F2}
Space & i::
	Send,{F2}
	Send,^{Home}
	return
Space & c::
	Send,{F2}
	Send,{Home}
	Send,+{End}
	return
Space & (::Send,^{PgUp}
Space & )::Send,^{PgDn}
#ifWinActive


#ifWinActive セルの書式設定
;Space & ,::Send,^{PgUp}
;Space & .::Send,^{PgDn}
;Space & a::Send,!a
;Space & b::Send,!b
;Space & c::Send,!c
;Space & d::Send,!d
;Space & e::Send,!e
;Space & f::Send,!f
;Space & g::Send,!g
;Space & h::Send,!h
;Space & i::Send,!i
;Space & j::Send,!j
;Space & k::Send,!k
;Space & l::Send,!l
;Space & m::Send,!m
;Space & n::Send,!n
;Space & o::Send,!o
;Space & p::Send,!p
;Space & q::Send,!q
;Space & r::Send,!r
;Space & s::Send,!s
;Space & t::Send,!t
;Space & u::Send,!u
;Space & v::Send,!v
;Space & w::Send,!w
;Space & x::Send,!x
;Space & y::Send,!y
;Space & z::Send,!z
#ifWinActive


;シフト残りで変換し損ねて確定してしまうのを防止。
Space & Enter::
	Send,{Space}	;変換
	Send,{Enter}	;確定
	return

;Space & ,::
;	Send,{Space}	;変換
;	Send,{,}
;	return

;Space & .::
;	Send,{Space}	;変換
;	Send,{.}
;	return

Space & z::Send,!{vkf3}

; 한글변경
Space & Tab::Send {vk15sc138}


;=====================================================================o
;                       CapsLock Switcher:                           ;|
;---------------------------------o-----------------------------------o
;                    CapsLock + ` | {CapsLock}                       ;|
;---------------------------------o-----------------------------------o
CapsLock & `::                                                       ;|
GetKeyState, CapsLockState, CapsLock, T                              ;|
if CapsLockState = D                                                 ;|
    SetCapsLockState, AlwaysOff                                      ;|
else                                                                 ;|
    SetCapsLockState, AlwaysOn                                       ;|
KeyWait, ``                                                          ;|
return                                                               ;|
;---------------------------------------------------------------------o



SetCapsLockState, AlwaysOff                                          ;|
;=====================================================================o
;                         CapsLock Escaper:                          ;|
;----------------------------------o----------------------------------o
;                        CapsLock  |  {ESC}                          ;|
;----------------------------------o----------------------------------o
CapsLock::Send, {ESC}                                                ;|
;---------------------------------------------------------------------o

; 한글변경
CapsLock & Space::Send {vk15sc138}