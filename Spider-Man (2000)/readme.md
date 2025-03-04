# Spider-Man (2000) Auto-Splitter & Load Remover v1.2.3 - by MrMonsh

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


**Q:** Will this work for runs on real hardware for consoles?

**A:** Unfortunately, this auto-splitter can only hook itself into processes running on your PC, meaning that it can't do anything with real console runs and that it'll only work for emulator/PC.


**Q:** Why is the Auto-Splitter not working?

**A:** If you opened LiveSplit while the game was already running, please close the game and/or the emulator and re-open it. This should prompt the auto-splitter to look for it's memory address again and work just fine. (Special thanks to **pugman** for their help in diagnosing this!)


**Q:** The Auto-Splitter is still not working after trying the previous suggestion. What now?

**A:** This could happen due to a myriad of reasons. Assuming you're using one of the supported emulators, these could be likely reasons:
+ Your version of the emulator is too old or too recent to be supported
+ You have multiple instances of supported emulators which could be confusing the Auto-Splitter tool. Please close any instances not currently in use.
+ You have another Auto-Splitter active, possibly from another game you ran in the past. Check your LiveSplit Layout for any "Scriptable Auto-Splitter" sections and there's your likely culprit.
+ Sometimes the auto-start feature just refuses to work. Auto-splitting and auto-resetting should work 100% of the time as long as it's enabled though.

## Supported Emulators/Versions

+ Windows PC version:
	+ Stand-alone
 	+ with DxWnd
  	+ with D3DWindower
  	+ with dgVoodoo
+ DC Emulators (PAL ONLY):
	+ DEMUL
 		+ v0.7
   	+ redream
   		+ v1.5.0 (stable release only)
+ N64 Emulators (NTSC-U ONLY):
	+ Project64
 		+ v1.6
+ PS1 Emulators (NTSC-U ONLY):
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

1. **Please open LiveSplit before opening the game** (or if the game is currently open when you open LiveSplit, close it and restart it), otherwise it'll not work.
2. Windows PC will not be getting the auto-start feature, only auto-splits and auto-resets. Load removal is pointless since it's got no loads.
3. DC Emulators will not be getting the auto-start feature, only auto-splits, auto-resets and load removal.
4. N64 Emulators currently don't have neither the auto-start feature nor load removal, only auto-splits and auto-resets. The missing features might be implemented at a later date.
5. Even if you use RetroArch to emulate N64/DC, the auto-splitter will currently still assume you're using PS1. My apologies for the inconvenience.

## Installation Guide

1. If your emulator of choice is currently open, please close it.
2. Open your LiveSplit.
3. Right-click on the LiveSplit window, then select "Edit Splits".
4. Under "Game Name", write the name of the game exactly like this: "Spider-Man (2000)" (or "Spider-Man (2000) Category Extensions").
5. On the line mentioning the auto-splitter, click on "Activate" first, then click on the now-enabled "Settings" button.
6. **[OPTIONAL]** Select which functions from the Auto-Splitter you'd like to use (Auto-Starts, Auto-Splits and/or Auto-Resets). 
7. **[OPTIONAL]** Change the advanced settings to fine-tune when exactly the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	+ For running anything other than 100%, I'd personally leave the settings as they are by default, otherwise just read what each setting does and you'll know which ones to use.
8. Click "OK" on the settings window, then click "OK" on the Splits window.
9. You're done! Now you can boot up the emulator and run to your heart's content.

Now, Spider-Man (2000) currently only takes Time with Loads into account for your final time on the leaderboard if you're running on emulator/PC, so having a Loadless Timer (which would pause during loads between levels) is as of yet *not necessary at all*.

However, in the event you'd still like to show a Loadless Timer/Time without Loads side to side with your default timer for comparison, you can follow these extra steps to achieve that with this tool:
1. Right-click again on the LiveSplit window, then select "Edit Layout".
2. Click on the "+" button and select "Timer > Timer".
3. Select the newly added "Timer", then select "Game Time" for the Timing Method option.
	+ I personally also suggest changing the height slider of this timer so that it's noticeably smaller than the original one, to differentiate them easily.
4. Click "OK".
5. Done! Now you should have 2 timers, the bigger one showing Time without Loads and the smaller one showing Time with Loads.

⚠️ **If you had a version of the Auto-Splitter prior to 0.10.0, please make sure you get rid of the "Scriptable Auto-Splitter" section of your layout, as you will otherwise run into issues due to having two different versions running at the same time.**

## Contact

If you have any issues setting up the Auto-Splitter or need any help in general, don't hesitate to get in touch with me!
+ Speedrun.com Profile: https://www.speedrun.com/user/MrMonsh
+ Discord Tag: Monsh#3403
