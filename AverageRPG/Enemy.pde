public class Enemy extends Characters {
  public Enemy(String name_, int maxHP_, int HP_, Weapon weapon, PVector position_) {
    super(name_, maxHP_, HP_, weapon, position_, false);
  }
  
  public void displayEnemy() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    fill(255, 10, 10);
    text("" + super.HP + "/" + super.maxHP, super.getXPos() - super.getHitbox() / 2, super.getYPos() - super.getHitbox());
    circle(x, y, super.hitbox);
  }
}
