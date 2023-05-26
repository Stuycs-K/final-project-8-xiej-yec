import java.util.*;
//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//weaponList.add(new Weapon("fist", 5, .1));
  
  

Player player = new Player(new Gun("pistol", 5, 10), new PVector(500, 500));
PVector movementVector = new PVector(0, 0);
boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean shoot = false;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
ArrayList<EnemyGrunt> enemies = new ArrayList<EnemyGrunt>();
Room room = new Room("test", new PVector(200, 200), 600, 600, color(255,182,193));

void setup() {
  size(1000, 1000);
  enemies.add(new EnemyGrunt("test", 20, 20, new Gun("standard", 10, 1000000000), new PVector(500, 500)));
}



void draw() {
  background(0, 0, 0);
  room.displayRoom();
  player.displayCharacter();
  

  text(key, 500, 500);
   
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
  
  if (shoot) {
    bullets.add(player.useWeapon(new PVector(mouseX, mouseY)));
  }
  
  for (int i = 0; i < bullets.size(); i ++) {
    Bullet b = bullets.get(i);
    float xpos = b.getPosition().x;
    float ypos = b.getPosition().y;
    if (xpos > 1000 || xpos < 0 || ypos > 1000 || ypos < 0) { 
      //b = null;
      bullets.remove(i);
      i --;
    }
    else {
      bullets.get(i).move();
      for (int j = 0; j < enemies.size(); j ++) {
        if (b.doDmg(enemies.get(j))) {
          bullets.remove(i);
          i --;
        }
        else {
          b.displayBullet();
        }
      }
    }
  }
  
  for (int i = 0; i < enemies.size(); i ++) {
    enemies.get(i).displayEnemy();
  }
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
}
void mouseReleased() {
  shoot = false;
}
