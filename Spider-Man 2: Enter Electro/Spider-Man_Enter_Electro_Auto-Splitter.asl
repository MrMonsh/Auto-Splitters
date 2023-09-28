// SPIDER-MAN 2: ENTER ELECTRO AUTO-SPLITTER AND LOAD REMOVER v1.0.0 - by MrMonsh

state("psxfin", "v1.13")
{
	int IsLoading: "psxfin.exe", 0x171A5C, 0xC2618;
	int DeathMenu: "psxfin.exe", 0x171A5C, 0xC1F90;
	int IsCutscene : "psxfin.exe", 0x171A5C, 0xC1EE0;
	int IsStartScreen: "psxfin.exe", 0x171A5C, 0xC1F7C;
	int OutsideSubMenus : "psxfin.exe", 0x171A5C, 0xC25EC;
	int MenuXPress : "psxfin.exe", 0x171A5C, 0xB29F8;
	int MenuStartPress : "psxfin.exe", 0x171A5C, 0xB2AA8;
	int MainMenuItem: "psxfin.exe", 0x171A5C, 0x859C;
	int SubMenuItem: "psxfin.exe", 0x171A5C, 0xE214;
	int MenuTrianglePress : "psxfin.exe", 0x171A5C, 0xB29C8;
	int UnlockedCostumes : "psxfin.exe", 0x171A5C, 0xB31F8;
	int LevelID : "psxfin.exe", 0x171A5C, 0xC2364;
	byte IsPlaying: "psxfin.exe", 0x171A5C, 0xC21F0;
	byte PauseMenu : "psxfin.exe", 0x171A5C, 0xC18C4;
	byte IsMainMenu : "psxfin.exe", 0x171A5C, 0xC28F8;
	byte IsSavePrompt : "psxfin.exe", 0x171A5C, 0x105110;
	byte IsBugleHeadline : "psxfin.exe", 0x171A5C, 0xC1F24;
}

state("ePSXe", "v1.9.0")
{
	int IsLoading: "ePSXe.exe", 0x719FB8;
	int DeathMenu : "ePSXe.exe", 0x719930;
	int IsCutscene : "ePSXe.exe", 0x719880;
	int IsStartScreen: "ePSXe.exe", 0x71991C;
	int OutsideSubMenus : "ePSXe.exe", 0x719F8C;
	int MenuXPress : "ePSXe.exe", 0x70A398;
	int MenuStartPress : "ePSXe.exe", 0x70A448;
	int MainMenuItem : "ePSXe.exe", 0x65FF3C;
	int SubMenuItem: "ePSXe.exe", 0x665BB4;
	int MenuTrianglePress : "ePSXe.exe", 0x70A368;
	int UnlockedCostumes : "ePSXe.exe", 0x70AB98;
	int LevelID : "ePSXe.exe", 0x719D04;
	byte IsPlaying : "ePSXe.exe", 0x719B90;
	byte PauseMenu : "ePSXe.exe", 0x719264;
	byte IsMainMenu : "ePSXe.exe", 0x71A298;
	byte IsSavePrompt : "ePSXe.exe", 0x75CAB0;
	byte IsBugleHeadline : "ePSXe.exe", 0x7198C4;
}

// RetroArch is a special case, I'll be manually reading its memory
state("retroarch", "N/A"){}

// DuckStation is another special case, I'll be manually reading its memory
state("duckstation-qt-x64-ReleaseLTCG", "N/A") {}
state("duckstation-nogui-x64-ReleaseLTCG", "N/A") {}

