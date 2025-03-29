# Donald Duck: Goin' Quackers Auto-Splitter & Load Remover v1.0.0 - by MrMonsh

<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [FAQ](#FAQ)
- [Supported Emulator/Versions](#supported-emulator/versions)
- [Installation Guide](#installation-guide)
- [Contact](#contact)
- [Changelog](#changelog)

<!-- /TOC -->

## FAQ

**Q:** What's an Auto-Splitter?

**A:** An Auto-Splitter is a tool that will start, split, stop and reset the timer automatically for you, allowing you to focus less on the timer and more on what's important: Speedrunning!


**Q:** What's a Load Remover?

**A:** A Load Remover is a tool that will allow you to have a second timer in your LiveSplit layout that uses "Game Time". 
This timer will function similar to your current timer, but the difference is that this one will stop while the game is loading, meaning load times will not count towards your final time of the run.


**Q:** Will this work for runs on real hardware/console?

**A:** Unfortunately, this auto-splitter can only hook itself into processes running on your PC, meaning that it can't do anything with real console runs and that it'll only work for emulator.


**Q:** Why is the Auto-Splitter not working?

**A:** If you opened LiveSplit while the game was already running, please close the game and/or the emulator and re-open it. This should prompt the auto-splitter to look for it's memory address again and work just fine.


**Q:** The Auto-Splitter is still not working after trying the previous suggestion. What now?

**A:** This could happen due to a myriad of reasons. Assuming you're using one of the supported emulators, these could be likely reasons:
+ Your version of the emulator is too old or too recent to be supported
+ You have multiple open instances of supported emulators which could be confusing the Auto-Splitter tool. Please close any instances not currently in use.
+ You have another Auto-Splitter active, possibly from another game you ran in the past. Check your LiveSplit Layout for any "Scriptable Auto-Splitter" sections and there's your likely culprit.


## Supported Emulator/Versions

+ pSX/psxFin 
	+ v1.13
+ XEBRA 
	+ 2020-04-05
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

* **Please open LiveSplit before opening the game** (or if the game is currently open when you open LiveSplit, close it and restart it), otherwise it'll not work.

## Installation Guide

1. If your emulator of choice is currently open, please close it.
2. Open your LiveSplit.
3. Right-click on the LiveSplit window, then select "Edit Splits".
4. Under "Game Name", write the name of the game exactly like this: "Donald Duck: Goin' Quackers".
5. On the line mentioning the auto-splitter, click on "Activate" first, then click on the now-enabled "Settings" button.
6. **[OPTIONAL]** Select which functions from the Auto-Splitter you'd like to use (Auto-Starts, Auto-Splits and/or Auto-Resets). 
7. **[OPTIONAL]** Change the advanced settings to fine-tune when exactly the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
8. Click "OK" on the settings window, then click "OK" on the Splits window.
9. You're done! Now you can boot up the emulator and run to your heart's content.

1. Download the "Donald_Duck_Goin_Quackers_AutoSplitter.asl" file from this repository.
2. If your emulator of choice is currently open, please close it.
3. Open your LiveSplit.
4. Right-click on the LiveSplit window, then select "Edit Splits".
5. Under "Game Name", write the name of the game exactly like this: "Donald Duck: Goin' Quackers".
6. On this same window, you should see an AutoSplitter available and a button to Activate/Deactivate it. Make sure it is ***[Deactivated]***.
7. Click "OK" on the Splits window.
4. Right-click on the LiveSplit window, then select "Edit Layout".
3. Click on the "+" button, then select "Control > Scriptable Auto Splitter".
4. Select the newly added "Scriptable Auto Splitter", then browse your files and link it to the "Donald_Duck_Goin_Quackers_AutoSplitter.asl" file.
5. **[OPTIONAL]** Select which functions from the Auto-Splitter you'd like to use (Auto-Starts, Auto-Splits and/or Auto-Resets).  
6. **[OPTIONAL]** Change the advanced settings for when the timer should auto-start, auto-split and auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	* In the topic of changing the "Timer Start" advanced settings, I'd personally leave it as-is, given that its set to start when you gain control over Donald (which is how the current ruleset works). I added this in the event the rules change and another setting is needed.
7. Click "OK".
8. Click on the "+" button again, but this time select "Timer > Timer".
9. Select the newly added "Timer", then select "Game Time" for the Timing Method option.
10. Click "OK".
11. You're done! Now you can boot up the emulator and run to your heart's content.

Now, Donald Duck: Goin' Quackers currently only takes Time with Loads into account for your final time on the leaderboard, so having a Loadless Timer (which would pause during loads between levels) is as of yet *not necessary at all*.

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
