//import java.util.*;
//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//weaponList.add(new Weapon("fist", 5, .1));
  
  

Player player = new Player(new PVector(100, 100));
PVector movementVector = new PVector(0, 0);
boolean W = false;
boolean A = false;
boolean S = false;
boolean D = false;

void setup() {
  size(1000, 1000);
}



void draw() {
  background(0, 0, 0);
  player.displayCharacter();

  text(key, 500, 500);
   
  if (W) {
    movementVector.add(new PVector(0, -5));
  }
  if (A) {
    movementVector.add(new PVector(-5, 0));
  }
  if (S) {
    movementVector.add(new PVector(0, 5));
  }
  if (D) {
    movementVector.add(new PVector(5, 0));
  } 
  
  player.move(movementVector);
  movementVector = new PVector(0, 0);
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
