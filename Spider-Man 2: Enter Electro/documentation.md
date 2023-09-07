# Spider-Man 2: Enter Electro Auto-Splitter & Load Remover v0.5 - by MrMonsh

## Variables

We track the following 1 variables: 
<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->
- [IsCutscene](#isCutscene)
- [IsDemo](#isDemo)
- [IsLoading](#isLoading)
- [IsPlaying](#isPlaying)
- [IsMainMenu](#isMainMenu)
- [MenuTrianglePress](#menuTrianglePress)
- [MenuXPress](#menuXPress)
- [PauseMenu](#pauseMenu)
- [UnlockedCostumes](#unlockedCostumes)
<!-- /TOC -->

## IsCutscene
**Offset:** 0x?????

This address tells us exactly when we are playing a _pre-rendered_ cutscene. This means that mid-level 3D cutscenes do **NOT** count for this variable.
+ Value 0 means we're currently outside of pre-rendered cutscenes, value 1 means we're currently watching one.

## IsDemo
**Offset:** 0x?????

This address tells us if the game is currently playing a demo or not.
+ Value 0 means we're currently not playing a demo, value 1 means we are.

## IsLoading
**Offset:** 0x?????

This address tells us if the game's currently loading. However, it's a bit inconsistent so I wouldn't rely on it unless paired with an alternative variable (which I do).
+ Value 0 means the game is not currently loading, value 1 means game's loading.

## IsPlaying
**Offset:** 0x?????

This address tells us if we're currently in the middle of playing _something_, whether it is a regular level, a training room or a demo.
+ Value 0 means we're currently not playing anything, value 1 means we're playing.

## IsMainMenu
**Offset:** 0x?????

This address tells us whether we're currently at the Main Menu or not.
+ Value 0 means we're currently outside of the Main Menu, value 1 means we're currently at the Main Menu.


## MenuTrianglePress
**Offset:** 0x??????

This address tells us if the triangle button is currently pressed.

### MenuTrianglePress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed
+ 257: Button Pressed

## MenuXPress
**Offset:** 0x?????

This address tells us if the X button is currently pressed.

### MenuXPress Values
+ 0: Button Not Pressed
+ 1: Button Pressed
+ 256: Button Not Pressed
+ 257: Button Pressed

## PauseMenu
**Offset:** 0x?????

This address tells us if we're currently inside the Pause Menu while on a level.

### PauseMenu Values
+ 0: Not on Pause Menu
+ 1: Pause Menu is active
+ 3: At the "Quit" confirmation screen

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
