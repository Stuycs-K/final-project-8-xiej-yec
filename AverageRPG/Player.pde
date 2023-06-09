import java.util.*;
public class Player extends Characters {
  private int coins;
  //private ArrayList<Weapon> weapons;
  
  public Player(Gun weapon_, PVector position_) {
    super("Player", 100, 100, weapon_, position_, true);
    coins = 0;
    //weapons = weapons_;
  }
  
  public void display() { //include health bar and sprites
    Gun displayBullets = super.weaponHolding;
    float x = position.x;
    float y = position.y;
    fill(102,178,255);  
    rect(x - super.hitbox/2, y - super.hitbox/2, super.hitbox, super.hitbox);
    noFill();
    text("" + super.HP + "/" + super.maxHP, super.getXPos() - super.getHitbox() / 2, super.getYPos() - super.getHitbox());
    if (shootCooldown >= 0) {
      text("" + displayBullets.getCurrentBulletCount(), super.getXPos() - super.getHitbox() / 2, super.getYPos() + super.getHitbox());
    }
    else {
      text("RELOADING", super.getXPos() - super.getHitbox() / 2, super.getYPos() + super.getHitbox());
    }
  }
  
  public float getXPos(){
    return position.x;
  }
  
  public float getYPos(){
    return position.y;
  }
  public void setPosition(PVector newPos) {
    super.position = newPos;
  }
  
  public int getCoins() {
    return coins;
  }
  public void addCoins(int add) {
    coins += add;
  }
}
