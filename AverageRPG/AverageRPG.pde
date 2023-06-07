import java.util.*;
//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//weaponList.add(new Weapon("fist", 5, .1));

Player player = new Player(new Gun("pistol", 2, 50, 10, 5, true), new PVector(500, 500));
PVector movementVector = new PVector(0, 0);
boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean E = false;
boolean shoot = false;
ArrayList<Bullet> playerBullets = new ArrayList<Bullet>();
ArrayList<Bullet> enemyBullets = new ArrayList<Bullet>();

//Room room = new LoadingRoom();

static int shootCooldown = 0;
static int shootCooldownMax = 10;
//int countdown;

ArrayList<Room> rooms = new ArrayList<Room>();
Room room;

void setup() {
  size(1000, 1000);
  //countdown = 0;

  rooms.add(new LoadingRoom());
  rooms.add(new BossRoom());
  rooms.add(new CombatRoom((int)(random(3, 5))));
  rooms.add(new RestoreRoom());
  rooms.add(new CombatRoom((int)(random(5, 7))));
  rooms.add(new RestoreRoom());
  rooms.add(new ShopRoom());
  //rooms.add(new BossRoom());
  room = rooms.remove(0);
}

void draw() {
  background(0, 0, 0);
  room.displayRoom();
  player.display();
  
  fill(255, 0, 0);
  circle(mouseX, mouseY, 5);
  
  fill(255, 255, 100);
  rect(50, 200, 100, 100);
  rect(50, 300, 100, 100);
  rect(50, 400, 100, 100);
  
  fill(255, 255, 0);
  textSize(100);
  text("YOUR COINS: " + player.getCoins(), 200, 150);
  textSize(12);
  fill(0);
  text("PRESS TO\nCLEAR ENEMIES\n(COMBAT ROOM)", 60, 220);
  text("PRESS TO\nFILL HP", 60, 320);
  text("PRESS TO\nADD 100 COINS", 60, 420);
  
   
  if (W & player.getYPos() > room.getUp()) {
    movementVector.add(new PVector(0, -4));
  }
  if (A & player.getXPos() > room.getLeft()) {
    movementVector.add(new PVector(-4, 0));
  }
  if (S & player.getYPos() < room.getDown()) {
    movementVector.add(new PVector(0, 4));
  }
  if (D & player.getXPos() < room.getRight()) {
    movementVector.add(new PVector(4, 0));
  } 
  
  player.move(movementVector);
  movementVector = new PVector(0, 0);
  
  if (shoot & shootCooldown > shootCooldownMax) {
    shootCooldown = 0;
    playerBullets.add(player.useWeapon(new PVector(mouseX, mouseY)));
  }else {
    shootCooldown ++;
  }
  
  for (int i = 0; i < playerBullets.size(); i ++) {
    Bullet b = playerBullets.get(i);
    float xpos = b.getPosition().x;
    float ypos = b.getPosition().y;
    if (xpos > 1000 || xpos < 0 || ypos > 1000 || ypos < 0) { 
      //b = null;
      playerBullets.remove(i);
      i --;
    }
    else {
      b.move();
      if (room.checkBulletCollision(b)) {
        playerBullets.remove(i);
          i --;
      }
      b.displayBullet();
    }
  }
  for (int i = 0; i < enemyBullets.size(); i ++) {
    Bullet b = enemyBullets.get(i);
    float xpos = b.getPosition().x;
    float ypos = b.getPosition().y;
    if (xpos > 1000 || xpos < 0 || ypos > 1000 || ypos < 0) { 
      //b = null;
      enemyBullets.remove(i);
      i --;
    }
    else {
      b.move();
      if (room.checkEnemyBulletCollision(b)) {
        enemyBullets.remove(i);
        i --;
      }
      b.displayBullet();
    }
  }
  
  //for (int i = 0; i < enemies.size(); i ++) {
  //  if (enemies.get(i).getHP() > 0) {
  //    enemies.get(i).display();
  //  }
  //  else {
  //    enemies.remove(i);
  //    i --;
  //  }
  //}
  
  //when the timer is not 0
  //draw reduces the timer
  //if(countdown > 0){
  //  countdown --;
  //}

  ////do different things based
  ////on the timer
  //if(countdown == 0){
  //  shoot = false;
  //}else{
  //  shoot = true;
  //}
  deathScreen();
}

void keyPressed() {
  
  if (key == 'w' || key == 'W') {
    W = true;
  }
  if (key == 'a' || key == 'A') {
    A = true;
  }
  if (key == 's' || key == 'S') {
    S = true;
  }
  if (key == 'd' || key == 'D') {
    D = true;
  }
  if (key == 'r' || key == 'R') {
    player.getGun().reload();
  }
  
  //if (W) {
  //  movementVector.add(new PVector(0, -5));
  //}
  //if (A) {
  //  movementVector.add(new PVector(-5, 0));
  //}
  //if (S) {
  //  movementVector.add(new PVector(0, 5));
  //}
  //if (D) {
  //  movementVector.add(new PVector(5, 0));
  //}
  
  //player.move(movementVector);
  //movementVector = new PVector(0, 0);
  
}
void keyReleased() {
  
  if (key == 'w' || key == 'W') {
    W = false;
  }
  if (key == 'a' || key == 'A') {
    A = false;
  }
  if (key == 's' || key == 'S') {
    S = false;
  }
  if (key == 'd' || key == 'D') {
    D = false;
  }
}
void mousePressed() {
  shoot = true;
  
  if (mouseX >= 50 & mouseX <= 150 & mouseY > 200 & mouseY <= 300) {
    if (room instanceof CombatRoom) {
      CombatRoom clear = (CombatRoom)room;
      clear.complete();
    }
    shoot = false;
  }
  if (mouseX >= 50 & mouseX <= 150 & mouseY > 300 & mouseY <= 400) {
    player.setHP(player.getMaxHP());
    shoot = false;
  }
  if (mouseX >= 50 & mouseX <= 150 & mouseY > 400 & mouseY <= 500) {
    player.addCoins(100);
    shoot = false;
  }
}
void mouseReleased() {
  shoot = false;
}

void deathScreen(){
  if (player.isDead()){
      background(0, 0, 0);
      fill(250);
      textSize(100);
      text("GAME OVER", 250, 500);
  }
}