startup
{
	// Add setting group 'start_group'
	settings.Add("start_group", true, "Starting");
	settings.SetToolTip("start_group", "Choose how you want the timer to start. You can choose more than one option.");
	
	// Add setting 'startOnNewGame', with 'start_group' as parent
	settings.Add("startOnNewGame", true, "Start when selecting New Game", "start_group");
	settings.SetToolTip("startOnNewGame", "The timer will start as soon as you start a new game.");

	
	// Add setting group 'split_group'
	settings.Add("split_group", true, "Splitting");
	settings.SetToolTip("split_group", "Choose how you want the timer to split. You can choose more than one option.");
	
	// Add setting 'splitOnAnyLevel', with 'split_group' as parent
	settings.Add("splitOnAnyLevel", true, "Split when completing any level", "split_group");
	settings.SetToolTip("splitOnAnyLevel", "The timer will split as soon as a level is completed, regardless of which one it is (for Any%).");
	
	// Add setting 'splitOnLastLevelOnly', with 'split_group' as parent
	settings.Add("splitOnLastLevelOnly", false, "Split only when completing the last level", "split_group");
	settings.SetToolTip("splitOnLastLevelOnly", "The timer will split as soon as the last level is completed only (for 100%).");

	// Add setting 'splitOnNewCostume', with 'split_group' as parent
	settings.Add("splitOnNewCostume", true, "Split when unlocking a new costume", "split_group");
	settings.SetToolTip("splitOnNewCostume", "The timer will split as soon as a new costume is unlocked. This only includes Prodigy (for 100%).");
	

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
		vars.memorySize = (UIntPtr)0x200000;
  	}
	else if ((processName.Length > 10) && (processName.Substring(0, 11) == "duckstation"))
	{
		version = "N/A";
		vars.shouldUseWatchers = true;
		vars.watchers = new MemoryWatcherList{};
		vars.memorySize = (UIntPtr)0x200000;
	}

	vars.isLoading = false;
	vars.splitForNewCostume = false;
	vars.dontStartUntilMainMenu = true;
  	vars.dontSplitUntilPlaying = true;
	vars.currentSubMenuLevel = 0;
	vars.waitUntilReturnToMainMenu = true; // For Sub-Menus we're not interested in tracking
	vars.menuSelection = new List<int>();
	for (var i = 0; i <= 10; i++)
	{
		vars.menuSelection.Add(-1);
	}
	// vars.menuSelection[0] == Main Menu Selection 
	// vars.menuSelection[1] == First Sub Menu Selection...and so on
	
	
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
			if ((page.RegionSize != vars.memorySize) || (page.Type != MemPageType.MEM_MAPPED))
				continue;
			memoryOffset = page.BaseAddress;
			vars.foundMemoryOffset = true;
			justFoundMemoryOffset = true;
			print("Found MemoryOffset!");
			
			// MemoryWatcher used to get the memory addresses of interest
			vars.watchers = new MemoryWatcherList
			{
				new MemoryWatcher<int>(memoryOffset + 0xC2618) { Name = "IsLoading" },
				new MemoryWatcher<int>(memoryOffset + 0xC1F90) { Name = "DeathMenu" },
				new MemoryWatcher<int>(memoryOffset + 0xC1EE0) { Name = "IsCutscene" },
				new MemoryWatcher<int>(memoryOffset + 0xC1F7C) { Name = "IsStartScreen" },
				new MemoryWatcher<int>(memoryOffset + 0xC25EC) { Name = "OutsideSubMenus" },
				new MemoryWatcher<int>(memoryOffset + 0xB29F8) { Name = "MenuXPress" },
				new MemoryWatcher<int>(memoryOffset + 0xB2AA8) { Name = "MenuStartPress" },
				new MemoryWatcher<int>(memoryOffset + 0x859C) { Name = "MainMenuItem" },
				new MemoryWatcher<int>(memoryOffset + 0xE214) { Name = "SubMenuItem" },
				new MemoryWatcher<int>(memoryOffset + 0xB29C8) { Name = "MenuTrianglePress" },
				new MemoryWatcher<int>(memoryOffset + 0xB31F8) { Name = "UnlockedCostumes" },
				new MemoryWatcher<int>(memoryOffset + 0xC2364) { Name = "LevelID" },
				new MemoryWatcher<byte>(memoryOffset + 0xC21F0) { Name = "IsPlaying" },
				new MemoryWatcher<byte>(memoryOffset + 0xC18C4) { Name = "PauseMenu" },
				new MemoryWatcher<byte>(memoryOffset + 0xC28F8) { Name = "IsMainMenu" },
				new MemoryWatcher<byte>(memoryOffset + 0x105110) { Name = "IsSavePrompt" },
				new MemoryWatcher<byte>(memoryOffset + 0xC1F24) { Name = "IsBugleHeadline" }
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
			current.DeathMenu = vars.watchers["DeathMenu"].Current;
			current.IsCutscene = vars.watchers["IsCutscene"].Current;
			current.IsMainMenu = vars.watchers["IsMainMenu"].Current;
			current.IsSavePrompt = vars.watchers["IsSavePrompt"].Current;
			current.IsStartScreen = vars.watchers["IsStartScreen"].Current;
			current.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
			current.LevelID = vars.watchers["LevelID"].Current;
			current.PauseMenu = vars.watchers["PauseMenu"].Current;
			current.IsLoading = vars.watchers["IsLoading"].Current;
			current.IsBugleHeadline = vars.watchers["IsBugleHeadline"].Current;
			current.OutsideSubMenus = vars.watchers["OutsideSubMenus"].Current;
			current.MenuXPress = vars.watchers["MenuXPress"].Current;
			current.MenuStartPress = vars.watchers["MenuStartPress"].Current;
			current.MainMenuItem = vars.watchers["MainMenuItem"].Current;
			current.SubMenuItem = vars.watchers["SubMenuItem"].Current;
			current.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsPlaying = vars.watchers["IsPlaying"].Current;
				old.DeathMenu = vars.watchers["DeathMenu"].Current;
				old.IsCutscene = vars.watchers["IsCutscene"].Current;
				old.IsMainMenu = vars.watchers["IsMainMenu"].Current;
				old.IsSavePrompt = vars.watchers["IsSavePrompt"].Current;
				old.IsStartScreen = vars.watchers["IsStartScreen"].Current;
				old.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
				old.LevelID = vars.watchers["LevelID"].Current;
				old.PauseMenu = vars.watchers["PauseMenu"].Current;
				old.IsLoading = vars.watchers["IsLoading"].Current;
				old.IsBugleHeadline = vars.watchers["IsBugleHeadline"].Current;
				old.OutsideSubMenus = vars.watchers["OutsideSubMenus"].Current;
				old.MenuXPress = vars.watchers["MenuXPress"].Current;
				old.MenuStartPress = vars.watchers["MenuStartPress"].Current;
				old.MainMenuItem = vars.watchers["MainMenuItem"].Current;
				old.SubMenuItem = vars.watchers["SubMenuItem"].Current;
				old.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
				
				vars.firstUpdate = false;
			}
		}
		
		if (current.IsMainMenu == 1 && current.IsStartScreen == 0 && current.IsCutscene == 0) 
		{ 	
			var menuXPressed = (old.MenuXPress == 0 || old.MenuXPress == 256) && (current.MenuXPress == 1 || current.MenuXPress == 257);
			var menuStartPressed = (old.MenuStartPress == 0 || old.MenuStartPress == 256) && (current.MenuStartPress == 1 || current.MenuStartPress == 257);
			var menuTrianglePressed = (old.MenuTrianglePress == 0 || old.MenuTrianglePress == 256) && (current.MenuTrianglePress == 1 || current.MenuTrianglePress == 257);
			
			if (current.OutsideSubMenus > 0 && (vars.currentSubMenuLevel > 0 || vars.waitUntilReturnToMainMenu)) 
				{
					for (var i = 0; i <= 10; i++)
					{
						vars.menuSelection[i] = -1;
					}
					vars.currentSubMenuLevel = 0;
					if (vars.waitUntilReturnToMainMenu)
						vars.waitUntilReturnToMainMenu = false;
				}
				else if (!vars.waitUntilReturnToMainMenu) 
				{
					var menuLevelZero = Convert.ToInt32(vars.currentSubMenuLevel == 0);
					var menuLevelOnePlus = Convert.ToInt32(vars.currentSubMenuLevel > 0);
					if (menuXPressed || menuStartPressed) 
					{
						vars.menuSelection[vars.currentSubMenuLevel] = (old.MainMenuItem * menuLevelZero) + (old.SubMenuItem * menuLevelOnePlus);
						if (vars.menuSelection[0] == 1 || vars.menuSelection[0] == 4)
							vars.currentSubMenuLevel++;
						else
							vars.waitUntilReturnToMainMenu = true;
					}
					else if (menuTrianglePressed) 
					{
						if (vars.currentSubMenuLevel > 0)
						{
							vars.menuSelection[vars.currentSubMenuLevel - 1] = -1;
							vars.currentSubMenuLevel--;
						}
					}
				}
			}
			
			if (old.DeathMenu == 0 && (current.DeathMenu == 2 || current.DeathMenu == 7 || current.DeathMenu == 9 || current.DeathMenu == 10))
			{
				vars.currentSubMenuLevel = 0;
				for (var i = 0; i <= 10; i++)
				{
					vars.menuSelection[i] = -1;
				}
				
				if (current.DeathMenu == 10)
					vars.waitUntilReturnToMainMenu = true;
			}
		}
		
		var isLastLevel = current.LevelID == 290 || current.LevelID == 291;
		vars.dontStartUntilMainMenu = !(current.IsMainMenu == 1 && (current.DeathMenu != 3 || isLastLevel));
		
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
			vars.splitForNewCostume = newCostume == 4; // Prodigy
		}
		
		if (vars.isLoading)
		{
			if (current.IsLoading == 0 && (current.IsPlaying == 1 || current.IsBugleHeadline == 1 || current.IsCutscene == 1 || current.IsMainMenu == 1 || current.IsSavePrompt == 160))
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
	if (!vars.dontStartUntilMainMenu)
	{
		if (vars.menuSelection[0] == 1 && vars.menuSelection[1] != -1)
		{
			print("Should start timer due to New Game selection!");
			return settings["startOnNewGame"];
		}
	}
	return false;
}

split
{
	if (vars.splitForNewCostume)
	{
		print("Should split due to new costume unlocked!");
		vars.splitForNewCostume = false;
		return settings["splitOnNewCostume"];
	}
	else if (!vars.dontSplitUntilPlaying && current.LevelID != 123 && (current.DeathMenu == 0 || current.DeathMenu == 3) &&
	((old.IsCutscene == 0 && current.IsCutscene == 1) || (old.PauseMenu == 0 && old.DeathMenu == 0 && current.DeathMenu == 3)))
	{
		print("Should split due to a level being completed!");
		vars.dontSplitUntilPlaying = true;
		var isLastLevel = current.LevelID == 290 || current.LevelID == 291;
		return settings["splitOnAnyLevel"] || (settings["splitOnLastLevelOnly"] && isLastLevel);
	}
	return false;
}

reset 
{
	var isDead = current.DeathMenu == 2 || current.DeathMenu == 9;
	return  settings["resetOnQuit"] && ((old.PauseMenu == 3 && current.PauseMenu == 0) || (isDead && old.IsMainMenu == 0 && current.IsMainMenu == 1));
}

isLoading 
{
	return vars.isLoading;
}

exit 
{
	print("Process Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
