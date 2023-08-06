# Spider-Man (2000) Auto-Splitter & Load Remover v0.1 - by MrMonsh

## Variables

We track the following nine variables: 
+ IsDemo
+ IsLoading
+ IsPlaying
+ DeathMenu
+ IsCutscene
+ IsMainMenu 
+ MainMenuItem
+ LevelEnd 
+ PauseMenu

### IsDemo (offset 0xB5778)
This address tells us if the game is currently playing a demo or not.
+ Value 0 means we're currently not playing a demo, value 1 means we are.

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
