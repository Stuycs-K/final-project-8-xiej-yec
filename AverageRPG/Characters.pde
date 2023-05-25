import java.util.*;
public class Characters {
  private String name;
  private int maxHP;
  private int HP;
  private Weapon weaponHolding;
  PVector position;
  boolean isFriendly;
  
  public Characters(String name_, int maxHP_, int HP_, Weapon weapon_, PVector position_, boolean isFriendly_) {
    name = name_;
    maxHP = maxHP_;
    HP = HP_;
    weaponHolding = weapon_;
    position = position_;
    isFriendly = isFriendly_;
  }
  
  public void displayCharacter() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    rect(x - 10, y - 10, 20, 20);
  }
  
  public void takeDMG(int damage) {
    HP -= damage;
  }
  public Bullet useWeapon(PVector aimed) {
    return weaponHolding.spawnBullet(position, aimed, 2.5);
  }
  public void move(PVector movement) {
    position.add(movement);
  }
  public PVector getPosition() {
    return position;
  }
}
