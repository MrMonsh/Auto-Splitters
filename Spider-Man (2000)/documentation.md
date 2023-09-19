# Spider-Man (2000) Auto-Splitter & Load Remover v0.10.0 - by MrMonsh

## Variables

We track the following 18 variables: 
<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->
- [DeathMenu](#deathMenu)
- [IsComicCover](#isComicCover)
- [IsCutscene](#isCutscene)
- [IsDemo (OBSOLETE)](#isDemo)
- [IsLoading](#isLoading)
- [IsMainMenu](#isMainMenu)
- [IsPlaying](#isPlaying)
- [IsStartScreen](#isStartScreen)
- [LevelEnd (OBSOLETE)](#levelEnd)
- [LevelID](#levelID)
- [MainMenuItem](#mainMenuItem)
- [MenuStartPress](#menuStartPress)
- [MenuTrianglePress](#menuTrianglePress)
- [MenuXPress](#menuXPress)
- [OutsideSubMenus](#outsideSubMenus)
- [PauseMenu](#pauseMenu)
- [SubMenuItem](#subMenuItem)
- [UnlockedCostumes](#unlockedCostumes)
<!-- /TOC -->

## DeathMenu
**PS1 Offset:** 0xB4F34

This address tells us if we're currently at the Death Menu and/or loading a level after dying. Once it picks a value it won't go back to 0 until you start playing a level again (after loads).

### DeathMenu Values
+ 0: At Main Menu after resetting the console / Playing a level normally
+ 2: At Death Menu / Loading a level after dying
+ 3: Blue Tint Screen / Loading after beating a level / At Save Menu
+ 7: After manually quitting a level (without dying)
+ 8: Loading after manually restarting a level (without dying)
+ 9: At Death Menu / Loading a level but specifically for the following scenarios:
  + Dying to Monster-Ock
  + Letting MJ drown on Spidey vs. Venom Again!
  + Letting a Hostage die on Hostage Situation / Stop the Bomb!
+ 10: After dying and selecting "Quit to Training" instead of going back directly to Main Menu on a training level

## IsComicCover
**PS1 Offset:** 0x1FFB3C

This address tells us whether we're currently seeing a Comic Cover or not.

### IsComicCover Values
+ 116: Currently seeing a Comic Cover
+ Literally anything else: Not seeing a Comic Cover. _Trust me bro_

## IsCutscene
**PS1 Offset:** 0xB4E84

This address tells us exactly when we are playing a _pre-rendered_ cutscene. This means that mid-level 3D cutscenes do **NOT** count for this variable.

### IsCutscene Values
+ 0: Not playing a cutscene
+ 1: Currently playing a cutscene
  
## IsDemo
**PS1 Offset:** 0xB5778

This address tells us if the game is currently playing a demo or not.
+ **This address/value is OBSOLETE and no longer used for the auto-splitter**, as any blue screens coming from Demos are not DeathMenu 3 (ie. Completing a level) but rather DeathMenu 7 (ie. Quitting a level), which won't *ever* prompt a split.

### IsDemo Values
+ 0: Not playing a Demo
+ 1: Currently playing a Demo

## IsLoading
**PS1 Offset:** 0xB556C

This address tells us if the game's currently loading. However, it's a bit inconsistent so I wouldn't rely on it unless paired with an alternative variable (which I do).

### IsLoading Values
+ 0: Not loading
+ 1: Currently loading

## IsMainMenu
**PS1 Offset:** 0xB579C

This address tells us whether we're currently at the Main Menu or not.

### IsMainMenu Values
+ 0: Not at Main Menu
+ 1: Currently at Main Menu

## IsPlaying
**PS1 Offset:** 0xB5264

This address tells us if we're currently in the middle of playing _something_, whether it is a regular level, a training room or a demo.

### IsPlaying Values
+ 0: Not playing a level
+ 1: Currently playing a level

## IsStartScreen
**PS1 Offset:** 0xB4EE8

This address tells us whether we're currently at the Start Screen or not.

### IsStartScreen Values
+ 0: Past the Start Screen
+ 1: Currently at the Start Screen / Watching a Demo triggered while at the Start Screen

## LevelEnd
**PS1 Offset:** 0x1FFF9F

This address tells us if we've reached the end of a level, either by reaching the usual blue tinted screen or the end of a cutscene.
+ **This address/value is OBSOLETE and no longer used for the auto-splitter**, as it's perfectly covered by DeathMenu when reaching value 3.

### LevelEnd Values
+ 0: Default
+ 128: Reached Blue Tinted Screen/End of Level

## LevelID
**PS1 Offset:** 0xB53C4

This address tells us what level we're currently in (or which level was last played if we're at the menu).

### LevelID Values
+ 29: Credits
+ 61: Spidey vs Carnage!
+ 73: Spidey vs Venom!
+ 97: Item Hunt
+ 98: Spidey vs Rhino!
+ 109: Spidey vs Doc Ock!
+ 122: Subway
+ 162: Sewer Cavern
+ 175: Race to the Bugle
+ 180: Hidden Switches
+ 181: Bank Approach
+ 193: Scale the Girders
+ 195: Tunnel Crawl / Venom's Puzzle
  + Yes, two levels share the same ID. Why NeverSoft, why?
+ 230: Zip-Line Training
+ 234: Sewer Entrance
+ 240: Spidey vs Venom Again!
+ 251: Spidey vs Mysterio!
+ 285: Police Chopper Chase
+ 291: Elevator Descent
+ 294: Get to the Bank!
+ 298: Police Evaded
+ 301: Sewage Plant
+ 312: Underwater Trench
+ 316: Lizard's Maze
+ 333: Spidey vs Scorpion!
+ 337: Building Top Chase
+ 344: Catch Venom
+ 352: Symbiotes Infest Bugle
+ 364: Waterfront Warehouse
+ 380: Stop the Bomb!
+ 426: Stop the Presses!
+ 431: Stopping the Fog!
+ 442: Bugle's Basement
+ 463: Missile Attack
+ 494: Hostage Situation
+ 695: Spidey vs Monster-Ock!

## MainMenuItem
**PS1 Offset:** 0xE254

This address tells us which is the current MAIN menu item we're stepping on.

### MainMenuItem Values
+ 0: Continue
+ 1: New game
+ 2: Memory Card
+ 3: Options
+ 4: Training
+ 5: Records
+ 6: Special
+ 7: Gallery

## MenuStartPress
**PS1 Offset:** 0xA4ED4

This address tells us if the start button is currently pressed.

### MenuStartPress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed (at screens where the button isn't used)
+ 257: Button Pressed (at screens where the button isn't used)

## MenuTrianglePress
**PS1 Offset:** 0xA4DF4

This address tells us if the triangle button is currently pressed.

### MenuTrianglePress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed (at screens where the button isn't used)
+ 257: Button Pressed (at screens where the button isn't used)

## MenuXPress
**PS1 Offset:** 0xA4E24

This address tells us if the X button is currently pressed.

### MenuXPress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed (at screens where the button isn't used)
+ 257: Button Pressed (at screens where the button isn't used)


## OutsideSubMenus
**PS1 Offset:** 0xB5540

This address tells us whether we're currently outside of any sub-menues or not.

### OutsideSubMenus Values
+ 0: Currently inside a sub-menu
+ Literally anything else: Outside of any sub-menu (so, at the start of the main menu). _Trust me bro_

## PauseMenu
**PS1 Offset:** 0xB49D4

This address tells us if we're currently inside the Pause Menu while on a level.

### PauseMenu Values
+ 0: Not on Pause Menu
+ 1: Pause Menu is active
+ 3: At the "Quit" confirmation screen

## SubMenuItem
**PS1 Offset:** 0xE214

This address tells us which is the current SUB menu item we're stepping on.

### SubMenuItem Values
+ 0: First item from the top
+ 1: Second item from the top
+ 2: Third item from the top
+ and so on...

## UnlockedCostumes
**PS1 Offset:** 0xA5708

This address tells us what costumes are currently unlocked. This is actually a Binary Bit flag consisting of 10 consecutive bits.

### UnlockedCostumes Values
+ 0: Literally 0 costumes unlocked, including default (never happens unless hax)
  + The only exception is on N64, where you'll always have the default costume unlocked no matter what.
  + When you go to Costume Selection, all costumes will be locked, but the game will still allow you to continue using whichever costume you're currently wearing to avoid breaking itself.
  + Since the game isn't prepared for this scenario, once you do this the default costume will never be able to be unlocked again on this save (unless you hack the value again).
+ 1: Default Costume
  + N64 will ignore this flag, you'll always have the default costume unlocked no matter what.
+ 2: Spider-Man 2099
+ 4: Symbiote Spider-Man
+ 8: Captain Universe
+ 16: Spidey Unlimited
+ 32: Amazing Bag Man
  + On N64 (where this costume is absent) this flag is still present; it's just unused.
+ 64: Scarlet Spidey
+ 128: Ben Reilly
+ 256: Quick-Change Spidey
+ 512: Peter Parker
+ Any other values work as additions of the aforementioned. Examples:
  + Value 3 would be (2 + 1) = (2099 + Default)
  + Value 545 would be (512 + 32 + 1) = (Peter Parker + Bag Man + Default)
