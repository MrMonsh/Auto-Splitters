# Pepsiman Auto-Splitter & Load Remover v0.9.3 - by MrMonsh

<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->

- [FAQ](#FAQ)
- [Supported Emulator/Versions](#supported-emulator/versions)
- [Installation Guide](#installation-guide)
- [Changelog](#changelog)

<!-- /TOC -->

## FAQ

**Q:** What's an Auto-Splitter?

**A:** An Auto-Splitter is a tool that will start, split, stop and reset the timer automatically for you, allowing you to focus less on the timer and more on what's important: Drinking Pepsi!




**Q:** What's a Load Remover?

**A:** A Load Remover is a tool that will allow you to have a second timer in your LiveSplit layout that uses "Game Time". 
This timer will function similar to your current timer, but the difference is that this one will stop while the game is loading, meaning load times will not count towards your final time of the run.

## Supported Emulator/Versions

+ pSX/psxFin v1.13
+ XEBRA 2020-04-05
+ ePSXe v1.7.0
+ ePSXe v1.9.0
+ mednafen v1.26.1 win32
+ mednafen v1.26.1 win64
+ BizHawk v2.4.2
+ BizHawk v2.5.2
+ BizHawk v2.6.1

## Installation Guide

1. Open your LiveSplit.
2. Right-click on the LiveSplit window, then select "Edit Splits".
3. On the line mentioning the auto-splitter, click on "Activate" first, then click on the now-enabled "Settings" button.
4. **[OPTIONAL]** Select which functions from the Auto-Splitter you'd like to use (Auto-Starts, Auto-Splits and/or Auto-Resets). 
5. **[OPTIONAL]** Change the advanced settings to fine-tune when exactly the timer should auto-start, auto-split and/or auto-reset. Each setting will give you more info on what it does by hovering it with the mouse.
	+ In the topic of changing the "Timer Start" advanced settings, I'd personally leave it as-is, given that its set to start on Game Start select at Main Menu (which is how the current ruleset works). I added this just for future-proofing.
7. Click "OK" on the settings window, then click "OK" on the Splits window.
8. Right-click again on the LiveSplit window, then select "Edit Layout".
9. Click on the "+" button and select "Timer > Timer".
10. Select the newly added "Timer", then select "Game Time" for the Timing Method option.
	+ I personally also suggest changing the height slider of this timer so that it's noticeably smaller than the original one, to differentiate them easily.
9. Click "OK".
10. You're done! Now you can boot up the emulator and run to your heart's content.

### Important Notice

**If you had a version of the Auto-Splitter prior to 0.9.3, please make sure you get rid of the "Scriptable Auto-Splitter" section of your layout, as you will otherwise run into issues due to having two different versions running at the same time.**

If you have any issues setting up the Auto-Splitter or need any help in general, don't hesitate to get in touch with me!

## Changelog

You can read the complete changelog here: https://www.speedrun.com/pepsiman/thread/sjmjx
