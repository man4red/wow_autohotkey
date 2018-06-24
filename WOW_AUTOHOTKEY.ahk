#MaxHotkeysPerInterval 1000
#SingleInstance force

TickCountWait=500
RandomSleepMin=30
RandomSleepMax=78

EQHotKeys := {"$1": "1", "$2": "2", "$3": "3", "$4": "4", "$5": "5", "$6": "6","$q": "q","$e": "e","$f": "f","$z": "z","$c": "c","$r": "r"}

for key, mapping in EQHotkeys {
    fn := Func("SendKey").Bind(mapping)
    hotkey, % key, % fn
}

SendKey(keySent){
    global TickCountWait,RandomSleepMin,RandomSleepMax
    now = %A_TickCount%
    Send {%keySent% down}
    while GetKeyState(keySent, "P")
        if (A_TickCount-now > TickCountWait)
        {
            Send {%keySent%}
            Random, random, %RandomSleepMin%, %RandomSleepMax%
            Sleep random
        }
    Send {%keySent% up}
}
