// SPIDER-MAN (2000) AUTO-SPLITTER AND LOAD REMOVER v0.10.0 - by MrMonsh

state("SpideyPC", "N/A")
{
	int DeathMenu: "SpideyPC.exe", 0x20CFA4;
	int IsCutscene : "SpideyPC.exe", 0x2151F8;
	int OutsideSubMenus : "SpideyPC.exe", 0x6C123C;
	int UnlockedCostumes : "SpideyPC.exe", 0x2828D8;
	int LevelID : "SpideyPC.exe", 0x2B4670;
	byte IsPlaying: "SpideyPC.exe", 0x2A9034;
	byte PauseMenu: "SpideyPC.exe", 0x1FAECC;
	byte IsMainMenu : "SpideyPC.exe", 0x6C7B58;
}

state("project64", "v1.6") 
{
	int DeathMenu : "Project64.exe", 0xD6A1C, 0xF5EE8;
	int IsCutscene : "Project64.exe", 0xD6A1C, 0xFF040;
	int LevelID : "Project64.exe", 0xD6A1C, 0xF95B8;
	int MainMenuItem : "Project64.exe", 0xD6A1C, 0x1099E0;
	int UnlockedCostumes : "Project64.exe", 0xD6A1C, 0xECD7C;
	byte IsPlaying : "Project64.exe", 0xD6A1C, 0xF5594;
	byte PauseMenu : "Project64.exe", 0xD6A1C, 0xF5A04;
  	byte IsMainMenu : "Project64.exe", 0xD6A1C, 0x18A925;
}

state("demul", "N/A") 
{
	int IsLoading: "demul.exe", 0x1A87E8, 0x27F604;
	int DeathMenu: "demul.exe", 0x1A87E8, 0x1CB7F8;
	int IsCutscene : "demul.exe", 0x1A87E8, 0x350944;
	int UnlockedCostumes : "demul.exe", 0x1A87E8, 0x20F90C;
	int LevelID : "demul.exe", 0x1A87E8, 0x202258;
	byte IsPlaying: "demul.exe", 0x1A87E8, 0x2000D4;
	byte PauseMenu : "demul.exe", 0x1A87E8, 0x200114;
	byte IsMainMenu : "demul.exe", 0x1A87E8, 0x20F6B8;
	byte IsSaveMenu : "demul.exe", 0x1A87E8, 0xFC9944;
	byte IsComicCover : "demul.exe", 0x1A87E8, 0x27F910;
}

state("nullDC", "N/A") 
{
}

state("psxfin", "v1.13")
{
	int IsLoading: "psxfin.exe", 0x171A5C, 0xB556C;
	int DeathMenu: "psxfin.exe", 0x171A5C, 0xB4F34;
	int IsCutscene : "psxfin.exe", 0x171A5C, 0xB4E84;
	int IsStartScreen : "psxfin.exe", 0x171A5C, 0xB4EE8;
	int OutsideSubMenus : "psxfin.exe", 0x171A5C, 0xB5540;
	int MenuXPress : "psxfin.exe", 0x171A5C, 0xA4E24;
	int MainMenuItem: "psxfin.exe", 0x171A5C, 0xE254;
	int SubMenuItem: "psxfin.exe", 0x171A5C, 0xE214;
	int MenuStartPress : "psxfin.exe", 0x171A5C, 0xA4ED4;
	int MenuTrianglePress : "psxfin.exe", 0x171A5C, 0xA4DF4;
	int UnlockedCostumes : "psxfin.exe", 0x171A5C, 0xA5708;
	int LevelID : "psxfin.exe", 0x171A5C, 0xB53C4;
	byte IsPlaying: "psxfin.exe", 0x171A5C, 0xB5264;
	byte PauseMenu: "psxfin.exe", 0x171A5C, 0xB49D4;
	byte IsMainMenu : "psxfin.exe", 0x171A5C, 0xB579C;
	byte IsComicCover : "psxfin.exe", 0x171A5C, 0x1FFB3C;
}

