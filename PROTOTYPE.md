## Development Stages

1. Create classes
* Character clas
* ~~Weapon~~  Gun (includes shot() and reload()) ~~and Sword (includes swing())~~
* Bullet class (should spawn a moving sprite towards their target, with a stored damage variable and/or a time limit variable)
* Room class (LoadingRoom, Combat, Shop, Restore, ~~Encounter~~, Final Boss)

2. Functions for character classes
* Movement commands (Player moves off keyPressed system, enemies move based off player coordinates)
* Combat commands (use weapon command at specific target location, take damage, and deal damage)

3. Create room generation
* include enemies if combat rooms
* include singular NPC if ~~encounter room~~ shop or restore room

4. Create HP and coin counter

5. Create a "door mechanism" that will take the player to the next room

6. Implement NPC and dialogue

## UML

Character\
<img src="umlImages/char1.png"  width="50%" height="50%">
<img src="umlImages/char2.png"  width="50%" height="50%">

Gun\
<img src="umlImages/gun.png"  width="50%" height="50%">

Bullet\
<img src="umlImages/bullet.png"  width="50%" height="50%">

Room\
<img src="umlImages/room1.png"  width="50%" height="50%">
<img src="umlImages/room2.png"  width="50%" height="50%">
