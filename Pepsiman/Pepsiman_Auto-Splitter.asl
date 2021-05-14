// PEPSIMAN AUTO-SPLITTER AND LOAD REMOVER v1.1.0 - by MrMonsh
// Notes: We track six variables here: GameState, LostControlOfPepsiman, ScoreBoardIsPresent, EndOfThirdLevel, CurrentHoveredMainMenuItem and MenuItemIsSelected
// GameState tells us what the game is currently playing, whether it's a level, a cutscene, a level loading, pepsiman's death or the main menu.
// GameState Values:
// + 7: Game Over/End of Credits (used for auto-resets)
// + 8: Main Menu (used for auto-start)
// + 14: Currently playing a level
// + 40: 3D cutscene for first level of the each act
// + 41: Loading the first level of the each act (used to detect loading for Load Remover)
// + 42: Loading the second level of the each act (used to detect loading for Load Remover and to auto-split first level)
// + 43: Loading the third level of the each act (used to detect loading for Load Remover and to auto-split second level)
// + 44: A fat man cutscene

// LostControlOfPepsiman tells us exactly when we lose control of Pepsiman, whether it's during the end of a level or during the initial cutscene of a level
// 0 means we're currently in control of Pepsiman, 1 means we're not in control.

// ScoreBoardIsPresent tells us exactly when the Score Board at the end of each level is present on the screen
// 0 means it's not present, 1 means it's present.

// EndOfThirdLevel tells us exactly when we stop controlling Pepsiman at the end of the third level of each act, given that GameState doesn't pick up on this
// EndOfThirdLevel Values:
// + 24480: Lost control of Pepsiman (due to reaching the end of the level)
// + 67817236: Currently playing the level, paused or at the main menu
// + 151703316: Currently playing level 1-2
// + 3774875200: Fade out at the end of level cutscene

// CurrentHoveredMainMenuItem tells us which is the current MAIN menu item we're stepped on, from the list of available items of our main menu.
// The amount of items may vary depending whether you have played the game before or not, given the Free Play and Continue options are unlocked in this fashion. 
// Values: 0 is the top item, 1 is the one right under it, and so on.
// As such, "Game Start" is always value 0, since it's always at the top of the main menu, and this is the one we're concerned with.
// If you enter a sub-menu (such as Options or Free Play), this value doesn't change, regardless of what you do inside it.

// MenuItemIsSelected tells us if the current menu item was selected (ie. player pressed circle to select it).
// MenuItemIsSelected Values:
// + 64: Passive State
// + 20: Menu Item Selected


state("psxfin", "v1.13")
{
	int GameState : "psxfin.exe", 0x171A5C, 0x95880;
	uint EndOfThirdLevel : "psxfin.exe", 0x171A5C, 0xACF1C;
	byte LostControlOfPepsiman : "psxfin.exe", 0x171A5C, 0x4023C;
	byte ScoreBoardIsPresent : "psxfin.exe", 0x171A5C, 0x95A80;
	byte CurrentHoveredMainMenuItem : "psxfin.exe", 0x171A5C, 0xFA274;
	byte MenuItemIsSelected : "psxfin.exe", 0x171A5C, 0xE05BE;
}

state("XEBRA", "20200405")
{
	int GameState : "xebra.exe", 0xA71F8, 0x95880;
	uint EndOfThirdLevel : "xebra.exe", 0xA71F8, 0xACF1C;
	byte LostControlOfPepsiman : "xebra.exe", 0xA71F8, 0x4023C;
	byte ScoreBoardIsPresent : "xebra.exe", 0xA71F8, 0x95A80;
	byte CurrentHoveredMainMenuItem : "xebra.exe", 0xA71F8, 0xFA274;
	byte MenuItemIsSelected : "xebra.exe", 0xA71F8, 0xE05BE;
}

