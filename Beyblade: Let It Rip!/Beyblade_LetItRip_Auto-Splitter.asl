state("ePSXe", "v1.9.0"){
	// The address you're looking for is 00AA46C8
	//byte outOfLoading1 : 0x5BDE68, 0x128;
	//byte outOfLoading2 : 0x5BC634, 0x138;
	//byte outOfLoading3 : 0x5BAF74, 0x1B8;
	//byte outOfLoading4 : 0x5BC360, 0x1C8;
	
	byte outOfLoading1 : 0x5BDE98, 0x128;
	byte outOfLoading2 : 0x5BC664, 0x138;
	byte outOfLoading3 : 0x5BAFA4, 0x1B8;
	byte outOfLoading4 : 0x5BC390, 0x1C8;
}

state("ePSXe", "v1.7.0"){
	// The address you're looking for is 0099B230
	byte outOfLoading1 : 0x3413C, 0x748;
	byte outOfLoading2 : 0x3413C, 0x748;
	byte outOfLoading3 : 0x3413C, 0x748;
	byte outOfLoading4 : 0x3413C, 0x748;
}

init {
	if (modules.First().ModuleMemorySize == 9138176)
		version = "v1.7.0";
	if (modules.First().ModuleMemorySize == 10301440)
		version = "v1.9.0";
}

update {
	if (version == "") return false;
}


isLoading {
	if (current.outOfLoading1 == 0)
		return true;
	if (current.outOfLoading2 == 0)
		return true;
	if (current.outOfLoading3 == 0)
		return true;
	if (current.outOfLoading4 == 0)
		return true;
	
	return false;
}
