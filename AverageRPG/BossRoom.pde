public class BossRoom extends CombatRoom{
  public BossRoom() {
    super(1);
  }
  
  public void generateEnemies(int hp, boolean original, PVector pos){
    enemies.add(new EnemyBoss(hp, original, pos));
  }
  public void generateEnemies(int hp){
    enemies.add(new EnemyBoss(500, true, new PVector(500, 500)));
  }
  
  public void displayRoom() {
    super.displayRoom();
    
    enemyAction();
    
    for (int i = 0; i < enemies.size(); i ++) {
      EnemyBoss currentBoss = (EnemyBoss)enemies.get(i);
      currentBoss.update();
      
      if (currentBoss.getHP() <= currentBoss.getMaxHP() * 2 / 5 & currentBoss.getCloneReady()) {
        enemies.add(new EnemyBoss(currentBoss.getHP(), false, PVector.add(currentBoss.getPosition(), new PVector(1, 1))));
        enemies.add(new EnemyBoss(currentBoss.getHP(), false, PVector.add(currentBoss.getPosition(), new PVector(-1, -1))));
        currentBoss.setCloneReady(false);
      }
    }
  }
  
  public void enemyAction(){
    for (int i = 0 ; i < enemies.size(); i++){
      EnemyBoss e = (EnemyBoss)enemies.get(i);
      
      if (e.getHP() == 0) {
        player.addCoins(100);
        enemies.remove(i);
        i --;
      }
      
      //if (e.getHP() > e.getMaxHP() * 4 / 5) {
      //  if (e.getGun().getCurrentBulletCount() <= 1) {
      //    e.setGun(new Gun("fake reload", 0, -1, 0, 15, false));
      //  }
      //}
        
        
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
}
