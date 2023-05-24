//import java.util.*;
//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//weaponList.add(new Weapon("fist", 5, .1));
  
  

Player player = new Player(new PVector(100, 100));
PVector movementVector = new PVector(0, 0);
char pressed = '\0';

void setup() {
  size(1000, 1000);
}



void draw() {
  background(0, 0, 0);
  player.displayCharacter();

  text(key, 500, 500);
  text(pressed, 600, 500);
  
  if (pressed != '\0') {
    if (key == 'w' || pressed == 'w') {
      movementVector.add(new PVector(0, -5));
    }
    if (key == 'a'|| pressed == 'a') {
      movementVector.add(new PVector(-5, 0));
    }
    if (key == 's'|| pressed == 's') {
      movementVector.add(new PVector(0, 5));
    }
    if (key == 'd'|| pressed == 'd') {
      movementVector.add(new PVector(5, 0));
    }
    
    player.move(movementVector);
    movementVector = new PVector(0, 0);
  }
}

void keyPressed() {
  if (pressed == '\0') {
    pressed = key;
  }
  
  
  //if (pressed == 'w' || pressed == 'W') {
  //  movementVector.add(new PVector(0, -5));
  //}
  //if (pressed == 'a' || pressed == 'A') {
  //  movementVector.add(new PVector(-5, 0));
  //}
  //if (pressed == 's' || pressed == 'S') {
  //  movementVector.add(new PVector(0, 5));
  //}
  //if (pressed == 'd' || pressed == 'D') {
  //  movementVector.add(new PVector(5, 0));
  //}
  //if (key == 'w' || key == 'W') {
  //  movementVector.add(new PVector(0, -5));
  //}
  //if (key == 'a' || key == 'A') {
  //  movementVector.add(new PVector(-5, 0));
  //}
  //if (key == 's' || key == 'S') {
  //  movementVector.add(new PVector(0, 5));
  //}
  //if (key == 'd' || key == 'D') {
  //  movementVector.add(new PVector(5, 0));
  //}
  
  //player.move(movementVector);
  //movementVector = new PVector(0, 0);
  
}
void keyReleased() {

  if (!keyPressed) {
    pressed = '\0';
  }
}
