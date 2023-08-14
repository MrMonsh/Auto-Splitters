// SPIDER-MAN (2000) AUTO-SPLITTER AND LOAD REMOVER v0.5 - by MrMonsh

state("psxfin", "v1.13")
{
	int IsLoading: "psxfin.exe", 0x171A5C, 0xB556C;
	int IsPlaying: "psxfin.exe", 0x171A5C, 0xB5264;
	int DeathMenu: "psxfin.exe", 0x171A5C, 0xB4F34;
	int IsCutscene : "psxfin.exe", 0x171A5C, 0xB4E84;
  	int IsMainMenu : "psxfin.exe", 0x171A5C, 0xB579C;
	int MenuXPress : "psxfin.exe", 0x171A5C, 0xA4E24;
	int MainMenuItem: "psxfin.exe", 0x171A5C, 0xE254;
	int MenuTrianglePress : "psxfin.exe", 0x171A5C, 0xA4DF4;
	int UnlockedCostumes : "psxfin.exe", 0x171A5C, 0xA5708;
	int LevelID : "psxfin.exe", 0x171A5C, 0xB53C4;
	byte LevelEnd : "psxfin.exe", 0x171A5C, 0x1FFF9F;
	byte PauseMenu: "psxfin.exe", 0x171A5C, 0xB49D4;
	byte IsComicCover : "psxfin.exe", 0x171A5C, 0x1FFB3C;
}

state("ePSXe", "v1.9.0")
{
	int IsLoading: "ePSXe.exe", 0x70CF0C;
	int IsPlaying : "ePSXe.exe", 0x70CC04;
	int DeathMenu : "ePSXe.exe", 0x70C8D4;
	int IsCutscene : "ePSXe.exe", 0x70C824;
  	int IsMainMenu : "ePSXe.exe", 0x70D13C;
	int MenuXPress : "ePSXe.exe", 0x6FC7C4;
	int MainMenuItem : "ePSXe.exe", 0x665BF4;
	int MenuTrianglePress : "ePSXe.exe", 0x6FC794;
	int UnlockedCostumes : "ePSXe.exe", 0x6FD0A8;
	int LevelID : "ePSXe.exe", 0x70CD64;
	byte LevelEnd : "ePSXe.exe", 0x85793F;
	byte PauseMenu : "ePSXe.exe", 0x70C374;
	byte IsComicCover : "ePSXe.exe", 0x8574DC;
}

// RetroArch is a special case, I'll be manually reading its memory
state("retroarch", "N/A"){}

// DuckStation is another special case, I'll be manually reading its memory
state("duckstation-qt-x64-ReleaseLTCG", "N/A") {}
state("duckstation-nogui-x64-ReleaseLTCG", "N/A") {}

