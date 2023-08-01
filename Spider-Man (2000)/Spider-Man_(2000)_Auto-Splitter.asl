// SPIDER-MAN (2000) AUTO-SPLITTER AND LOAD REMOVER v0.1 - by MrMonsh

state("psxfin", "v1.13")
{
	int IsLoading: "psxfin.exe", 0x171A5C, 0xB556C;
	int InCutscene : "psxfin.exe", 0x171A5C, 0xB4E84;
  	int InMainMenu : "psxfin.exe", 0x171A5C, 0xB579C;
	byte LevelEnd : "psxfin.exe", 0x171A5C, 0x1FFF9F;
}

state("ePSXe", "v1.9.0")
{
  	int IsLoading: "ePSXe.exe", 0x70CF0C;
	int InCutscene : "ePSXe.exe", 0x70C824;
  	int InMainMenu : "ePSXe.exe", 0x70D13C;
	byte LevelEnd : "ePSXe.exe", 0x85793F;
}

// RetroArch is a special case, I'll be manually reading its memory
state("retroarch", "N/A"){}

// DuckStation is another special case, I'll be manually reading its memory
state("duckstation-qt-x64-ReleaseLTCG", "N/A") {}
state("duckstation-nogui-x64-ReleaseLTCG", "N/A") {}

startup
{
	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");

	// Add setting 'resetOnMainMenu', with 'reset_group' as parent
	settings.Add("resetOnMainMenu", true, "Reset on Main Menu", "reset_group");
	settings.SetToolTip("resetOnMainMenu", "The timer will reset as soon as you return to the Main Menu.");

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

  	vars.dontSplitUntilLoads = false;
	
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
        		new MemoryWatcher<int>(memoryOffset + 0xB4E84) { Name = "InCutscene" },
        		new MemoryWatcher<int>(memoryOffset + 0xB579C) { Name = "InMainMenu" },
				new MemoryWatcher<byte>(memoryOffset + 0x1FFF9F) { Name = "LevelEnd" }
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
			current.InCutscene = vars.watchers["InCutscene"].Current;
			current.InMainMenu = vars.watchers["InMainMenu"].Current;
			current.LevelEnd = vars.watchers["LevelEnd"].Current;
			
			// I need to load the "old" with watcher vars the first time, otherwise I would fail checking old != current 'cos it won't have 'em
			if (vars.firstUpdate)
			{
				old.IsLoading = vars.watchers["IsLoading"].Current;
				old.InCutscene = vars.watchers["InCutscene"].Current;
				old.InMainMenu = vars.watchers["InMainMenu"].Current;
				old.LevelEnd = vars.watchers["LevelEnd"].Current;
				vars.firstUpdate = false;
			}
		}

		if (vars.dontSplitUntilLoads && (current.IsLoading == 1 || current.InMainMenu == 1)) 
		{
			vars.dontSplitUntilLoads = false;
		}
	}

	return version != "" && (!vars.shouldUseWatchers || (vars.foundMemoryOffset && !justFoundMemoryOffset));
}

start 
{
	return old.InMainMenu == 1 && current.InMainMenu == 0;
}

split
{
	if (vars.dontSplitUntilLoads == false && ((old.InCutscene == 0 && current.InCutscene == 1) || (old.LevelEnd == 0 && current.LevelEnd == 128)))
	{
		vars.dontSplitUntilLoads = true;
		return true;
	}
	return false;
}

reset 
{
	return settings["resetOnMainMenu"] && current.InMainMenu == 1;
}

isLoading 
{
	return current.IsLoading == 1;
}

exit 
{
	print("Emulator Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
