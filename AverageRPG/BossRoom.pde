public class BossRoom extends CombatRoom{
  public BossRoom() {
    super(1);
  }
  
  public void generateEnemies(int numOfEnemies){
    enemies.add(new EnemyBoss());
  }
  
  public void displayRoom() {
    super.displayRoom();
    for (int i = 0; i < enemies.size(); i ++) {
      EnemyBoss currentBoss = (EnemyBoss)enemies.get(i);
      currentBoss.update();
    }
  }
  
  //public void enemyAction(){
  //  for (int i = 0 ; i < enemies.size(); i++){
  //    EnemyBoss e = (EnemyBoss)enemies.get(i);
      
  //    if (e.getHP() == 0) {
  //      player.addCoins(9999);
  //      enemies.remove(i);
  //      i --;
  //    }
      
  //    if (e.getHP() > e.getMaxHP() * 4 / 5) {
  //      if (e.getGun().getCurrentBulletCount() <= 1) {
  //        e.setGun(new Gun("fake reload", 0, -1, 0, 15, false));
  //      }
  //    }
        
        
  //    PVector movement = e.chooseMovement();
  //    e.move(movement);
  //    if (!inBounds(e)) {
  //      e.move(PVector.mult(movement, -1));
  //      e.resetMovement();
  //    }
      
  //    if (e.canShoot()) {
  //      enemyBullets.add(e.useWeapon(PVector.add(player.getPosition(), new PVector(random(-25, 25), random(-25, 25)))));
  //    }
  //  }
  //}
}
