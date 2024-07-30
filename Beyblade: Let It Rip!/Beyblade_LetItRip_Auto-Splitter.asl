// BEYBLADE: LET IT RIP! AUTO-SPLITTER AND LOAD REMOVER v0.3.1 - by MrMonsh

state("ePSXe", "v1.9.0")
{
	byte outOfLoading : "ePSXe.exe", 0x6A46C8;
	byte playerPoints : "ePSXe.exe", 0x714C3D;
	short playerBroken : "ePSXe.exe", 0x845D65;
	byte opponentPoints : "ePSXe.exe", 0x714C95;
	short opponentBroken : "ePSXe.exe", 0x6CC3B4;
}

state("ePSXe", "v1.7.0")
{
	byte outOfLoading : "ePSXe.exe", 0x59B230;
	byte playerPoints : "ePSXe.exe", 0x6092BD;
	short playerBroken : "ePSXe.exe", 0x73A3E5;
	byte opponentPoints : "ePSXe.exe", 0x609315;
	short opponentBroken : "ePSXe.exe", 0x5C0A34;
}

startup
{
	// Add setting group 'reset_group'
	settings.Add("reset_group", true, "Resetting");
	settings.SetToolTip("reset_group", "Choose how you want the timer to reset. You can choose more than one option.");

	// Add setting 'resetOnGameClosed', with 'reset_group' as parent
	settings.Add("resetOnGameClosed", true, "Reset when closing the emulator", "reset_group");
	settings.SetToolTip("resetOnGameClosed", "The timer will reset as soon as the emulator is closed.");

	// Add setting 'resetOnMatchLoss', with 'reset_group' as parent
	settings.Add("resetOnMatchLoss", true, "Reset on Match Loss", "reset_group");
	settings.SetToolTip("resetOnMatchLoss", "The timer will reset as soon as you lose a match (either by points or by running out of usable beyblades).");

	vars.timerModel = new TimerModel { CurrentState = timer };
}

init 
{
	var firstModuleMemorySize = modules.First().ModuleMemorySize;
	var processName = memory.ProcessName.ToLower();
	
	if (processName.Contains("epsxe")) // ePSXe 
	{
		if (firstModuleMemorySize == 9138176)
			version = "v1.7.0";
		if (firstModuleMemorySize == 10301440)
			version = "v1.9.0";
	}
	
	print("Current ModuleMemorySize is: " + firstModuleMemorySize.ToString());
	print("CurrentProcess is: " + processName);
	print("CurrentVersion is: " + version);
}

update 
{
	if (version == "") return false;
}

split
{
	return old.playerPoints < 4 && (current.playerPoints >= 4 || (old.opponentBroken == 0 && current.opponentBroken == 1));
}

reset 
{
	return settings["resetOnMatchLoss"] && old.opponentPoints < 4 && (current.opponentPoints >= 4 || (old.playerBroken == 0 && current.playerBroken == 1));
}

isLoading 
{
	return current.outOfLoading == 0;
}

exit 
{
	print("Emulator Closed");
	if (settings["resetOnGameClosed"])
		vars.timerModel.Reset();
}
