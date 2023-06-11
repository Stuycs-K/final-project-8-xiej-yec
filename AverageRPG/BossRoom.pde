public class BossRoom extends CombatRoom{
  ArrayList<Enemy> shields = new ArrayList<Enemy>();
  ArrayList<Characters> victory = new ArrayList<Characters>();
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
    
    if (enemies.size() == 0) {
      textSize(50);
      fill(0);
      text("YOU WIN!!! CONGRATS!!!", 250, 500);
      textSize(12);
      
      Characters add = new Characters("confetti", 1, 1, null, new PVector(random(0, 1000), 0), false);
      add.setHitbox(10);
      if (random(0, 100) < 30) {
        victory.add(add);
      }
      for (int i = 0; i < victory.size(); i ++) {
        victory.get(i).move(new PVector((int)random(-2, 2), 2));
        fill(color(random(0, 255), random(0, 255), random(0, 255)));
        victory.get(i).display();
        noFill();
      }
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
  public void complete() {
    super.complete();
    while (shields.size() > 0) {
      shields.remove(0);
    }
  }
}