state("ePSXe", "v1.9.0")
{
	int GameState : "ePSXe.exe", 0x6ED220; // Address you're looking for: 00AED220
	uint EndOfThirdLevel : "ePSXe.exe", 0x7048BC; // Address you're looking for: 00B048BC
	byte LostControlOfPepsiman : "ePSXe.exe", 0x6ACFE4; // Address you're looking for: 00AACFE4
	byte ScoreBoardIsPresent : "ePSXe.exe", 0x6ED420; // Address you're looking for: 00AED420
	byte CurrentHoveredMainMenuItem : "ePSXe.exe", 0x751C14; // Address you're looking for: 00B51C14
	byte MenuItemIsSelected : "ePSXe.exe", 0x737F5E; // Address you're looking for: 00B37F5E
}

state("ePSXe", "v2.0.5")
{
	int GameState : "ePSXe.exe", 0xB178A0; // Address you're looking for: 01AB78A0
	uint EndOfThirdLevel : "ePSXe.exe", 0xB2EF3C; // Address you're looking for: 01ACEF3C 
	byte LostControlOfPepsiman : "ePSXe.exe", 0xAD7664; // Address you're looking for: 01A77664
	byte ScoreBoardIsPresent : "ePSXe.exe", 0xB17AA0; // Address you're looking for: 01AB7AA0
	byte CurrentHoveredMainMenuItem : "ePSXe.exe", 0xB7C294; // Address you're looking for: 01B1C294
	byte MenuItemIsSelected : "ePSXe.exe", 0xB625DE; // Address you're looking for: 01B025DE
}

state("ePSXe", "v2.0.0")
{
	int GameState : "ePSXe.exe", 0x8AF8A0; // Address you're looking for: 0096F8A0
	uint EndOfThirdLevel : "ePSXe.exe", 0x8C6F3C; // Address you're looking for: 00986F3C
	byte LostControlOfPepsiman : "ePSXe.exe", 0x86F664; // Address you're looking for: 0092F664
	byte ScoreBoardIsPresent : "ePSXe.exe", 0x8AFAA0; // Address you're looking for: 0096FAA0
	byte CurrentHoveredMainMenuItem : "ePSXe.exe", 0x914294; // Address you're looking for: 009D4294
	byte MenuItemIsSelected : "ePSXe.exe", 0x8FA5DE; // Address you're looking for: 009BA5DE
}

state("ePSXe", "v1.9.25")
{
	int GameState : "ePSXe.exe", 0x720F20; // Address you're looking for: 00B20F20
	uint EndOfThirdLevel : "ePSXe.exe", 0x7385BC; // Address you're looking for: 00B385BC 
	byte LostControlOfPepsiman : "ePSXe.exe", 0x6E0CE4; // Address you're looking for: 00AE0CE4
	byte ScoreBoardIsPresent : "ePSXe.exe", 0x721120; // Address you're looking for: 00B21120
	byte CurrentHoveredMainMenuItem : "ePSXe.exe", 0x785914; // Address you're looking for: 00B85914
	byte MenuItemIsSelected : "ePSXe.exe", 0x76BC5E; // Address you're looking for: 00B6BC5E
}

state("ePSXe", "v1.7.0")
{
	int GameState : "ePSXe.exe", 0x004A8F58, 0xC20; // Address you're looking for: 009E18A0
	uint EndOfThirdLevel : "ePSXe.exe", 0x5F8F3C; // Address you're looking for: 009F8F3C
	byte LostControlOfPepsiman : "ePSXe.exe", 0x5A1664;// Address you're looking for: 009A1664
	byte ScoreBoardIsPresent : "ePSXe.exe", 0x5E1AA0; // Address you're looking for: 009E1AA0
	byte CurrentHoveredMainMenuItem : "ePSXe.exe", 0x646294; // Address you're looking for: 00A46294
	byte MenuItemIsSelected : "ePSXe.exe", 0x62C5DE; // Address you're looking for: 00A2C5DE
}

state("mednafen", "v1.26.1 win64")
{
	int GameState : "mednafen.exe", 0x25E8B00;
	uint EndOfThirdLevel : "mednafen.exe", 0x260019C;
	byte LostControlOfPepsiman : "mednafen.exe", 0x25A88C4;
	byte ScoreBoardIsPresent : "mednafen.exe", 0x25E8D00;
	byte CurrentHoveredMainMenuItem : "mednafen.exe", 0x264D4F4;
	byte MenuItemIsSelected : "mednafen.exe", 0x263383E;
}

