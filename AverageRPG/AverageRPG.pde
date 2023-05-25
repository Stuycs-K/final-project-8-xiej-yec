import java.util.*;
//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//weaponList.add(new Weapon("fist", 5, .1));
  
  

Player player = new Player(new Gun("pistol", 5, .1, 10), new PVector(500, 500));
PVector movementVector = new PVector(0, 0);
boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;
boolean shoot = false;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Room room = new Room();

void setup() {
  size(1000, 1000);
}



void draw() {
  background(0, 0, 0);
  room.displayRoom();
  player.displayCharacter();
  

  text(key, 500, 500);
   
  if (W & room.inBounds(player)) {
    movementVector.add(new PVector(0, -4));
  }
  if (A & room.inBounds(player)) {
    movementVector.add(new PVector(-4, 0));
  }
  if (S & room.inBounds(player)) {
    movementVector.add(new PVector(0, 4));
  }
  if (D & room.inBounds(player)) {
    movementVector.add(new PVector(4, 0));
  } 
  
  player.move(movementVector);
  movementVector = new PVector(0, 0);
  
  if (shoot) {
    bullets.add(player.useWeapon(new PVector(mouseX, mouseY)));
  }
  
  for (int i = 0; i < bullets.size(); i ++) {
    float xpos = bullets.get(i).getPosition().x;
    float ypos = bullets.get(i).getPosition().y;
    if (xpos > 1000 || xpos < 0 || ypos > 1000 || ypos < 0) { 
      Bullet b = bullets.get(i);
      b = null;
      //bullets.remove(i);
    }
    bullets.get(i).move();
    bullets.get(i).displayBullet();
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
