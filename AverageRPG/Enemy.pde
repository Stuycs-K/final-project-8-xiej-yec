public class Enemy extends Characters {
  private int moveCooldownMax;
  private int moveCooldown = 0;
  private int shootCooldown = 0;
  private int shootCooldownMax;
  private PVector currentMovement = new PVector(random(-2, 2), random(-2, 2));
  
  public Enemy(String name_, int maxHP_, int HP_, Gun weapon, PVector position_, int shoot, int move) {
    super(name_, maxHP_, HP_, weapon, position_, false);
    shootCooldownMax = shoot;
    moveCooldownMax = move;
  }
  
  public void display() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    fill(255, 10, 10);
    text("" + super.HP + "/" + super.maxHP, super.getXPos() - super.getHitbox(), super.getYPos() - super.getHitbox() / 1.2);
    circle(x, y, super.hitbox);
  }
  
  public void resetMovement() {
    moveCooldownMax = (int)(random(30, 55));
    moveCooldown = 0;
    currentMovement = new PVector(random(-2, 2), random(-2, 2));
  }
  public void resetShoot(int shoot) {
    shootCooldownMax = shoot;
    shootCooldown = 0;
  }
  
  public boolean canShoot() {
    if (this.shootCooldown >= shootCooldownMax) {
      this.shootCooldown = 0;
      return true;
    }
    else {
      this.shootCooldown += random(4);
    }
    return false;
  }
  
  public PVector chooseMovement() {  
    moveCooldown ++;
    if (moveCooldown >= moveCooldownMax && moveCooldownMax != -1) {
      moveCooldown = 0;
      currentMovement = new PVector(random(-2, 2), random(-2, 2));
    }
    return currentMovement;
  }
  public void setMaxShoot(int shoot) {
    shootCooldownMax = shoot;
  }
  public void setMaxMove(int move) {
    moveCooldownMax = move;
  }
  public void setCurrentMovement(PVector vector) {
    this.currentMovement = vector;
  }
}
