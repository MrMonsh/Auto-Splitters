# Spider-Man (2000) Auto-Splitter & Load Remover v0.1 - by MrMonsh

## Variables

We track the following eleven variables: 
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

### IsLoading (offset 0xB556C)
This address tells us if the game's currently loading. However, it's a bit inconsistent so I wouldn't rely on it unless paired with an alternative variable.
+ Value 0 means the game is not currently loading, value 1 means game's loading.

### IsPlaying (offset 0xB5264)
This address tells us if we're currently in the middle of playing _something_, whether it is a regular level, a training room or a demo.
+ Value 0 means we're currently not playing anything, value 1 means we're playing.

### DeathMenu (offset 0xB4F34)
This address tells us if we're currently at the Death Menu and/or loading a level after dying. Once it picks a value it won't go back to 0 until you start playing a level again (after loads).

#### DeathMenu Values
+ 0: At Main Menu after resetting the console / Playing a level normally
+ 2: At Death Menu / Loading a level after dying
+ 3: At Save Menu / Save selection
+ 7: After manually quitting a level (without dying)
+ 8: Loading after manually restarting a level (without dying)

### IsCutscene (offset 0xB4E84)
This address tells us exactly when we are playing a _pre-rendered_ cutscene. This means that mid-level 3D cutscenes do **NOT** count for this variable.
+ Value 0 means we're currently outside of pre-rendered cutscenes, value 1 means we're currently watching one.

### IsMainMenu (offset 0xB579C)
This address tells us whether we're currently at the Main Menu or not.
+ Value 0 means we're currently outside of the Main Menu, value 1 means we're currently at the Main Menu.

### MainMenuItem (offset 0xE254)
This address tells us which is the current MAIN menu item we're stepping on.

#### MainMenuItem Values
+ 0: Continue
+ 1: New game
+ 2: Memory Card
+ 3: Options
+ 4: Training
+ 5: Records
+ 6: Special
+ 7: Gallery

### LevelEnd (offset 0x1FFF9F)
This address tells us if we've reached the end of a level, either by reaching the usual blue tinted screen or the end of a cutscene.

#### LevelEnd Values
+ 0: Default
+ 128: Reached Blue Tinted Screen/End of Level

### PauseMenu (offset 0xB49D4)
This address tells us if we're currently inside the Pause Menu while on a level.

#### PauseMenu Values
+ 0: Not on Pause Menu
+ 1: Pause Menu is active
+ 3: At the "Quit" confirmation screen

### UnlockedCostumes (offset 0xA5708)
This address tells us what costumes are currently unlocked. This is actually a Binary Bit flag consisting of 10 consecutive bits.

#### UnlockedCostumes Values
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

### IsComicCover (offset 0x1FFB3C)
This address tells us whether we're currently seeing a Comic Cover or not.
+ Value 0 means we're currently not seeing a ComicCover, value 1 means we are.

### LevelID (offset 0xB53C4)
This address tells us what level we're currently in (or which level was last played if we're at the menu).

#### LevelID Values
+ 73: Spidey vs Venom!
+ 98: Spidey vs Rhino!
+ 122: Subway
+ 162: Sewer Cavern
+ 175: Race to the Bugle
+ 181: Bank Approach
+ 193: Scale the Girders
+ 195: Tunnel Crawl / Venom's Puzzle
  + Yes, two levels share the same ID. Why NeverSoft, why?
+ 234: Sewer Entrance
+ 285: Police Chopper Chase
+ 294: Get to the Bank!
+ 298: Police Evaded
+ 333: Spidey vs Scorpion!
+ 337: Building Top Chase
+ 344: Catch Venom
+ 380: Stop the Bomb!
+ 463: Missile Attack
+ 494: Hostage Situation
+ 695: Spidey vs Monster-Ock!
