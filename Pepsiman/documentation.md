# PEPSIMAN AUTO-SPLITTER AND LOAD REMOVER v1.1.1 - by MrMonsh

## Notes

We track six variables here: GameState, LostControlOfPepsiman, ScoreBoardIsPresent, EndOfThirdLevel, CurrentHoveredMainMenuItem and MenuItemIsSelected
GameState tells us what the game is currently playing, whether it's a level, a cutscene, a level loading, pepsiman's death or the main menu.

## GameState Values

+ 7: Game Over/End of Credits (used for auto-resets)
+ 8: Main Menu (used for auto-start)
+ 14: Currently playing a level
+ 40: 3D cutscene for first level of the each act
+ 41: Loading the first level of the each act (used to detect loading for Load Remover)
+ 42: Loading the second level of the each act (used to detect loading for Load Remover and to auto-split first level)
+ 43: Loading the third level of the each act (used to detect loading for Load Remover and to auto-split second level)
+ 44: A fat man cutscene

### LostControlOfPepsiman 
This address tells us exactly when we lose control of Pepsiman, whether it's during the end of a level or during the initial cutscene of a level
+ Value 0 means we're currently in control of Pepsiman, 1 means we're not in control.

### ScoreBoardIsPresent 
This address tells us exactly when the Score Board at the end of each level is present on the screen
+ Value 0 means it's not present, 1 means it's present.

### EndOfThirdLevel 
This address tells us exactly when we stop controlling Pepsiman at the end of the third level of each act, given that GameState doesn't pick up on this

EndOfThirdLevel Values:
+ 24480: Lost control of Pepsiman (due to reaching the end of the level)
+ 67817236: Currently playing the level, paused or at the main menu
+ 151703316: Currently playing level 1-2
+ 3774875200: Fade out at the end of level cutscene

CurrentHoveredMainMenuItem tells us which is the current MAIN menu item we're stepped on, from the list of available items of our main menu.
The amount of items may vary depending whether you have played the game before or not, given the Free Play and Continue options are unlocked in this fashion. 
Values: 0 is the top item, 1 is the one right under it, and so on.
As such, "Game Start" is always value 0, since it's always at the top of the main menu, and this is the one we're concerned with.
If you enter a sub-menu (such as Options or Free Play), this value doesn't change, regardless of what you do inside it.

MenuItemIsSelected tells us if the current menu item was selected (ie. player pressed circle to select it).
MenuItemIsSelected Values:
+ 64: Passive State
+ 20: Menu Item Selected
