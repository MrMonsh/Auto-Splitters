# Spider-Man 2: Enter Electro Auto-Splitter & Load Remover v0.6.0 - by MrMonsh

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

+ PS1 Emulators:
	+ pSX/psxFin 
		+ v1.13
	+ ePSXe 
		+ v1.9.0
	+ RetroArch
		+ Beetle PSX core
		+ Beetle PSX HW core
		+ PCSX Rearmed core
		+ Duckstation core
	+ DuckStation
		+ NoGUI version
		+ QT Front-End version
 
### ⚠️ Important Notice ⚠️
This auto-splitter will only work for the NTSC-U retail version of the game. Neither PAL or the pre-9/11 versions of the game will work correctly with this tool for the time being.

## Installation Guide

1. Download the Spider-Man_Enter_Electro_Auto-Splitter.asl file from [this repository](https://github.com/MrMonsh/Auto-Splitters/blob/main/Spider-Man%202%3A%20Enter%20Electro/Spider-Man_Enter_Electro_Auto-Splitter.asl).
2. Open your livesplit.
3. Select "Edit Layout".
4. Click on the "+" button, then select "Control > Scriptable Auto Splitter".
5. Select the newly added "Scriptable Auto Splitter", then browse your files and link it to the Spider-Man_Enter_Electro_Auto-Splitter.asl file.
6. **(OPTIONAL)** Select which functions from the Auto-Splitter you'd like to use. 
7. **(OPTIONAL)** Change the advanced settings for when the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	+ In the event you're running anything other than 100%, the default settings should work just fine for you. For 100% you probably want to fine tune the settings. Just use common sense or ask me if in doubt :)
8. Click "OK".
9. You're done! Now you can boot up the emulator and run to your heart's content.
	+ As a side note, you should make sure that there's no other auto-splitters (ie. from other games) that are active at the same time as this one, otherwise they'll most likely conflict with each other and you'll get confusing results.

Now, Spider-Man 2: Enter Electro currently only takes RTA time into account for your final time on the emulator leaderboard, so having a Loadless Timer (which would pause during loads between levels) is as of yet *not necessary at all*.

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
