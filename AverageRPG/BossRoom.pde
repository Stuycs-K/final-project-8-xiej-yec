public class BossRoom extends CombatRoom{
  ArrayList<Enemy> shields = new ArrayList<Enemy>();
  boolean shieldsActive;
  
  public BossRoom() {
    super(1);
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(600, 500), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(500, 600), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(400, 500), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(500, 400), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(550, 450), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(450, 550), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(450, 450), 80, (int)random(30, 55)));
    shields.add(new Enemy("shield", 30, 30, new Gun("standard", 1 , -1, -1, 5, false), new PVector(550, 550), 80, (int)random(30, 55)));
    shieldsActive = false;
  }
  
  public void generateEnemies(int hp){
    enemies.add(new EnemyBoss(500, true, new PVector(500, 500)));
  }
  
  public void displayRoom() {
    super.displayRoom();
    
    if (shields.size() == 0) {
      for (int i = 0; i < shields.size(); i ++) {
        shields.remove(i);
        i --;
      }
    }
    
    enemyAction();
    
    for (int i = 0; i < enemies.size(); i ++) {
      EnemyBoss currentBoss = (EnemyBoss)enemies.get(i);
      currentBoss.update();
      
      if (currentBoss.getHP() <= currentBoss.getMaxHP() * 2 / 5 & currentBoss.getCloneReady()) {
        enemies.add(new EnemyBoss(currentBoss.getHP(), false, PVector.add(currentBoss.getPosition(), new PVector(1, 1))));
        enemies.add(new EnemyBoss(currentBoss.getHP(), false, PVector.add(currentBoss.getPosition(), new PVector(-1, -1))));
        currentBoss.setCloneReady(false);
      }
      
      //if (currentBoss.getHP() <= currentBoss.getMaxHP() * 4 / 5) {
      //  for (int j = 0; j < shields.size(); j ++) {
      //    shields.remove(j);
      //    j --;
      //  }
      //}
      
    }
  }
  
  public void enemyAction(){
    for (int i = 0 ; i < shields.size(); i++){
      Enemy e = shields.get(i);
      e.display();
      
      if (e.getHP() == 0) {
        shields.remove(i);
        i --;
      }
      
      if (shieldsActive) {
        PVector movement = e.chooseMovement();
        e.move(movement);
        if (!inBounds(e)) {
          e.move(PVector.mult(movement, -1));
          e.resetMovement();
        }
      }
      
      if (e.canShoot()) {
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-15, 15), random(-15, 15)))));
      }
    }
    
    for (int i = 0 ; i < enemies.size(); i++){
      EnemyBoss e = (EnemyBoss)enemies.get(i);
      
      if (e.getHP() == 0) {
        player.addCoins(100);
        enemies.remove(i);
        i --;
      }
      
      if (e.getHP() <= e.getMaxHP() * 4 / 5) {
        shieldsActive = true;
      }
        
        
      PVector movement = e.chooseMovement(2);
      e.move(movement);
      if (!inBounds(e)) {
        e.setCurrentMovement(PVector.mult(movement, -1));
        //e.resetMovement(2);
      }
      
      if (e.canShoot() & e.getHP() <= e.getMaxHP() * 4 / 5 & e.getHP() > e.getMaxHP() * 2 / 5) {
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-15, 15), random(-15, 15)))));
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-50, -15), random(-50, -15)))));
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(15, 50), random(15, 50)))));
      }
      else if (e.canShoot()) {
        enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-15, 15), random(-15, 15)))));
      }
    }
  }
  
  public boolean checkBulletCollision(Bullet bullet) {
    for (int j = 0; j < enemies.size(); j ++) {
      if (bullet.doDmg(enemies.get(j))) {
        return true;
      }
    }
    for (int k = 0; k < shields.size(); k ++) {
      if (bullet.doDmg(shields.get(k))) {
        return true;
      }
    }
    return false;
  }
}
