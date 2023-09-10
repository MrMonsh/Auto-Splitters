# Pepsiman Auto-Splitter & Load Remover v1.1.3 - by MrMonsh

## Variables

We track the following eight variables: 
+ GameState
+ LostControlOfPepsiman
+ ScoreBoardIsPresent
+ EndOfThirdLevel
+ CurrentHoveredMainMenuItem
+ MenuItemIsSelected
+ LoadingBlackScreen1
+ LoadingBlackScreen2

### GameState (offset 0x95880)
This address tells us what the game is currently playing, whether it's a level, a cutscene, a level loading, pepsiman's death or the main menu.

#### GameState Values
+ 7: Game Over/End of Credits (used for auto-resets)
+ 8: Main Menu (used for auto-start)
+ 14: Currently playing a level
+ 39: For a split second, during the black screen between the fatman cutscene and the cutscene where pepsiman talks with someone (at the beginning of each act).
  + This value is particularly useless for our purposes.
+ 40: 3D cutscene for first level of the each act
+ 41: Loading the first level of the each act (used to detect loading for Load Remover)
+ 42: Loading the second level of the each act (used to detect loading for Load Remover and to auto-split first level)
+ 43: Loading the third level of the each act (used to detect loading for Load Remover and to auto-split second level)
+ 44: A fat man cutscene

### LostControlOfPepsiman (offset 0x4023C)
This address tells us exactly when we lose control of Pepsiman, whether it's during the end of a level or during the initial cutscene of a level.
+ Value 0 means we're currently in control of Pepsiman, 1 means we're not in control.

### ScoreBoardIsPresent (offset 0x95A80)
This address tells us exactly when the Score Board at the end of each level is present on the screen.
+ Value 0 means it's not present, 1 means it's present.

### EndOfThirdLevel (offset 0xACF1C)
This address tells us exactly when we stop controlling Pepsiman at the end of the third level of each act, given that GameState doesn't pick up on this.

#### EndOfThirdLevel Values
+ 24480: Lost control of Pepsiman (due to reaching the end of the level)
+ 67817236: Currently playing the level, paused or at the main menu
+ 151703316: Currently playing level 1-2
+ 3774875200: Fade out at the end of level cutscene

Note: This address has other possible (and wildly different) values during loads, but since we're not tracking this value during loads they're not of any interest for our purposes and we can disregard them.

### CurrentHoveredMainMenuItem (offset 0xFA274)
This address tells us which is the current MAIN menu item we're stepped on, from the list of available items of our main menu.
The amount of items may vary depending whether you have played the game before or not, given the Free Play and Continue options are unlocked in this fashion. 
+ Value 0 is the top item, 1 is the one right under it, and so on.
  + As such, "Game Start" is always value 0, since it's always at the top of the main menu, and this is the one we're concerned with.
  + If you enter a sub-menu (such as Options or Free Play), this value doesn't change, regardless of what you do inside it.

### MenuItemIsSelected (offset 0xE05BE)
This address tells us if the current menu item was selected (ie. player pressed circle to select it).

#### MenuItemIsSelected Values
+ 64: Passive State
+ 20: Menu Item Selected

### LoadingBlackScreen1 (offset 0xE1F48)
This address tells us if we're currently in the middle of a black screen, specifically the one that takes places right before a fatman cutscene (between "Game Start" and the fatman cutscene).
+ Value 0 means it's not present, 1 means it's present.

### LoadingBlackScreen2 (offset 0x9586C)
This address tells us if we're currently in the middle of a black screen, specifically the one that takes places between the fatman cutscene and the cutscene where Pepsiman talks to someone at the beginning of each chapter.
+ Value 0 means it's not present, 1 means it's present.