state("ePSXe", "v1.9.0")
{
	int IsLoading: "ePSXe.exe", 0x70CF0C;
	int DeathMenu : "ePSXe.exe", 0x70C8D4;
	int IsCutscene : "ePSXe.exe", 0x70C824;
	int IsStartScreen : "ePSXe.exe", 0x70C888;
	int OutsideSubMenus : "ePSXe.exe", 0x70CEE0;
	int MenuXPress : "ePSXe.exe", 0x6FC7C4;
	int MainMenuItem : "ePSXe.exe", 0x665BF4;
	int SubMenuItem: "ePSXe.exe", 0x665BB4;
	int MenuStartPress : "ePSXe.exe", 0x6FC874;
	int MenuTrianglePress : "ePSXe.exe", 0x6FC794;
	int UnlockedCostumes : "ePSXe.exe", 0x6FD0A8;
	int LevelID : "ePSXe.exe", 0x70CD64;
	byte IsPlaying : "ePSXe.exe", 0x70CC04;
	byte PauseMenu : "ePSXe.exe", 0x70C374;
	byte IsMainMenu : "ePSXe.exe", 0x70D13C;
	byte IsComicCover : "ePSXe.exe", 0x8574DC;
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
	settings.SetToolTip("start_group", "Choose how you want the timer to start. You can choose more than one option. [PS1 version only]");
	
	// Add setting 'startOnNewGame', with 'start_group' as parent
	settings.Add("startOnNewGame", true, "Start when selecting New Game", "start_group");
	settings.SetToolTip("startOnNewGame", "The timer will start as soon as you start a new game. [PS1 version only]");
	
	// Add setting 'startOnTraining', with 'start_group' as parent
	settings.Add("startOnTraining", true, "Start when selecting a training level", "start_group");
	settings.SetToolTip("startOnTraining", "The timer will start as soon as you select either Item Hunt or Zip-Line Training (for 100%). [PS1 version only]");
	
	
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
	settings.SetToolTip("splitOnNewCostume", "The timer will split as soon as a new costume is unlocked. This only includes Amazing Bag Man, Quick-Change Spidey and Peter Parker (for 100%).");
	

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
	vars.shouldUseBaseAddress = false;
	vars.foundMemoryOffset = false;
	vars.firstUpdate = true;

	if (processName.Contains("spideypc")) // Windows PC version
	{
		version = "N/A";
		vars.platform = "WinPC";
	}
	else if (processName.Contains("demul")) // DEMUL
	{
		version = "N/A";
		vars.platform = "DC";
		
		//vars.shouldUseWatchers = true;
		//vars.shouldUseBaseAddress = true;
		//vars.watchers = new MemoryWatcherList{};
		//vars.baseAddress = (IntPtr)0x2C000000;
	}
	else if ((processName.Length > 10) && (processName.Substring(0, 6) == "nullDC")) // NullDC
	{
		version = "";
		vars.platform = "DC";
	}
	else if (processName.Contains("project64")) // Project64
	{
		vars.platform = "N64";
		if (firstModuleMemorySize == 1392640)
			version = "v1.6";
	}
	else if (processName.Contains("psxfin")) // pSX/psxfin
	{
		vars.platform = "PS1";
		if (firstModuleMemorySize == 3313664)
			version = "v1.13";
	}
	else if (processName.Contains("epsxe")) // ePSXe 
	{
		vars.platform = "PS1";
		if (firstModuleMemorySize == 10301440)
			version = "v1.9.0";
	}
	else if (processName.Contains("retroarch")) 
	{
		version = "N/A";
		vars.platform = "PS1";
		vars.shouldUseWatchers = true;
		vars.watchers = new MemoryWatcherList{};
		vars.memorySize = (UIntPtr)0x200000;
  	}
	else if ((processName.Length > 10) && (processName.Substring(0, 11) == "duckstation"))
	{
		version = "N/A";
		vars.platform = "PS1";
		vars.shouldUseWatchers = true;
		vars.watchers = new MemoryWatcherList{};
		vars.memorySize = (UIntPtr)0x200000;
	}
	
	switch ((string)vars.platform)
	{
		case "PS1":
			vars.hasLoads = true;
			vars.hasMenus = true;
			vars.hasComicCovers = true;
			vars.hasSaveMenu = false;
			break;
		case "WinPC":
			vars.hasLoads = false;
			vars.hasMenus = false;
			vars.hasComicCovers = false;
			vars.hasSaveMenu = false;
			break;
		case "DC":
			vars.hasLoads = true;
			vars.hasMenus = false;
			vars.hasComicCovers = true;
			vars.hasSaveMenu = true;
			break;
		case "N64":
			vars.hasLoads = false;
			vars.hasMenus = false;
			vars.hasComicCovers = false;
			vars.hasSaveMenu = false;
			break;
		case "MacPC":
			vars.hasLoads = false;
			vars.hasMenus = false;
			vars.hasComicCovers = false;
			vars.hasSaveMenu = false;
			break;
	}

	vars.isLoading = false;
	vars.splitForNewCostume = false;
	vars.dontStartUntilMainMenu = true;
  	vars.dontSplitUntilPlaying = true;
	vars.currentSubMenuLevel = 0;
	vars.menuSelection = new List<int>();
	for (var i = 0; i <= 10; i++)
	{
		vars.menuSelection.Add(-1);
	}
	// vars.menuSelection[0] == Main Menu Selection 
	// vars.menuSelection[1] == First Sub Menu Selection...and so on
	vars.waitUntilReturnToMainMenu = false; // For Sub-Menus we're not interested in tracking
	
	
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
		
		if (vars.shouldUseBaseAddress)
		{
			memoryOffset = vars.baseAddress;
			vars.foundMemoryOffset = true;
			justFoundMemoryOffset = true;
			print("Set BaseAddress for memory offsets!");
			
			vars.watchers = new MemoryWatcherList
			{
				new MemoryWatcher<int>(memoryOffset + 0x27F604) { Name = "IsLoading" },
				new MemoryWatcher<int>(memoryOffset + 0x1CB7F8) { Name = "DeathMenu" },
				new MemoryWatcher<int>(memoryOffset + 0x350944) { Name = "IsCutscene" },
				new MemoryWatcher<int>(memoryOffset + 0x20F90C) { Name = "UnlockedCostumes" },
				new MemoryWatcher<int>(memoryOffset + 0x202258) { Name = "LevelID" },
				new MemoryWatcher<byte>(memoryOffset + 0x2000D4) { Name = "IsPlaying" },
				new MemoryWatcher<byte>(memoryOffset + 0x200114) { Name = "PauseMenu" },
				new MemoryWatcher<byte>(memoryOffset + 0x20F6B8) { Name = "IsMainMenu" }
			};
		}
		else 
		{
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
					new MemoryWatcher<int>(memoryOffset + 0xB556C) { Name = "IsLoading" },
					new MemoryWatcher<int>(memoryOffset + 0xB4F34) { Name = "DeathMenu" },
					new MemoryWatcher<int>(memoryOffset + 0xB4E84) { Name = "IsCutscene" },
					new MemoryWatcher<int>(memoryOffset + 0xB4EE8) { Name = "IsStartScreen" },
					new MemoryWatcher<int>(memoryOffset + 0xB5540) { Name = "OutsideSubMenus" },
					new MemoryWatcher<int>(memoryOffset + 0xA4E24) { Name = "MenuXPress" },
					new MemoryWatcher<int>(memoryOffset + 0xE254) { Name = "MainMenuItem" },
					new MemoryWatcher<int>(memoryOffset + 0xE214) { Name = "SubMenuItem" },
					new MemoryWatcher<int>(memoryOffset + 0xA4ED4) { Name = "MenuStartPress" },
					new MemoryWatcher<int>(memoryOffset + 0xA4DF4) { Name = "MenuTrianglePress" },
					new MemoryWatcher<int>(memoryOffset + 0xA5708) { Name = "UnlockedCostumes" },
					new MemoryWatcher<int>(memoryOffset + 0xB53C4) { Name = "LevelID" },
					new MemoryWatcher<byte>(memoryOffset + 0xB5264) { Name = "IsPlaying" },
					new MemoryWatcher<byte>(memoryOffset + 0xB49D4) { Name = "PauseMenu" },
					new MemoryWatcher<byte>(memoryOffset + 0xB579C) { Name = "IsMainMenu" },
					new MemoryWatcher<byte>(memoryOffset + 0x1FFB3C) { Name = "IsComicCover" }
				};
				break;
			}
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
			current.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
			current.LevelID = vars.watchers["LevelID"].Current;
			current.PauseMenu = vars.watchers["PauseMenu"].Current;
			
			if (vars.hasLoads)
			{
				current.IsLoading = vars.watchers["IsLoading"].Current;
				if (vars.hasComicCovers)
					current.IsComicCover = vars.watchers["IsComicCover"].Current;
			}
			if (vars.hasMenus)
			{
				current.IsStartScreen = vars.watchers["IsStartScreen"].Current;
				current.OutsideSubMenus = vars.watchers["OutsideSubMenus"].Current;
				current.MenuXPress = vars.watchers["MenuXPress"].Current;
				current.MainMenuItem = vars.watchers["MainMenuItem"].Current;
				current.SubMenuItem = vars.watchers["SubMenuItem"].Current;
				current.MenuStartPress = vars.watchers["MenuStartPress"].Current;
				current.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
			}
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsPlaying = vars.watchers["IsPlaying"].Current;
				old.DeathMenu = vars.watchers["DeathMenu"].Current;
				old.IsCutscene = vars.watchers["IsCutscene"].Current;
				old.IsMainMenu = vars.watchers["IsMainMenu"].Current;
				old.UnlockedCostumes = vars.watchers["UnlockedCostumes"].Current;
				old.LevelID = vars.watchers["LevelID"].Current;
				old.PauseMenu = vars.watchers["PauseMenu"].Current;
				
				if (vars.hasLoads)
				{
					old.IsLoading = vars.watchers["IsLoading"].Current;
					if (vars.hasComicCovers)
						old.IsComicCover = vars.watchers["IsComicCover"].Current;
				}
				if (vars.hasMenus)
				{
					old.IsStartScreen = vars.watchers["IsStartScreen"].Current;
					old.OutsideSubMenus = vars.watchers["OutsideSubMenus"].Current;
					old.MenuXPress = vars.watchers["MenuXPress"].Current;
					old.MainMenuItem = vars.watchers["MainMenuItem"].Current;
					old.SubMenuItem = vars.watchers["SubMenuItem"].Current;
					old.MenuStartPress = vars.watchers["MenuStartPress"].Current;
					old.MenuTrianglePress = vars.watchers["MenuTrianglePress"].Current;
				}
				
				vars.firstUpdate = false;
			}
		}
		
		if (vars.hasMenus && vars.currentSubMenuLevel > 0) 
		{
			var menuXPressed = (old.MenuXPress == 0 || old.MenuXPress == 256) && (current.MenuXPress == 1 || current.MenuXPress == 257);
			var menuStartPressed = (old.MenuStartPress == 0 || old.MenuStartPress == 256) && (current.MenuStartPress == 1 || current.MenuStartPress == 257);
			var menuTrianglePressed = (old.MenuTrianglePress == 0 || old.MenuTrianglePress == 256) && (current.MenuTrianglePress == 1 || current.MenuTrianglePress == 257);

			if (menuXPressed || menuStartPressed) 
			{
				vars.menuSelection[vars.currentSubMenuLevel] = old.SubMenuItem;
				vars.currentSubMenuLevel = vars.currentSubMenuLevel + 1;
			}
			else if (menuTrianglePressed) 
			{
				vars.menuSelection[vars.currentSubMenuLevel - 1] = -1;
				vars.currentSubMenuLevel = vars.currentSubMenuLevel - 1;
			}
		}
		else 
		{
			for (var i = 0; i <= 10; i++)
			{
				vars.menuSelection[i] = -1;
			}
		}
		
		if (vars.hasMenus) 
		{ 	
			if (current.IsMainMenu == 1 && current.IsStartScreen == 0)
			{
				if (current.OutsideSubMenus > 0)
					vars.currentSubMenuLevel = 0;
					
				var enteredSpecialMenu = old.MainMenuItem == 6 && current.MainMenuItem == 1;
				if (!enteredSpecialMenu && current.MainMenuItem < 8 && vars.currentSubMenuLevel == 0 && (!vars.waitUntilReturnToMainMenu || current.OutsideSubMenus > 0)) 
				{
					vars.menuSelection[0] = -1;
					vars.waitUntilReturnToMainMenu = false;
				}
				else if (vars.currentSubMenuLevel == 0 && !vars.waitUntilReturnToMainMenu && (enteredSpecialMenu || (old.MainMenuItem < 8 && current.MainMenuItem >= 8))) 
				{
					vars.menuSelection[0] = old.MainMenuItem;
					if (vars.menuSelection[0] == 1 || vars.menuSelection[0] == 4)
						vars.currentSubMenuLevel = 1;
					else
						vars.waitUntilReturnToMainMenu = true;
				}
			}
		}
		
		vars.dontStartUntilMainMenu = !(current.IsMainMenu == 1 && (current.DeathMenu != 3 || current.LevelID == 695));
		if (vars.dontStartUntilMainMenu)
			vars.currentSubMenuLevel = 0;
		
		if (vars.dontSplitUntilPlaying) 
		{ 
			vars.dontSplitUntilPlaying = !(old.IsPlaying == 0 && current.IsPlaying == 1);
		}
		else if (!vars.dontSplitUntilPlaying)
		{
			if (current.IsPlaying == 0 && ((vars.hasLoads && current.IsLoading == 1) || current.DeathMenu == 2 || old.PauseMenu == 1 || old.PauseMenu == 3 || (old.IsMainMenu == 0 && current.IsMainMenu == 1))) 
			{
				vars.dontSplitUntilPlaying = true;
			}
		}
		
		if (!vars.splitForNewCostume && old.UnlockedCostumes != current.UnlockedCostumes) 
		{
			var newCostume = current.UnlockedCostumes - old.UnlockedCostumes;
			vars.splitForNewCostume = newCostume == 32 || newCostume == 256 || newCostume == 512;
		}
		
		if (vars.hasLoads)
		{
			if (vars.isLoading)
			{
				var isComicCover = vars.hasComicCovers && ((vars.platform == "DC" && current.IsComicCover == 172) || current.IsComicCover == 116);
				if (current.IsLoading == 0 && (current.IsPlaying == 1 || current.IsCutscene == 1 || current.IsMainMenu == 1 || isComicCover || (vars.hasSaveMenu && current.IsSaveMenu == 224)))
					vars.isLoading = false;
			}
			else 
			{
				vars.isLoading = current.IsLoading == 1;
			}
		}
	}

	return version != "" && (!vars.shouldUseWatchers || (vars.foundMemoryOffset && !justFoundMemoryOffset));
}

