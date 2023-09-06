# Spider-Man 2: Enter Electro Auto-Splitter & Load Remover v0.5 - by MrMonsh

## Variables

We track the following 1 variables: 
<!-- TOC depth:6 withLinks:1 updateOnSave:1 orderedList:0 -->
- [UnlockedCostumes](#unlockedCostumes)
<!-- /TOC -->

## UnlockedCostumes
**Offset:** 0xB31F8

This address tells us what costumes are currently unlocked. This is actually a Binary Bit flag consisting of 10 consecutive bits.

### UnlockedCostumes Values
+ 0: Literally 0 costumes unlocked, including default (never happens unless hax)
  + When you go to Costume Selection, all costumes will be locked, but the game will still allow you to continue using whichever costume you're currently wearing to avoid breaking itself.
  + Since the game isn't prepared for this scenario, once you do this the default costume will never be able to be unlocked again on this save (unless you hack the value again).
+ 1: Default Costume
+ 2: Spider-Phoenix
+ 4: Prodigy
+ 8: Dusk
+ 16: Insulated Suit
+ 32: Alex Ross - Red
+ 64: Alex Ross - White
+ 128: Venom 2 - Earth X
+ 256: Negative Zone
+ 512: Spider-Man 2099
+ 1024: Symbiote Spider-Man
+ 2048: Captain Universe
+ 4096: Spidey Unlimited
+ 8192: Amazing Bag Man
+ 16384: Scarlet Spidey
+ 32768: Ben Reilly
+ 65536: Quick-Change Spidey
+ 131072: Peter Parker
+ 262144: Battle Damaged
+ Any other values work as additions of the aforementioned. Examples:
  + Value 3 would be (2 + 1) = (Spider-Phoenix + Default)
  + Value 545 would be (512 + 16 + 1) = (Spidey 2099 + Insulated Suit + Default)
