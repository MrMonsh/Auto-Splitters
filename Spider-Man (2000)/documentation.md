# Spider-Man (2000) Auto-Splitter & Load Remover v0.9.4 - by MrMonsh

## Variables

We track the following 12 variables: 
+ IsDemo
+ IsLoading
+ IsPlaying
+ DeathMenu
+ IsCutscene
+ IsMainMenu 
+ MainMenuItem
+ LevelEnd 
+ PauseMenu
+ UnlockedCostumes
+ IsComicCover
+ LevelID

<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [FAQ](#FAQ)
- [Supported Emulator/Versions](#supported-emulator/versions)
- [Installation Guide](#installation-guide)
- [Contact](#contact)

<!-- /TOC -->

## IsDemo
**Offset:** 0xB5778

This address tells us if the game is currently playing a demo or not.
+ Value 0 means we're currently not playing a demo, value 1 means we are.

## IsLoading
**Offset:** 0xB556C

This address tells us if the game's currently loading. However, it's a bit inconsistent so I wouldn't rely on it unless paired with an alternative variable.
+ Value 0 means the game is not currently loading, value 1 means game's loading.

## IsPlaying
**Offset:** 0xB5264

This address tells us if we're currently in the middle of playing _something_, whether it is a regular level, a training room or a demo.
+ Value 0 means we're currently not playing anything, value 1 means we're playing.

## DeathMenu
**Offset:** 0xB4F34

This address tells us if we're currently at the Death Menu and/or loading a level after dying. Once it picks a value it won't go back to 0 until you start playing a level again (after loads).

### DeathMenu Values
+ 0: At Main Menu after resetting the console / Playing a level normally
+ 2: At Death Menu / Loading a level after dying
+ 3: At Save Menu / Save selection
+ 7: After manually quitting a level (without dying)
+ 8: Loading after manually restarting a level (without dying)

## IsCutscene
**Offset:** 0xB4E84

This address tells us exactly when we are playing a _pre-rendered_ cutscene. This means that mid-level 3D cutscenes do **NOT** count for this variable.
+ Value 0 means we're currently outside of pre-rendered cutscenes, value 1 means we're currently watching one.

## IsMainMenu
**Offset:** 0xB579C

This address tells us whether we're currently at the Main Menu or not.
+ Value 0 means we're currently outside of the Main Menu, value 1 means we're currently at the Main Menu.

## MainMenuItem
**Offset:** 0xE254

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

## LevelEnd
**Offset:** 0x1FFF9F

This address tells us if we've reached the end of a level, either by reaching the usual blue tinted screen or the end of a cutscene.

### LevelEnd Values
+ 0: Default
+ 128: Reached Blue Tinted Screen/End of Level

## PauseMenu
**Offset:** 0xB49D4

This address tells us if we're currently inside the Pause Menu while on a level.

### PauseMenu Values
+ 0: Not on Pause Menu
+ 1: Pause Menu is active
+ 3: At the "Quit" confirmation screen

## UnlockedCostumes
**Offset:** 0xA5708

This address tells us what costumes are currently unlocked. This is actually a Binary Bit flag consisting of 10 consecutive bits.

### UnlockedCostumes Values
+ 0: Literally 0 costumes unlocked, including default (never happens unless hax)
  + When you go to Costume Selection, all costumes will be locked, but the game will still allow you to continue using whichever costume you're currently wearing to avoid breaking itself.
  + Since the game isn't prepared for this scenario, once you do this the default costume will never be able to be unlocked again on this save (unless you hack the value again).
+ 1: Default Costume
+ 2: Spider-Man 2099
+ 4: Symbiote Spider-Man
+ 8: Captain Universe
+ 16: Spidey Unlimited
+ 32: Amazing Bag Man
+ 64: Scarlet Spidey
+ 128: Ben Reilly
+ 256: Quick-Change Spidey
+ 512: Peter Parker
+ Any other values work as additions of the aforementioned. Examples:
  + Value 3 would be (2 + 1) = (2099 + Default)
  + Value 545 would be (512 + 32 + 1) = (Peter Parker + Bag Man + Default)

## IsComicCover
**Offset:** 0x1FFB3C

This address tells us whether we're currently seeing a Comic Cover or not.

### IsComicCover Values
+ 116: Currently seeing a Comic Cover
+ Literally anything else: Not seeing a Comic Cover. _Trust me bro_

## LevelID
**Offset:** 0xB53C4

This address tells us what level we're currently in (or which level was last played if we're at the menu).

### LevelID Values
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