startup
{
	// Add setting group 'split_group'
	settings.Add("split_group", true, "Splitting");
	settings.SetToolTip("split_group", "Choose how you want the timer to split. You can choose more than one option.");
	
	// Add setting 'splitOnNewCostume', with 'split_group' as parent
	settings.Add("splitOnNewCostume", true, "Split when unlocking a new costume", "split_group");
	settings.SetToolTip("splitOnNewCostume", "The timer will split as soon as a new costume is unlocked. This only includes Amazing Bag Man, Quick-Change Spidey and Peter Parker (for 100%).");
	
	// Add setting 'splitOnAnyLevel', with 'split_group' as parent
	settings.Add("splitOnAnyLevel", true, "Split when completing any level", "split_group");
	settings.SetToolTip("splitOnAnyLevel", "The timer will split as soon as a level is completed, regardless of which one it is (for Any%).");
	
	// Add setting 'splitOnLastLevelOnly', with 'split_group' as parent
	settings.Add("splitOnLastLevelOnly", false, "Split only when completing the last level", "split_group");
	settings.SetToolTip("splitOnLastLevelOnly", "The timer will split as soon as the last level is completed only (for 100%).");


	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");

	// Add setting 'resetOnQuit', with 'reset_group' as parent
	settings.Add("resetOnQuit", false, "Reset on Quit", "reset_group");
	settings.SetToolTip("resetOnQuit", "The timer will reset as soon as you pause/die and select & confirm Quit. NOT RECOMMENDED FOR 100%.");

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
	else if (processName.Contains("epsxe")) // ePSXe 
	{
		if (firstModuleMemorySize == 10301440)
			version = "v1.9.0";
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

	vars.dontStartUntilMainMenu = true;
  	vars.dontSplitUntilPlaying = true;
	vars.selectedMainMenuItem = -1;
	vars.splitForNewCostume = false;
	vars.isLoading = false;
	
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
				new MemoryWatcher<int>(memoryOffset + 0xB556C) { Name = "IsLoading" },
				new MemoryWatcher<int>(memoryOffset + 0xB5264) { Name = "IsPlaying" },
				new MemoryWatcher<int>(memoryOffset + 0xB4F34) { Name = "DeathMenu" },
				new MemoryWatcher<int>(memoryOffset + 0xB4E84) { Name = "IsCutscene" },
				new MemoryWatcher<int>(memoryOffset + 0xB579C) { Name = "IsMainMenu" },
				new MemoryWatcher<int>(memoryOffset + 0xA4E24) { Name = "MenuXPress" },
				new MemoryWatcher<int>(memoryOffset + 0xE254) { Name = "MainMenuItem" },
				new MemoryWatcher<int>(memoryOffset + 0xA4DF4) { Name = "MenuTrianglePress" },
				new MemoryWatcher<int>(memoryOffset + 0xA5708) { Name = "UnlockedCostumes" },
				new MemoryWatcher<int>(memoryOffset + 0xB53C4) { Name = "LevelID" },
				new MemoryWatcher<byte>(memoryOffset + 0x1FFF9F) { Name = "LevelEnd" },
				new MemoryWatcher<byte>(memoryOffset + 0xB49D4) { Name = "PauseMenu" },
				new MemoryWatcher<byte>(memoryOffset + 0x1FFB3C) { Name = "IsComicCover" }
			};
			break;
		}
	}
	else 
	{
		if (vars.shouldUseWatchers)
		{
			vars.watchers.UpdateAll(game);
			current.IsLoading = vars.watchers["IsLoading"].Current;
			current.IsPlaying = vars.watchers["IsPlaying"].Current;
			current.DeathMenu = vars.watchers["DeathMenu"].Current;
			current.IsCutscene = vars.watchers["IsCutscene"].Current;
			current.IsMainMenu = vars.watchers["IsMainMenu"].Current;
			current.MenuXPress = vars.watchers["MenuXPress"].Current;
			current.MainMenuItem = vars.watchers["MainMenuItem"].Current;
			current.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
			current.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
			current.LevelID = vars.watchers["LevelID"].Current;
			current.LevelEnd = vars.watchers["LevelEnd"].Current;
			current.PauseMenu = vars.watchers["PauseMenu"].Current;
			current.IsComicCover = vars.watchers["IsComicCover"].Current;
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsLoading = vars.watchers["IsLoading"].Current;
				old.IsPlaying = vars.watchers["IsPlaying"].Current;
				old.DeathMenu = vars.watchers["DeathMenu"].Current;
				old.IsCutscene = vars.watchers["IsCutscene"].Current;
				old.IsMainMenu = vars.watchers["IsMainMenu"].Current;
				old.MenuXPress = vars.watchers["MenuXPress"].Current;
				old.MainMenuItem = vars.watchers["MainMenuItem"].Current;
				old.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
				old.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
				old.LevelID = vars.watchers["LevelID"].Current;
				old.LevelEnd = vars.watchers["LevelEnd"].Current;
				old.PauseMenu = vars.watchers["PauseMenu"].Current;
				old.IsComicCover = vars.watchers["IsComicCover"].Current;
				vars.firstUpdate = false;
			}
		}
		
		if (current.IsMainMenu == 1) 
		{ 	
			if (current.MainMenuItem < 8)
				vars.selectedMainMenuItem = -1;
			else if (current.MainMenuItem >= 8 && old.MainMenuItem < 8)
				vars.selectedMainMenuItem = old.MainMenuItem;
		}
		
		vars.dontStartUntilMainMenu = !(current.IsMainMenu == 1 && current.DeathMenu != 3);
		
		if (vars.dontSplitUntilPlaying) 
		{ 
			vars.dontSplitUntilPlaying = !(old.IsPlaying == 0 && current.IsPlaying == 1);
		}
		else if (!vars.dontSplitUntilPlaying)
		{
			if (current.IsPlaying == 0 && (current.IsLoading == 1 || current.DeathMenu == 2 || old.PauseMenu == 1 || old.PauseMenu == 3 || (old.IsMainMenu == 0 && current.IsMainMenu == 1))) 
			{
				vars.dontSplitUntilPlaying = true;
			}
		}
		
		if (!vars.splitForNewCostume && old.UnlockedCostumes != current.UnlockedCostumes) 
		{
			var newCostume = current.UnlockedCostumes - old.UnlockedCostumes;
			vars.splitForNewCostume = newCostume == 32 || newCostume == 256 || newCostume == 512;
		}
		
		if (vars.isLoading)
		{
			if (current.IsLoading == 0 && (current.IsPlaying == 1 || current.IsComicCover == 116 || current.IsCutscene == 1 || current.IsMainMenu == 1))
				vars.isLoading = false;
		}
		else 
		{
			vars.isLoading = current.IsLoading == 1;
		}
	}

	return version != "" && (!vars.shouldUseWatchers || (vars.foundMemoryOffset && !justFoundMemoryOffset));
}

start 
{
	return !vars.dontStartUntilMainMenu && vars.selectedMainMenuItem == 1 && old.MainMenuItem != 1 && current.MenuXPress == 1;
}

split
{
	if (vars.splitForNewCostume)
	{
		vars.splitForNewCostume = false;
		return settings["splitOnNewCostume"];
	}
	else if (!vars.dontSplitUntilPlaying && 
	((old.IsCutscene == 0 && current.IsCutscene == 1) || (old.PauseMenu == 0 && old.LevelEnd == 0 && current.LevelEnd == 128)))
	{
		vars.dontSplitUntilPlaying = true;
		return settings["splitOnAnyLevel"] || (settings["splitOnLastLevelOnly"] && current.LevelID == 695);
	}
	return false;
}

reset 
{
	return  settings["resetOnQuit"] && ((old.PauseMenu == 3 && current.IsPlaying == 0) || (current.DeathMenu == 2 && old.IsMainMenu == 0 && current.IsMainMenu == 1));
}

isLoading 
{
	return vars.isLoading;
}

exit 
{
	print("Emulator Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