state("mednafen", "v1.26.1 win32")
{
	int GameState : "mednafen.exe", 0x1D29DE0;
	uint EndOfThirdLevel : "mednafen.exe", 0x1D4147C;
	byte LostControlOfPepsiman : "mednafen.exe", 0x1CE9BA4;
	byte ScoreBoardIsPresent : "mednafen.exe", 0x1D29FE0;
	byte CurrentHoveredMainMenuItem : "mednafen.exe", 0x1D8E7D4;
	byte MenuItemIsSelected : "mednafen.exe", 0x1D74B1E;
}

state("EmuHawk", "v2.6.1")
{
	int GameState : "octoshock.dll", 0x3A6800;
	uint EndOfThirdLevel : "octoshock.dll", 0x3BDE9C;
	byte LostControlOfPepsiman : "octoshock.dll", 0x3665C4;
	byte ScoreBoardIsPresent : "octoshock.dll", 0x3A6A00;
	byte CurrentHoveredMainMenuItem : "octoshock.dll", 0x40B1F4;
	byte MenuItemIsSelected : "octoshock.dll", 0x3F153E;
}

state("EmuHawk", "v2.5.2")
{
	int GameState : "octoshock.dll", 0x3A6800;
	uint EndOfThirdLevel : "octoshock.dll", 0x3BDE9C;
	byte LostControlOfPepsiman : "octoshock.dll", 0x3665C4;
	byte ScoreBoardIsPresent : "octoshock.dll", 0x3A6A00;
	byte CurrentHoveredMainMenuItem : "octoshock.dll", 0x40B1F4;
	byte MenuItemIsSelected : "octoshock.dll", 0x3F153E;
}

state("EmuHawk", "v2.4.2")
{
	int GameState : "octoshock.dll", 0x3A3810;
	uint EndOfThirdLevel : "octoshock.dll", 0x3BAEAC;
	byte LostControlOfPepsiman : "octoshock.dll", 0x3635D4;
	byte ScoreBoardIsPresent : "octoshock.dll", 0x3A3A10;
	byte CurrentHoveredMainMenuItem : "octoshock.dll", 0x408204;
	byte MenuItemIsSelected : "octoshock.dll", 0x3EE54E;
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

	// Add setting 'startOnGameStart', with 'start_group' as parent
	settings.Add("startOnGameStart", true, "Start on Game Start", "start_group");
	settings.SetToolTip("startOnGameStart", "The timer will start as soon as you select 'Game Start' on the Main Menu.");
	
	// Add setting 'startOnControlGain', with 'start_group' as parent
	settings.Add("startOnControlGain", false, "Start on control gain", "start_group");
	settings.SetToolTip("startOnControlGain", "The timer will start as soon as Pepsiman starts moving, outside of cutscenes and loading screens.");


	// Add setting group 'split_group_levels12'
	settings.Add("split_group_levels12", true, "Splitting for Levels 1 & 2");
	settings.SetToolTip("split_group_levels12", "Choose how you want to split for levels 1 and 2 of each act. Level 3 of each act will always split when you lose control of Pepsiman by default. Choose only one.");

	// Add setting 'splitOnScoreBoardEnd', with 'split_group_levels12' as parent
	settings.Add("splitOnScoreBoardEnd", true, "Split at end of ScoreBoard", "split_group_levels12");
	settings.SetToolTip("splitOnScoreBoardEnd", "The timer will split as soon as the ScoreBoard disappears at the end of the level.");

	// Add setting 'splitOnControlLoss', with 'split_group_levels12' as parent
	settings.Add("splitOnControlLoss", false, "Split at loss of control of Pepsiman", "split_group_levels12");
	settings.SetToolTip("splitOnControlLoss", "The timer will split as soon as you lose control of Pepsiman at the end of the level.");

	
	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");

	// Add setting 'resetOnGameOver', with 'reset_group' as parent
	settings.Add("resetOnGameOver", true, "Reset on Game Over", "reset_group");
	settings.SetToolTip("resetOnGameOver", "The timer will reset as soon as you get a 'Game Over'.");

	vars.timerModel = new TimerModel { CurrentState = timer };
}


