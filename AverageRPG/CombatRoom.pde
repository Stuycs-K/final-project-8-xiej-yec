public class CombatRoom extends Room{
  ArrayList<Enemy> enemies;
  boolean triangleDirection = true;
  float triangleOffset;
  
  public CombatRoom(int numberEnemies){
    super("Combat Room", new PVector(200, 200), 600, 600, color(216,191,216));
    enemies = new ArrayList<Enemy>(numberEnemies);
    generateEnemies(numberEnemies);
  }
  
  public void generateEnemies(int numOfEnemies){
    for (int i = 0 ; i < numOfEnemies; i++){
      //enemies have infintite bulets
      int HP = (int)random(5, 9) * 10;
      Gun gun = new Gun("standard", 1 , -1, -1, 5, false);
      enemies.add(new Enemy("basic", HP, HP, gun, new PVector(random(220, 780), random(220, 780))));
    }
  }
  
  public void displayRoom() {
    super.displayRoom();
    enemyAction();
    
    for (int i = 0 ; i < enemies.size(); i++){
      enemies.get(i).display();
    }
    
    if (enemies.size() == 0) {
      fill(0,255,0);
      rect(800, 400, 5, 200);
      if (triangleOffset + 830 >= 840) {
        triangleDirection = false;
      }
      else if (triangleOffset + 830 <= 820) {
        triangleDirection = true;
      }
      if (triangleDirection) {
        triangleOffset += .5;
      }
      else {
        triangleOffset -= .5;
      }
      triangle(830 + triangleOffset, 500, 850 + triangleOffset, 450, 850 + triangleOffset, 550);
      noFill();
      
      nextRoom(790, 600, 400, new RestoreRoom());
      
    }
  }
  public void enemyAction(){
    for (int i = 0 ; i < enemies.size(); i++){
      Enemy e = enemies.get(i);
      
      if (e.getHP() == 0) {
        player.addCoins((int)(random(5, 20)));
        enemies.remove(i);
        i --;
      }
      
      PVector movement = e.chooseMovement();
      e.move(movement);
      if (!inBounds(e)) {
        e.move(PVector.mult(movement, -1));
        e.resetMovement();
      }
      
      if (e.canShoot()) {
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-25, 25), random(-25, 25)))));
      }
    }
  }
  
  public ArrayList<Enemy> getEnemies() {
    return enemies;
  }
  
  public boolean checkBulletCollision(Bullet bullet) {
    for (int j = 0; j < enemies.size(); j ++) {
      if (bullet.doDmg(enemies.get(j))) {
        return true;
      }
    }
    return false;
  }
  public boolean checkEnemyBulletCollision(Bullet bullet) {
    return (bullet.doDmg(player));
  }
  
  public void complete() {
    while (enemies.size() > 0) {
      enemies.remove(0);
    }
  }
}
