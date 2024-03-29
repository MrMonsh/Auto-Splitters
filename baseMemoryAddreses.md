# Base Memory Addresses Documentation

These addresses belong to either old emulator versions or to emulators that no longer see active development, meaning they should be static and always be the same regardless of the environment.

## Table of Contents
<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->
- [PS1 Emulators](#pS1-Emulators)
  - [pSX/psxFin](#pSXpsxFin)
  - [mednafen](#mednafen)
  - [BizHawk](#bizHawk)
  - [ePSXe](#ePSXe)
- [DC Emulators](#dC-Emulators)
  - [DEMUL](#dEMUL) 
- [N64 Emulators](#n64-Emulators)
  - [Project64](#project64)
<!-- /TOC -->

## PS1 Emulators

### pSX/psxFin
+ __Process Name:__ "psxfin"

+ v1.13
  + Memory Start: 0390D020
  + Memory End: 03B0D020

### mednafen
+ __Process Name:__ "mednafen"

+ v1.26.1 win64
  + Memory Start:  "mednafen.exe" + 0x2553280
  + Memory End:  "mednafen.exe" + 0x2753280
 
+ v1.26.1 win32
  + Memory Start:  "mednafen.exe" + 0x1C94560
  + Memory End:  "mednafen.exe" + 0x1E94560
 
### BizHawk
+ __Process Name:__ "EmuHawk"

+ v2.4.2
  + Memory Start: "octoshock.dll" + 0x30DF90
  + Memory End: "octoshock.dll" + 0x50DF90
 
+ v2.5.2, v2.6.1
  + Memory Start: "octoshock.dll" + 0x310F80
  + Memory End: "octoshock.dll" + 0x510F80


### ePSXe
+ __Process Name:__ "ePSXe"

+ v1.7.0
  + Memory Start: "ePSXe.exe" + 0x54C020
  + Memory End: "ePSXe.exe" + 0x74C020

+ v1.9.0
  + Memory Start: "ePSXe.exe" + 0x6579A0
  + Memory End: "ePSXe.exe" + 0x8579A0

+ v1.9.25
  + Memory Start: "ePSXe.exe" + 0x68B6A0
  + Memory End: "ePSXe.exe" + 0x88B6A0

+ v2.0.0
  + Memory Start: "ePSXe.exe" + 0x81A020
  + Memory End: "ePSXe.exe" + 0xA1A020
 
+ v2.0.5
  + Memory Start: "ePSXe.exe" + 0xA82020
  + Memory End: "ePSXe.exe" + 0xC82020

## DC Emulators

### DEMUL
+ __Process Name:__ "demul"

+ v0.5.5, v0.5.6, v0.5.7, v0.7
  + Memory Start: 2C000000
  + Memory End: 2D000000

## N64 Emulators

### Project64
+ __Process Name:__ "project64"

+ v1.6
  + Memory Start: "Project64.exe" + 0xD6A1C
  + Memory End: "Project64.exe" + 0x??????
