﻿#MaxHotkeysPerInterval 1000
#SingleInstance force

TickCountWait=500
RandomSleepMin=30
RandomSleepMax=78

EQHotKeys := {"$1": "1", "$2": "2", "$3": "3", "$4": "4", "$5": "5", "$6": "6","$q": "q","$e": "e","$f": "f","$z": "z","$c": "c","$r": "r"}

for key, mapping in EQHotkeys {
	fn := Func("SendKey").Bind(mapping)
	hotkey, % key, % fn
}

RandomSleep(min,max)
{
    Random, random, %min%, %max%
    Sleep %random%
}

RemoveToolTip:
SetTimer, RemoveToolTip, Off
ToolTip
return

SendKey(keySent){
    global TickCountWait,RandomSleepMin,RandomSleepMax
    now = %A_TickCount%

    Send {%keySent% down}
    ;tooltip down

    while GetKeyState(keySent, "P")
        if (A_TickCount-now > TickCountWait)
        {
            Send {%keySent%}
            ;tooltip sent
            Random, random, %RandomSleepMin%, %RandomSleepMax%
            ;tooltip %random%
            Sleep random
        }
    
    Send {%keySent% up}
    ;tooltip up
    SetTimer, RemoveToolTip, 5000
}