init 
{
	var firstModuleMemorySize = modules.First().ModuleMemorySize;
	var processName = memory.ProcessName.ToLower();
	vars.shouldUseWatchers = false;
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
	else if (processName.Contains("mednafen")) // mednafen
	{
		if (firstModuleMemorySize == 70021120)
			version = "v1.26.1 win32";
		else if (firstModuleMemorySize == 99102720)
			version = "v1.26.1 win64";
	}
	else if (processName.Contains("emuhawk")) // BizHawk
	{
		if (firstModuleMemorySize == 5054464)
			version = "v2.4.2";
		else if (firstModuleMemorySize == 4759552)
			version = "v2.5.2";
		else if (firstModuleMemorySize == 4546560)
			version = "v2.6.1";
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
		IntPtr memoryOffset = IntPtr.Zero;
		int wramOffset;
	
        // Supported libretro modules are Beetle_PSX, Beetle_PSX_HW, PCSX_Rearmed and Duckstation
        // Support for Duckstation is spotty and largely untested. Might break anytime.
        ProcessModuleWow64Safe libretromodule = modules.Where(m => m.ModuleName == "mednafen_psx_hw_libretro.dll" || m.ModuleName == "mednafen_psx_libretro.dll" || m.ModuleName == "pcsx_rearmed_libretro.dll" || m.ModuleName == "duckstation_libretro.dll").First();
        if (libretromodule.ModuleName == "mednafen_psx_hw_libretro.dll") 
		{
            memoryOffset = (IntPtr)0x40000000;    // Beetle PSX always uses the same memory address for the start of emulated RAM regardless of the version of the core
        } 
		else if (libretromodule.ModuleName == "mednafen_psx_libretro.dll") 
		{
            memoryOffset = (IntPtr)0x40000000;    // Beetle PSX always uses the same memory address for the start of emulated RAM regardless of the version of the core
        } 
		else if (libretromodule.ModuleName == "pcsx_rearmed_libretro.dll") 
		{
            memoryOffset = (IntPtr)0x30000000;    // PCSX_ReARMed always uses the same memory address for the start of emulated RAM, even though it's different from the one used by Beetle PSX
        } 
		else if (libretromodule.ModuleName == "duckstation_libretro.dll") 
		{
            var versions = new Dictionary<int, int>{
                { 0x4B0A000, 0x2D4030 },   // Duckstation 64bit
                { 0x55B000, 0x22CF88 },    // Duckstation 32bit
            };
	    // Duckstation uses a static address relative to the start od duckstation memory module as the start of emulated RAM.
	    // The address might change if the libretro core is updated, which is why the
	    // script will need to be updated in case a new version of Duckstation gets released.
            if (versions.TryGetValue(libretromodule.ModuleMemorySize, out wramOffset)) 
			{
                memoryOffset = (IntPtr)libretromodule.BaseAddress + wramOffset;
            }
        }
		
		// MemoryWatcher used to get the memory addresses of interest
		vars.watchers = new MemoryWatcherList
		{
			new MemoryWatcher<int>(memoryOffset + 0x95880) { Name = "GameState" },
			new MemoryWatcher<uint>(memoryOffset + 0xACF1C) { Name = "EndOfThirdLevel" },
			new MemoryWatcher<byte>(memoryOffset + 0x4023C) { Name = "LostControlOfPepsiman" },
			new MemoryWatcher<byte>(memoryOffset + 0x95A80) { Name = "ScoreBoardIsPresent" },
			new MemoryWatcher<byte>(memoryOffset + 0xFA274) { Name = "CurrentHoveredMainMenuItem" },
			new MemoryWatcher<byte>(memoryOffset + 0xE05BE) { Name = "MenuItemIsSelected" }
		};
    }
	else if ((processName.Length > 10) && (processName.Substring(0, 11) == "duckstation"))
	{
		version = "N/A";
		vars.shouldUseWatchers = true;
		IntPtr memoryOffset = IntPtr.Zero;
		
		foreach (var page in game.MemoryPages(true)) {
			if ((page.RegionSize != (UIntPtr)0x200000) || (page.Type != MemPageType.MEM_MAPPED))
				continue;
			memoryOffset = page.BaseAddress;
			break;
		}
		
		// MemoryWatcher used to get the memory addresses of interest
		vars.watchers = new MemoryWatcherList
		{
			new MemoryWatcher<int>(memoryOffset + 0x95880) { Name = "GameState" },
			new MemoryWatcher<uint>(memoryOffset + 0xACF1C) { Name = "EndOfThirdLevel" },
			new MemoryWatcher<byte>(memoryOffset + 0x4023C) { Name = "LostControlOfPepsiman" },
			new MemoryWatcher<byte>(memoryOffset + 0x95A80) { Name = "ScoreBoardIsPresent" },
			new MemoryWatcher<byte>(memoryOffset + 0xFA274) { Name = "CurrentHoveredMainMenuItem" },
			new MemoryWatcher<byte>(memoryOffset + 0xE05BE) { Name = "MenuItemIsSelected" }
		};
	}
	
	vars.CurrentLevel = 0;
	
	print("Current ModuleMemorySize is: " + firstModuleMemorySize.ToString());
	print("CurrentProcess is: " + processName);
	print("CurrentVersion is: " + version);
	print("Using Watchers?: " + vars.shouldUseWatchers);
}

