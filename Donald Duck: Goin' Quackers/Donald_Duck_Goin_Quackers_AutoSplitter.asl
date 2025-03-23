// DONALD DUCK: GOIN' QUACKERS AUTO-SPLITTER AND LOAD REMOVER v1.0.0 - by MrMonsh

state("psxfin", "v1.13")
{
	byte IsPlaying : "psxfin.exe", 0x171A5C, 0xE017;
	byte IsMainHub : "psxfin.exe", 0x171A5C, 0x1046E;
	byte IsStartScreen : "psxfin.exe", 0x171A5C, 0x1E5F72;
	byte HitsOnMerlock : "psxfin.exe", 0x171A5C, 0xEAB84;
}

state("XEBRA", "20200405")
{
  byte IsPlaying : "xebra.exe", 0xA71F8, 0xE017;
	byte IsMainHub : "xebra.exe", 0xA71F8, 0x1046E;
	byte IsStartScreen : "xebra.exe", 0xA71F8, 0x1E5F72;
	byte HitsOnMerlock : "xebra.exe", 0xA71F8, 0xEAB84;
}

state("ePSXe", "v1.9.0")
{
  byte IsPlaying : "ePSXe.exe", 0x6659B7;
	byte IsMainHub : "ePSXe.exe", 0x667E0E;
	byte IsStartScreen : "ePSXe.exe", 0x83D912;
	byte HitsOnMerlock : "ePSXe.exe", 0x742524;
}

// RetroArch is a special case, I'll be manually reading its memory
state("retroarch", "N/A"){}

// DuckStation is another special case, I'll be manually reading its memory
state("duckstation-qt-x64-ReleaseLTCG", "N/A") {}
state("duckstation-nogui-x64-ReleaseLTCG", "N/A") {}

startup
{
	// Add setting group 'start_group'
	settings.Add("start_group", true, "Timer Start");
	settings.SetToolTip("start_group", "Choose exactly when to start the timer. Choose only one.");

	// Add setting 'startOnNewGame', with 'start_group' as parent
	settings.Add("startOnNewGame", true, "Start on New Game", "start_group");
	settings.SetToolTip("startOnNewGame", "The timer will start as soon as you select 'New Game' on the Main Menu.");
	
	// Add setting 'startOnControlGain', with 'start_group' as parent
	settings.Add("startOnControlGain", false, "Start on control gain", "start_group");
	settings.SetToolTip("startOnControlGain", "The timer will start as soon as we gain control of Donald Duck on the main hub, outside of cutscenes and loading screens.");


	// Add setting group 'split_group'
	settings.Add("split_group", true, "Splitting");
	settings.SetToolTip("split_group", "Choose how you want to split. Timer will also automatically split when you get the last hit on Merlock. Choose only one.");

	// Add setting 'splitOnLevelEnd', with 'split_group' as parent
	settings.Add("splitOnLevelEnd", true, "Split at end of Level", "split_group");
	settings.SetToolTip("splitOnLevelEnd", "The timer will split as soon as the level fades out when you reach the end of the level.");

	// Add setting 'splitOnEnteringNewLevel', with 'split_group' as parent
	//settings.Add("splitOnEnteringNewLevel", false, "Split when entering new Level", "split_group");
	//settings.SetToolTip("splitOnEnteringNewLevel", "The timer will split as soon as you enter a new level.");

	
	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");

	// Add setting 'resetOnGameOver', with 'reset_group' as parent
	//settings.Add("resetOnGameOver", true, "Reset on Game Over", "reset_group");
	//settings.SetToolTip("resetOnGameOver", "The timer will reset as soon as you get a 'Game Over'.");

	vars.timerModel = new TimerModel { CurrentState = timer };
}


