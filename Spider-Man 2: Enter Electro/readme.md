# Spider-Man 2: Enter Electro Auto-Splitter & Load Remover v1.0.1 - by MrMonsh

<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [FAQ](#FAQ)
- [Supported Emulators](#supported-emulators)
- [Installation Guide](#installation-guide)
- [Contact](#contact)

<!-- /TOC -->

## FAQ

**Q:** What's an Auto-Splitter?

**A:** An Auto-Splitter is a tool that will start, split, stop and reset the timer automatically for you, allowing you to focus less on the timer and more on what's important: gettin' that sweet PB!


**Q:** What's a Load Remover?

**A:** A Load Remover is a tool that will allow you to have a second timer in your LiveSplit layout that uses "Game Time". 
This timer will function similar to your current timer, but the difference is that this one will stop while the game is loading, meaning load times will not count towards your final time of the run.


**Q:** Will this work for runs on real hardware/console?

**A:** Unfortunately, this auto-splitter can only hook itself into processes running on your PC, meaning that it can't do anything with real console runs and that it'll only work for emulator.


**Q:** Why is the Auto-Splitter not working?

**A:** This could happen due to a myriad of reasons. Assuming you're using one of the supported emulators, these could be likely reasons:
+ Your version of the emulator is too old or too recent to be supported
+ You have multiple instances of supported emulators which could be confusing the Auto-Splitter tool
+ You have another Auto-Splitter active, possibly from another game you ran in the past
+ Sometimes the auto-start feature just refuses to work. Auto-splitting and auto-resetting should work 100% of the time as long as it's enabled though.

## Supported Emulators

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
	+ QT Front-End version (only up to versions from August 2023)
 
### ⚠️ Important Notice ⚠️
* This auto-splitter will only work for the NTSC-U retail version of the game. Neither PAL or the pre-9/11 versions of the game will work correctly with this tool for the time being.
* If you want to use the auto-start feature, please open LiveSplit while at the Main Menu (if you're inside a sub-menu, please exit it), otherwise it'll not work.

## Installation Guide

1. Open your LiveSplit.
2. Right-click on the LiveSplit window, then select "Edit Splits".
3. Under "Game Name", write the name of the game exactly like this: "Spider-Man 2: Enter Electro".
4. On the line mentioning the auto-splitter, click on "Activate" first, then click on the now-enabled "Settings" button.
5. **[OPTIONAL]** Select which functions from the Auto-Splitter you'd like to use (Auto-Starts, Auto-Splits and/or Auto-Resets). 
6. **[OPTIONAL]** Change the advanced settings to fine-tune when exactly the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	+ For running anything other than 100%, I'd personally leave the settings as they are by default, otherwise just read what each setting does and you'll know which ones to use.
8. Click "OK" on the settings window, then click "OK" on the Splits window.
9. You're done! Now you can boot up the emulator and run to your heart's content.

Now, Spider-Man 2: Enter Electro currently only takes Time with Loads into account for your final time on the leaderboard if you're running on emulator, so having a Loadless Timer (which would pause during loads between levels) is as of yet *not necessary at all*.

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