update 
{
	if (vars.shouldUseWatchers)
	{
		vars.watchers.UpdateAll(game);
		current.GameState = vars.watchers["GameState"].Current;
        current.EndOfThirdLevel = vars.watchers["EndOfThirdLevel"].Current;
        current.LostControlOfPepsiman = vars.watchers["LostControlOfPepsiman"].Current;
        current.ScoreBoardIsPresent = vars.watchers["ScoreBoardIsPresent"].Current;
		current.CurrentHoveredMainMenuItem = vars.watchers["CurrentHoveredMainMenuItem"].Current;
		current.MenuItemIsSelected = vars.watchers["MenuItemIsSelected"].Current;
		
		// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
		if (vars.firstUpdate)
		{
			old.GameState = vars.watchers["GameState"].Current;
			old.EndOfThirdLevel = vars.watchers["EndOfThirdLevel"].Current;
			old.LostControlOfPepsiman = vars.watchers["LostControlOfPepsiman"].Current;
			old.ScoreBoardIsPresent = vars.watchers["ScoreBoardIsPresent"].Current;
			old.CurrentHoveredMainMenuItem = vars.watchers["CurrentHoveredMainMenuItem"].Current;
			old.MenuItemIsSelected = vars.watchers["MenuItemIsSelected"].Current;
			vars.firstUpdate = false;
		}
	}

	if (old.GameState != current.GameState)
	{
		int parsedGameStateLevel = current.GameState - 40;
		if (parsedGameStateLevel >= 0 && parsedGameStateLevel <= 3)
			vars.CurrentLevel = parsedGameStateLevel;
		else if (current.GameState == 8)
			vars.CurrentLevel = 0;
	}

	return version != "";
}

start 
{
	if (settings["startOnGameStart"])
		return current.GameState == 8 && current.CurrentHoveredMainMenuItem == 0 && old.MenuItemIsSelected == 64 && current.MenuItemIsSelected == 20;
	else if (settings["startOnControlGain"])
		return current.GameState == 14;
}

split
{
	if (vars.CurrentLevel == 1 || vars.CurrentLevel == 2)
	{
		if (settings["splitOnScoreBoardEnd"])
			return old.ScoreBoardIsPresent == 1 && current.ScoreBoardIsPresent == 0;
		else if (settings["splitOnControlLoss"])
			return old.LostControlOfPepsiman == 0 && old.GameState == 14 && current.LostControlOfPepsiman == 1;
	}
	else if (vars.CurrentLevel == 3) 
		return old.EndOfThirdLevel == 67817236 && current.EndOfThirdLevel == 24480;
}

reset 
{
	return settings["resetOnGameOver"] && current.GameState == 7;
}

isLoading 
{
	return current.GameState == 41 || current.GameState == 42 || current.GameState == 43;
}

exit 
{
	print("Emulator Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
