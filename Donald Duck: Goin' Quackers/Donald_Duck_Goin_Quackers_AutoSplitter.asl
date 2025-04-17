// DONALD DUCK: GOIN' QUACKERS AUTO-SPLITTER AND LOAD REMOVER v1.0.1 - by MrMonsh

state("XEBRA", "20200405")
{
  	byte IsPlaying : "xebra.exe", 0xA71F8, 0xE017;
	byte IsMainHub : "xebra.exe", 0xA71F8, 0xE056;
	byte IsGameOver : "xebra.exe", 0xA71F8, 0xB8D87;
	byte IsStartScreen : "xebra.exe", 0xA71F8, 0x1E5F72;
	byte HitsOnMerlock : "xebra.exe", 0xA71F8, 0xEAB84;
	byte FirstTimeControl : "xebra.exe", 0xA71F8, 0x1046E;
}

state("ePSXe", "v1.9.0")
{
  	byte IsPlaying : "ePSXe.exe", 0x6659B7;
	byte IsMainHub : "ePSXe.exe", 0x6659F6;
	byte IsGameOver : "ePSXe.exe", 0x710727;
	byte IsStartScreen : "ePSXe.exe", 0x83D912;
	byte HitsOnMerlock : "ePSXe.exe", 0x742524;
	byte FirstTimeControl : "ePSXe.exe", 0x667E0E;
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
	//settings.Add("startOnNewGame", false, "Start on New Game", "start_group");
	//settings.SetToolTip("startOnNewGame", "The timer will start as soon as you select 'New Game' on the Main Menu.");
	
	// Add setting 'startOnControlGain', with 'start_group' as parent
	settings.Add("startOnControlGain", true, "Start on control gain", "start_group");
	settings.SetToolTip("startOnControlGain", "The timer will start as soon as we gain control of Donald Duck on the main hub, outside of cutscenes and loading screens.");


	// Add setting group 'split_group'
	settings.Add("split_group", true, "Splitting");
	settings.SetToolTip("split_group", "Choose how you want to split. Timer will also automatically split when you get the last hit on Merlock. Choose only one.");

	// Add setting 'splitOnLevelEnd', with 'split_group' as parent
	settings.Add("splitOnLevelEnd", true, "Split at end of Level", "split_group");
	settings.SetToolTip("splitOnLevelEnd", "The timer will split as soon as the level fades out when you reach the end of the level.");

	// Add setting 'splitOnEnteringNewLevel', with 'split_group' as parent
	settings.Add("splitOnEnteringNewLevel", false, "Split when entering new Level", "split_group");
	settings.SetToolTip("splitOnEnteringNewLevel", "The timer will split as soon as you enter a new level.");

	
	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");
	
	// Add setting 'resetOnGameOver', with 'reset_group' as parent
	//settings.Add("resetOnGameOver", true, "Reset on Game Over", "reset_group");
	//settings.SetToolTip("resetOnGameOver", "The timer will reset as soon as you get a 'Game Over'.");

	// Add setting 'resetOnStartScreen', with 'reset_group' as parent
	settings.Add("resetOnStartScreen", true, "Reset on Start Screen", "reset_group");
	settings.SetToolTip("resetOnStartScreen", "The timer will reset as soon as you get back to the Start Screen.");

	vars.timerModel = new TimerModel { CurrentState = timer };
}


init 
{
	var firstModuleMemorySize = modules.First().ModuleMemorySize;
	var processName = memory.ProcessName.ToLower();
	vars.shouldUseWatchers = false;
	vars.foundMemoryOffset = false;
	vars.firstUpdate = true;
	vars.comingFromStartScreen = false;
	vars.timer = 0;

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
				new MemoryWatcher<byte>(memoryOffset + 0xE056) { Name = "IsMainHub" },
				new MemoryWatcher<byte>(memoryOffset + 0xB8D87) { Name = "IsGameOver" },
				new MemoryWatcher<byte>(memoryOffset + 0x1E5F72) { Name = "IsStartScreen" },
				new MemoryWatcher<byte>(memoryOffset + 0xEAB84) { Name = "HitsOnMerlock" },
				new MemoryWatcher<byte>(memoryOffset + 0x1046E) { Name = "FirstTimeControl" }
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
			current.IsGameOver = vars.watchers["IsGameOver"].Current;
			current.IsStartScreen = vars.watchers["IsStartScreen"].Current;
			current.HitsOnMerlock = vars.watchers["HitsOnMerlock"].Current;
			current.FirstTimeControl = vars.watchers["FirstTimeControl"].Current;
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsPlaying = vars.watchers["IsPlaying"].Current;
				old.IsMainHub = vars.watchers["IsMainHub"].Current;
				old.IsGameOver = vars.watchers["IsGameOver"].Current;
				old.IsStartScreen = vars.watchers["IsStartScreen"].Current;
				old.HitsOnMerlock = vars.watchers["HitsOnMerlock"].Current;
				old.FirstTimeControl = vars.watchers["FirstTimeControl"].Current;
				vars.firstUpdate = false;
			}
		}
	}
	
	vars.comingFromStartScreen = vars.comingFromStartScreen || (current.IsMainHub == 6 && old.IsStartScreen == 1 && current.IsStartScreen == 255);
	if (current.IsStartScreen != 1 && current.IsPlaying == 128 && current.IsMainHub == 7)
		vars.comingFromStartScreen = false;

	if (vars.timer == 180){
 		print("-------------------------------------------------------------------------");
 		print("ComingFromStartScreen: " + vars.comingFromStartScreen);
 		print("IsPlaying: " + old.IsPlaying.ToString() + " " + current.IsPlaying.ToString());
 		print("IsGameOver: " + old.IsGameOver.ToString() + " " + current.IsGameOver.ToString());
 		print("IsStartScreen: " + old.IsStartScreen.ToString() + " " + current.IsStartScreen.ToString());
 		print("IsMainHub: " + old.IsMainHub.ToString() + " " + current.IsMainHub.ToString());
 		print("HitsOnMerlock: " + old.HitsOnMerlock.ToString() + " " + current.HitsOnMerlock.ToString());
 		print("-------------------------------------------------------------------------");
		vars.timer = 0;
 	}

	vars.timer += 1;

	return version != "" && (!vars.shouldUseWatchers || (vars.foundMemoryOffset && !justFoundMemoryOffset));
}

start 
{
	//if (settings["startOnNewGame"])
		//return old.IsStartScreen == 1 && current.IsStartScreen == 255;
	if (settings["startOnControlGain"]) 
		return vars.comingFromStartScreen && current.IsStartScreen != 1 && current.FirstTimeControl == 1 && old.IsPlaying == 0 && current.IsPlaying == 128;
}

split
{
  	var isThirdHitOnMerlock = old.HitsOnMerlock == 2 && current.HitsOnMerlock == 3;
  	var isLevelEnd = old.IsMainHub == 7 && old.IsPlaying == 128 && current.IsPlaying == 0;
	var enteringNewLevel = !vars.comingFromStartScreen && old.IsMainHub == 6 && old.IsPlaying == 128 && current.IsPlaying == 0;

  	return (settings["splitOnEnteringNewLevel"] && enteringNewLevel) || (settings["splitOnLevelEnd"] && isLevelEnd) || isThirdHitOnMerlock;
}

reset 
{
	return (settings["resetOnStartScreen"] && old.IsStartScreen != 1 && current.IsStartScreen == 1 && current.IsMainHub == 6);
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
