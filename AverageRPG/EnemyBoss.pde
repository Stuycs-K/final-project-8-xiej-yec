public class EnemyBoss extends Enemy {
  private boolean cloneReady = true;
  
  public EnemyBoss(int HP, boolean cloneR, PVector pos) {
    super("BOSS", 500, HP, new Gun("phase 1", 1, 100, 0, 15, false), pos, 5, -1);
    cloneReady = cloneR;
    if (super.getHP() > super.getMaxHP() * 4 / 5) {
      super.currentMovement = (new PVector(0,0));
    }
    else {
      super.currentMovement = chooseMovement();
    }
    super.setHitbox(80);
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
      setMaxShoot(25);
      setMaxMove(30);
      super.setGun(new Gun("phase 2", 1, -1, 0, 8, false));
      super.setHitbox(60);
    }
    
    if (super.getHP() <= super.getMaxHP() * 2 / 5) {
      setMaxShoot(25);
      setMaxMove(30);
      super.setGun(new Gun("phase 2", 1, -1, 0, 8, false));
      super.setHitbox(30);
    }
  }
  
  public void resetMovement(int num) {
    super.moveCooldown = 0;
    if (random(2) < 1) {
      super.currentMovement = new PVector(num, num);
    }
    else if (random(2) < 1) {
      super.currentMovement = new PVector(num, -1 * num);
    }
    else if (random(2) < 1) {
      super.currentMovement = new PVector(-1 * num, num);
    }
    else {
      super.currentMovement = new PVector(-1 * num, -1 * num);
    }
  }
  
  public PVector chooseMovement(int num) {  
    super.moveCooldown ++;
    if (super.moveCooldown >= super.moveCooldownMax && super.moveCooldownMax != -1) {
      super.moveCooldown = 0;
      if ((random(2)) < 1) {
        super.currentMovement = new PVector(num, num);
      }
      else if ((random(2)) < 1) {
        super.currentMovement = new PVector(num, -1 * num);
      }
      else if ((random(2)) < 1) {
        super.currentMovement = new PVector(-1 * num, num);
      }
      else {
        super.currentMovement = new PVector(-1 * num, -1 * num);
      }
    }
    return super.currentMovement;
  }
  
  public boolean getCloneReady() {
    return cloneReady;
  }
  public void setCloneReady(boolean newReady) {
    cloneReady = newReady;
  }
  
}
