# Spider-Man (2000) Auto-Splitter & Load Remover v0.9.7 - by MrMonsh

<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [FAQ](#FAQ)
- [Supported Emulators/Versions](#supported-emulators/versions)
- [Installation Guide](#installation-guide)
- [Contact](#contact)

<!-- /TOC -->

## FAQ

**Q:** What's an Auto-Splitter?

**A:** An Auto-Splitter is a tool that will start, split, stop and reset the timer automatically for you, allowing you to focus less on the timer and more on what's important: gettin' that sweet PB!




**Q:** What's a Load Remover?

**A:** A Load Remover is a tool that will allow you to have a second timer in your LiveSplit layout that uses "Game Time". 
This timer will function similar to your current timer, but the difference is that this one will stop while the game is loading, meaning load times will not count towards your final time of the run.

## Supported Emulators/Versions

+ Windows PC version:
	+ Stand-alone
 	+ with DxWnd
  	+ with D3DWindower
  	+ with dgVoodoo
+ DC Emulators:
	+ DEMUL
		+ v0.5.5
   		+ v0.5.6
 		+ v0.5.7
         	+ v0.7
+ PS1 Emulators:
	+ pSX/psxFin 
		+ v1.13
	+ ePSXe 
		+ v1.9.0
	+ RetroArch*
		+ Beetle PSX core
		+ Beetle PSX HW core
		+ PCSX Rearmed core
		+ Duckstation core
	+ DuckStation
		+ NoGUI version
		+ QT Front-End version

### ⚠️ Important Notes ⚠️

1. Windows PC will not be getting the auto-start feature, only auto-splits and auto-resets. Load removal is pointless since it's got no loads.
2. DC Emulators will not be getting the auto-start feature, only auto-splits, auto-resets and load removal. That being said, load removal for DC is still buggy, so use at your own risk.
3. Even if you use RetroArch to emulate N64/DC, the auto-splitter will currently still assume you're using PS1. My apologies for the inconvenience.

## Installation Guide

1. Download the Spider-Man_(2000)_Auto-Splitter.asl file from [this repository](https://github.com/MrMonsh/Auto-Splitters/blob/main/Spider-Man%20(2000)/Spider-Man_(2000)_Auto-Splitter.asl).
2. Open your livesplit.
3. Select "Edit Layout".
4. Click on the "+" button, then select "Control > Scriptable Auto Splitter".
5. Select the newly added "Scriptable Auto Splitter", then browse your files and link it to the Spider-Man_(2000)_Auto-Splitter.asl file.
6. **(OPTIONAL)** Select which functions from the Auto-Splitter you'd like to use. 
7. **(OPTIONAL)** Change the advanced settings for when the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	+ In the event you're running anything other than 100%, the default settings should work just fine for you. For 100% you probably want to fine tune the settings. Just use common sense or ask me if in doubt :)
8. Click "OK".
9. You're done! Now you can boot up the emulator and run to your heart's content.
	+ As a side note, you should make sure that there's no other auto-splitters (ie. from other games) that are active at the same time as this one, otherwise they'll most likely conflict with each other and you'll get confusing results.

Now, Spider-Man (2000) currently only takes RTA time into account for your final time on the emulator leaderboard, so having a Loadless Timer (which would pause during loads between levels) is as of yet *not necessary at all*.

However, in the event you'd still like to show a Loadless Timer/Time without Loads side to side with your default timer for comparison, you can follow these extra steps to achieve that with this tool:
1. Right-click again on the LiveSplit window, then select "Edit Layout".
2. Click on the "+" button and select "Timer > Timer".
3. Select the newly added "Timer", then select "Game Time" for the Timing Method option.
	+ I personally also suggest changing the height slider of this timer so that it's noticeably smaller than the original one, to differentiate them easily.
4. Click "OK".
5. Done! Now you should have 2 timers, the bigger one showing Time without Loads and the smaller one showing Time with Loads.

## Contact

If you have any issues setting up the Auto-Splitter or need any help in general, don't hesitate to get in touch with me!
+ Speedrun.com Profile: https://www.speedrun.com/user/MrMonsh
+ Discord Tag: Monsh#3403