start 
{
	if (vars.hasMenus)
	{
		if (!vars.dontStartUntilMainMenu)
		{
			if (vars.menuSelection[0] == 1 && vars.menuSelection[1] != -1)
			{
				print("Should start timer due to New Game selection!");
				return settings["startOnNewGame"];
			}
			if (vars.menuSelection[0] == 4 && vars.menuSelection[2] == 4 && (vars.menuSelection[3] == 0 || vars.menuSelection[4] != -1))
			{
				print("Should start timer due to Training selection!");
				return settings["startOnTraining"];
			}
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
	else if (!vars.dontSplitUntilPlaying && current.LevelID != 29 && (current.DeathMenu == 0 || current.DeathMenu == 3) &&
	((vars.platform != "N64" && old.IsCutscene == 0 && current.IsCutscene == 1) || (old.PauseMenu == 0 && old.DeathMenu == 0 && current.DeathMenu == 3)))
	{
		print("Should split due to a level being completed!");
		vars.dontSplitUntilPlaying = true;
		return settings["splitOnAnyLevel"] || (settings["splitOnLastLevelOnly"] && current.LevelID == 695);
	}
	return false;
}

reset 
{
	var isDead = current.DeathMenu == 2 || current.DeathMenu == 9;
	return settings["resetOnQuit"] && ((old.PauseMenu == 3 && current.PauseMenu == 0) || (isDead && old.IsMainMenu == 0 && current.IsMainMenu == 1) || (vars.platform == "N64" && old.PauseMenu == 1 && current.IsPlaying == 0));
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
