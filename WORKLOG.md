# Work Log

## GROUP MEMBER 1 (Jason Xie)

### 5/22/23

CLASSWORK: Created Player branch in which Character class and Player class are located. Created constructors for Character superclass and Player subclass, but still need to create Enemy subclass.

HOMEWORK: Added classes for enemy and NPC characters. Also tweaked character parent class to include more functions and fixed constructor.

### 5/23/23

CLASSWORK: Add code that allows characters to be displayed onto the screen (to test moving)

HOMEWORK: Attempt to add movement functions (able to add UP/DOWN/LEFT/RIGHT movement, but troubled by diagonal movement)

### 5/24/23

CLASSWORK: Change movement functions to be smoother through the use of booleans for each important key (thanks Mr. K). Rest of class time spent figuring out how to git merge.

HOMEWORK: Add shooting methods by having a method in Weapon spawn a bullet and a method in Bullet for moving. mousePressed() and mouseReleased() spawn the bullets and draw() moves them. Also limited the movement conditionals in draw() so that both player and bullet do not move offscreen. Also have a limiter in the Bullet class, though that limiter is unimportant.

### 5/25/23

CLASSWORK: Attempted to incorporate inBounds method. gave the Room a color (to later be used to differientiate different types of rooms). Rest of class period spent trying to merge.

HOMEWORK: Add an enemy to testing room. Purpose is to create and test a function that will check if a bullet overlaps with enemy or not. Next steps is to incorporate it into combatRoom and add friendly/enemy bullet indicator. Also added some small functions to room and player for quality of life (display room name, make enemy red, make hitbox variable). Ended up completely altering inBounds method.

### 5/26/23 + weekend

CLASSWORK: Made a shoot countdown timer that would allow the player to hold down or tap the button to fire. Casey also made a timer, but we ended up using mine :) All my work was pushed onto the brank KCs-work.

HOMEWORK: Added onto combatRoom so that combatRoom spawns a specified amount of enemies. combatRoom will display itself, its enemies, and an endscreen / door to the next room. It will also calculate enemy movement and bullet collision. ADDITIONALLY, players now have a reloading and bullet count mechanic, and will have their HP displayed. No penalties for hitting 0 HP (yet). Gun constructor now also has access to bullet speed and combatRoom color tweaked to be lighter for better text readability. Work was pushed onto the branch Game.

### 5/30/23

CLASSWORK: Excused Absence

HOMEWORK: Cost variable was added to enemy which caused them to no longer have -1 bullets and be able to reload. Had to fix this because I originally did not intend for enemies to reload their ammo and therefore the reloading is connected to the shooting cooldown of the player and not whoever spawns the bullet (enemies may be able to reload if shooting cooldown is made a characters variable?)

### 5/31/23

CLASSWORK: Added doorway system in which players are directed to walk into a green door to progress through different rooms (currently only combat rooms)

HOMEWORK: Expand doorway system to include shop rooms (they alternate).

### 6/1/23

CLASSWORK: Regents Exam

HOMEWORK: Allow player to reload at any given time, provided that they press R. Add some cheat buttons that allow the player to skip combat rooms and manipulate their hp/gold. Tweaked the stats of the guns and tied shootCooldown into the guns (though they are not yet part of the gun class). Added a purchasing system, in which players will need to kill enemies to get coins, and can choose to use the coins to swap their guns with other guns in shop rooms. Game should have most, if not all, core mechanics for the demo.

### 6/2/23 + weekend

CLASSWORK: TEST

HOMEWORK: BossRoom, EnemyBoss. Completed phase 1 of the boss, may plan to add more. Thinking of having the boss spawn 2 basic enemies in phase 2 and move around.

### 6/5/23

CLASSWORK: Presented

HOMEWORK: Attempted to add more phases to boss. Have some parts of the other phases working, but movement needs to be fixed.

### 6/6/23

CLASSWORK: Tried to help Casey create an arraylist for better organization of the rooms.

HOMEWORK: Managed to create a working arraylist of rooms that will follow the order of the arraylist. Also added some code so that when you reach the last room in the arraylist, there will not be a doorway to travel to.

=======

## GROUP MEMBER 2 (Casey Ye)

### 5/22/23

CLASSWORK: Created Weapon branch with the Weapon class and the Gun and Sword subclasses. This includes some constructors
and basic methods. These are still going to be updated as the game is developed.

HOMEWORK: Add more methods to the Gun class and created Bullet class and constructor. Started drafting dialogue for the
dialogue.

### 5/23/23

CLASSWORK: Add set and get methods for the speed in the Bullet class. Update bullet class to include associated Gun and amount
of damage.

HOMEWORK: Update Bullet class to include a doDmg method and updated how position and velocity (previously speed) is initialized.
Also updated character with the same PVector position issues and added getter methods that would be used in Bullet

### 5/24/23

CLASSWORK: Add move() to Bullet and got started on a Room class

HOMEWORK: Finish up Room with inBound method (includes adding getter methods to get position of character). Add a display for Enemy

### 5/25/23

CLASSWORK: Add generateEnemies to Room and updated weapons class to remove rarity. Worked with Jason in class with the room design and boundaries on his computer.

HOMEWORK: Finished up the combat room. Created the restore room and shop room, including the merchant NPC. Need to discuss how the layout of the shop is going to be

### 5/26/23 + weekend

CLASSWORK: Make timer variable and worked with Jason to fix it. Spent class time discussing how the shop is going to work and implementing the fire rate variable

HOMEWORK: Change EnemyGrunt to Enemy in all classes. Create new instance variable for cost in Weapon. Create different types of Weapons for shop.

### 5/30/23

CLASSWORK: Worked on fixing merge conflicts between my branch and Jason's branch. Started to try to change the color of the fired bullets. Also add a game over scene

HOMEWORK: Finish up coloring bullets by making a isFriendly pararameter. Doesn't quite work yet so I'm going to keep working on it. Decided on getting right of having swords as a weapon. Combined the Weapon class with the Gun class. Updated weapons in ShopRoom and respective displayed descriptions

### 5/31/23

CLASSWORK: Updated the prototype doc to include our current process and changes to the game. Started displaying items in shop room.

HOMEWORK: Finished up shop room's display items. Added titles that player can walk over and it will show dialogue explaining the item descriptions.

### 6/2/23 + weekend

CLASSWORK: N/A

HOMEWORK: Update max number of coins dropped by enemies, balanced the number of mags in the machine gun, and fixed the position of the game over sign on the game over screen. Finished up RestoreRoom and its displayRoom() function and the restore button. Tried to get the merchant to be displayed but it's not working

### 6/5/23

CLASSWORK: N/A (presentations)

HOMEWORK: Added ArrayList of rooms in the order they would be in the game.

### 6/6/23

CLASSWORK: Tried to get the ArrayList to work

HOMEWORK: Created LoadingRoom that would go in the beginning of the room. Created a new NPC "Guide" that would display dialogue and try to make the game more interactive. Added Guide to RestoreRoom as well

### 6/7/23 + 6/8/23

CLASSWORK: Fix Guide and Merchant to display. Also fixed position of text and dialogue.

HOMEWORK: Update README file with information

## 6/10/23 + weekend

CLASSWORK : Update README file with information

HOMEWORK : Create PROTOTYPE markdown and DEVLOG markdown as well as its information.
