# Spider-Man 2: Enter Electro Auto-Splitter & Load Remover v0.5.6 - by MrMonsh

## Variables

We track the following 17 variables: 
<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->
- [DeathMenu](#deathMenu)
- [IsBugleHeadline](#isBugleHeadline)
- [IsCutscene](#isCutscene)
- [IsDemo](#isDemo)
- [IsLoading](#isLoading)
- [IsMainMenu](#isMainMenu)
- [IsPlaying](#isPlaying)
- [IsSavePrompt](#isSavePrompt)
- [IsStartScreen](#isStartScreen)
- [LevelID](#levelID)
- [MenuStartPress](#menuStartPress)
- [MenuTrianglePress](#menuTrianglePress)
- [MenuXPress](#menuXPress)
- [OutsideSubMenus](#outsideSubMenus)
- [PauseMenu](#pauseMenu)
- [SubMenuItem](#subMenuItem)
- [UnlockedCostumes](#unlockedCostumes)
<!-- /TOC -->

## DeathMenu
**Offset:** 0xC1F90

This address tells us if we're currently at the Death Menu and/or loading a level after dying. Once it picks a value it won't go back to 0 until you start playing a level again (after loads).

### DeathMenu Values
+ 0: At Main Menu after resetting the console / Playing a level normally
+ 2: At Death Menu / Loading a level after dying
+ 3: Blue Tint Screen / Loading after beating a level / At Save Menu
+ 7: After manually quitting a level (without dying)
+ 8: Loading after manually restarting a level (without dying)
+ 9: At Death Menu / Loading a level after dying
+ 10: After manually selecting "Quit to Training" instead of going back directly to Main Menu (without dying)

## IsBugleHeadline
**Offset:** 0xC1F24

This address tells us if the game is currently showing a Bugle Headline or not. Goes back to 0 when starting a cutscene.
+ Value 0 means we're currently not seeing a Bugle Headline, value 1 means we are.

## IsCutscene
**Offset:** 0xC1EE0

This address tells us exactly when we are playing a _pre-rendered_ cutscene. This means that mid-level 3D cutscenes do **NOT** count for this variable.
+ Value 0 means we're currently outside of pre-rendered cutscenes, value 1 means we're currently watching one.

## IsDemo
**Offset:** 0xC21F0

This address tells us if the game is currently playing a demo or not.
+ Value 0 means we're currently not playing a demo, value 1 means we are.

## IsLoading
**Offset:** 0xC2618

This address tells us if the game's currently loading. However, it's a bit inconsistent so I wouldn't rely on it unless paired with an alternative variable (which I do).
+ Value 0 means the game is not currently loading, value 1 means game's loading.

## IsMainMenu
**Offset:** 0xC28F8

This address tells us whether we're currently at the Main Menu or not.
+ Value 0 means we're currently outside of the Main Menu, value 1 means we're currently at the Main Menu.

## IsPlaying
**Offset:** 0xC21F0

This address tells us if we're currently in the middle of playing _something_, whether it is a regular level, a training room or a demo.
+ Value 0 means we're currently not playing anything, value 1 means we're playing.

## IsSavePrompt
**Offset:** 0x105110

This address tells us if we're currently in at the "Do you want to save?" prompt or not.

### IsSavePrompt Values
+ 0: Not Save Prompt
+ 160: Currently at Save Prompt

## IsStartScreen
**Offset:** 0xC28F8

This address tells us whether we're currently at the Start Screen or not.

### IsStartScreen Values
+ 0: Past the Start Screen
+ 1: Currently at the Start Screen / Watching a Demo triggered while at the Start Screen

## LevelID
**Offset:** 0xC2364

This address tells us what level we're currently in (or which level was last played if we're at the menu).

### LevelID Values
+ 30: Demo 1 (Henchmen Fight)
+ 48: Challenge: L1 Targeting
+ 49: Challenge: Stealth
+ 50: Demo 2 (Smoke Screen)
+ 54: Demo 3 (To Catch a Thief)
+ 67: Challenge: Zip Line
+ 72: Training: L1 Targeting
+ 74: Challenge: Attack
+ 75: Training: Stealth
+ 86: Challenge: Web Yank
+ 92: Training: Zip Line
+ 96: Challenge: Web Swinging
+ 104: Training: Web Yank
+ 123: Credits
+ 127: Training: Web Swinging
+ 137: Spidey vs. Hammerhead
+ 146: Training: Attack
+ 222: Wind Tunnel / Crash Flight!
+ 228: Warehouse 66
+ 231: Spidey vs. Sandman Again
+ 233: Hangar 18 (Final version)
+ 238: Hangar 18 (Pre 9/11 version)
+ 280: To Catch a Thief
+ 288: Spidey vs. Electro
+ 290: Top of the World (Pre 9/11 version)
+ 291: The Best Laid Plans (Final version)
+ 307: Spidey vs. Shocker
+ 324: Rooftops by Night
+ 330: Spidey vs. Lizard
+ 350: In Darkest Night
+ 381: Training: L2 Targeting
+ 391: Konichi-wa Spider-san
+ 402: Catch that Train!
+ 408: Enter the Web-Head (Pre 9/11 version)
+ 410: Enter the Web-Head (Final version)
+ 420: Challenge: L2 Targeting
+ 472: Smoke Screen
+ 493: Heart of Darkness
+ 507: Training: Instant Action
+ 516: Burglary Interrupted
+ 569: Gangland
+ 644: The Gauntlet / Aces High
+ 645: Spidey in the Machine
+ 651: The Corkscrew / Downward Spiral
+ 742: Rock of Ages
+ 761: Mission: Spidey

## MainMenuItem
**Offset:** 0x859C

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
**Offset:** 0xB2AA8

This address tells us if the start button is currently pressed.

### MenuStartPress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed
+ 257: Button Pressed

## MenuTrianglePress
**Offset:** 0xB29C8

This address tells us if the triangle button is currently pressed.

### MenuTrianglePress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed
+ 257: Button Pressed

## MenuXPress
**Offset:** 0xB29F8

This address tells us if the X button is currently pressed.

### MenuXPress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed
+ 257: Button Pressed

## OutsideSubMenus
**Offset:** 0xC25EC

This address tells us whether we're currently outside of any sub-menues or not.

### OutsideSubMenus Values
+ 0: Currently inside a sub-menu
+ Literally anything else: Outside of any sub-menu (so, at the start of the main menu). _Trust me bro_

## PauseMenu
**Offset:** 0xC18C4

This address tells us if we're currently inside the Pause Menu while on a level.

### PauseMenu Values
+ 0: Not on Pause Menu
+ 1: Pause Menu is active
+ 3: At the "Quit" confirmation screen

## SubMenuItem
**Offset:** 0xE214

This address tells us which is the current SUB menu item we're stepping on.

### SubMenuItem Values
+ 0: First item from the top
+ 1: Second item from the top
+ 2: Third item from the top
+ and so on...

## UnlockedCostumes
**Offset:** 0xB31F8

This address tells us what costumes are currently unlocked. This is actually a Binary Bit flag consisting of 10 consecutive bits.

### UnlockedCostumes Values
+ 0: Literally 0 costumes unlocked, including default (never happens unless hax)
  + When you go to Costume Selection, all costumes will be locked, but the game will still allow you to continue using whichever costume you're currently wearing to avoid breaking itself.
  + Since the game isn't prepared for this scenario, once you do this the default costume will never be able to be unlocked again on this save (unless you hack the value again).
+ 1: Default Costume
+ 2: Spider-Phoenix
+ 4: Prodigy
+ 8: Dusk
+ 16: Insulated Suit
+ 32: Alex Ross - Red
+ 64: Alex Ross - White
+ 128: Venom 2 - Earth X
+ 256: Negative Zone
+ 512: Spider-Man 2099
+ 1024: Symbiote Spider-Man
+ 2048: Captain Universe
+ 4096: Spidey Unlimited
+ 8192: Amazing Bag Man
+ 16384: Scarlet Spidey
+ 32768: Ben Reilly
+ 65536: Quick-Change Spidey
+ 131072: Peter Parker
+ 262144: Battle Damaged
+ Any other values work as additions of the aforementioned. Examples:
  + Value 3 would be (2 + 1) = (Spider-Phoenix + Default)
  + Value 545 would be (512 + 16 + 1) = (Spidey 2099 + Insulated Suit + Default)
