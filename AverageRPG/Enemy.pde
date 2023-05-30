public class Enemy extends Characters {
  int moveCooldownMax = (int)random(30, 55);
  int moveCooldown = 0;
  int shootCooldown = 0;
  PVector currentMovement = new PVector(random(-1, 1), random(-2, 2));
  
  public Enemy(String name_, int maxHP_, int HP_, Weapon weapon, PVector position_) {
    super(name_, maxHP_, HP_, weapon, position_, false);
  }
  
  public void display() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    fill(255, 10, 10);
    text("" + super.HP + "/" + super.maxHP, super.getXPos() - super.getHitbox(), super.getYPos() - super.getHitbox() / 1.2);
    circle(x, y, super.hitbox);
  }
  
  public void resetMovement() {
    moveCooldownMax = (int)random(30, 55);
    moveCooldown = 0;
    currentMovement = new PVector(random(-2, 2), random(-2, 2));
  }
  
  public boolean canShoot() {
    if (shootCooldown >= 80) {
      shootCooldown = 0;
      return true;
    }
    else {
      shootCooldown += random(4);
    }
    return false;
  }
  
  public PVector chooseMovement() {
    moveCooldown ++;
    if (moveCooldown >= moveCooldownMax) {
      moveCooldown = 0;
      currentMovement = new PVector(random(-2, 2), random(-2, 2));
    }
    return currentMovement;
  }
}
