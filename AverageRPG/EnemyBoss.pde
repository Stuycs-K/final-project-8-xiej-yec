public class EnemyBoss extends Enemy {
  public EnemyBoss() {
    super("BOSS", 500, 500, new Gun("phase 1", 1, 100, 0, 15, false), new PVector(500, 500), 5, -1);
    super.currentMovement = (new PVector(0,0));
  }
  
  public void update() {
    if (super.getHP() > super.getMaxHP() * 4 / 5) {
      if (getGun().getCurrentBulletCount() <= 1) {
        setMaxShoot(100);
      }
      if (getGun().getCurrentBulletCount() > 1) {
          setMaxShoot(5);
      }
    }
    
    if (super.getHP() <= super.getMaxHP() * 4 / 5) {
      super.currentMovement = new PVector(random(-1, 1), random(-2, 2));
      super.setGun(new Gun("phase 2", 1, -1, 0, 15, false));
    }
  }
  
}