init 
{
	var firstModuleMemorySize = modules.First().ModuleMemorySize;
	var processName = memory.ProcessName.ToLower();
	vars.shouldUseWatchers = false;
	vars.foundMemoryOffset = false;
	vars.firstUpdate = true;

	if (processName.Contains("psxfin")) // pSX/psxfin
	{
		if (firstModuleMemorySize == 3313664)
			version = "v1.13";
	}
	else if (processName.Contains("xebra")) // XEBRA
	{
		if (firstModuleMemorySize == 770048)
			version = "20200405";
	}
	else if (processName.Contains("epsxe")) // ePSXe 
	{
		if (firstModuleMemorySize == 5120000)
			version = "v1.6.0";
		else if (firstModuleMemorySize == 9138176)
			version = "v1.7.0";
		else if (firstModuleMemorySize == 10231808)
			version = "v1.8.0";
		else if (firstModuleMemorySize == 10301440)
			version = "v1.9.0";
		else if (firstModuleMemorySize == 10518528)
			version = "v1.9.25";
		else if (firstModuleMemorySize == 20287488)
			version = "v2.0.0";
		else if (firstModuleMemorySize == 22360064)
			version = "v2.0.2-1";
		else if (firstModuleMemorySize == 25337856)
			version = "v2.0.5";
	}
	else if (processName.Contains("retroarch")) 
	{
		version = "N/A";
		vars.shouldUseWatchers = true;
		vars.watchers = new MemoryWatcherList{};
    	}
	else if ((processName.Length > 10) && (processName.Substring(0, 11) == "duckstation"))
	{
		version = "N/A";
		vars.shouldUseWatchers = true;
		vars.watchers = new MemoryWatcherList{};
	}
	
	vars.CurrentLevel = 0;
	
	print("Current ModuleMemorySize is: " + firstModuleMemorySize.ToString());
	print("CurrentProcess is: " + processName);
	print("CurrentVersion is: " + version);
	print("Using Watchers?: " + vars.shouldUseWatchers);
}

update 
{
	var justFoundMemoryOffset = false;
	
	if (vars.shouldUseWatchers && !vars.foundMemoryOffset)
	{
		IntPtr memoryOffset = IntPtr.Zero;
		
		foreach (var page in game.MemoryPages(true)) 
		{
			if ((page.RegionSize != (UIntPtr)0x200000) || (page.Type != MemPageType.MEM_MAPPED))
				continue;
			memoryOffset = page.BaseAddress;
			vars.foundMemoryOffset = true;
			justFoundMemoryOffset = true;
			print("Found MemoryOffset!");
			
			// MemoryWatcher used to get the memory addresses of interest
			vars.watchers = new MemoryWatcherList
			{
				new MemoryWatcher<byte>(memoryOffset + 0xE017) { Name = "IsPlaying" },
				new MemoryWatcher<byte>(memoryOffset + 0x1046E) { Name = "IsMainHub" },
				new MemoryWatcher<byte>(memoryOffset + 0x1E5F72) { Name = "IsStartScreen" },
				new MemoryWatcher<byte>(memoryOffset + 0xEAB84) { Name = "HitsOnMerlock" }
			};
			break;
		}
	}
	else 
	{
		if (vars.shouldUseWatchers)
		{
			vars.watchers.UpdateAll(game);
			current.IsPlaying = vars.watchers["IsPlaying"].Current;
			current.IsMainHub = vars.watchers["IsMainHub"].Current;
			current.IsStartScreen = vars.watchers["IsStartScreen"].Current;
			current.HitsOnMerlock = vars.watchers["HitsOnMerlock"].Current;
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsPlaying = vars.watchers["IsPlaying"].Current;
				old.IsMainHub = vars.watchers["IsMainHub"].Current;
				old.IsStartScreen = vars.watchers["IsStartScreen"].Current;
				old.HitsOnMerlock = vars.watchers["HitsOnMerlock"].Current;
				vars.firstUpdate = false;
			}
		}
	}

	return version != "" && (!vars.shouldUseWatchers || (vars.foundMemoryOffset && !justFoundMemoryOffset));
}

start 
{
	if (settings["startOnNewGame"])
		return old.IsStartScreen == 1 && current.IsStartScreen == 255;
	else if (settings["startOnControlGain"])
		return old.IsPlaying == 0 && current.IsPlaying == 128;
}

split
{
  isThirdHitOnMerlock = old.HitsOnMerlock == 2 && current.HitsOnMerlock == 3;
  isLevelEnd = old.IsMainHub == 0 && old.IsPlaying == 128 && current.IsPlaying == 0;

  return  (settings["splitOnLevelEnd"] && isLevelEnd) || isThirdHitOnMerlock;
}

reset 
{
	return false;
}

isLoading 
{	
	return current.IsPlaying == 0;
}

exit 
{
	print("Emulator Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
