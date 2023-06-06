import java.util.*;
public class Characters {
  private String name;
  private int maxHP;
  private int HP;
  private Gun weaponHolding;
  PVector position;
  boolean isFriendly;
  private int hitbox = 30;
  
  public Characters(String name_, int maxHP_, int HP_, Gun weapon_, PVector position_, boolean isFriendly_) {
    name = name_;
    maxHP = maxHP_;
    HP = HP_;
    weaponHolding = weapon_;
    position = position_;
    isFriendly = isFriendly_;
  }
  
  public void display() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    rect(x - hitbox/2, y - hitbox/2, hitbox, hitbox);
  }
  
  public void takeDMG(int damage) {
    HP -= damage;
  }
  public Bullet useWeapon(PVector aimed) {
    return weaponHolding.spawnBullet(position, aimed, 5);
  }
  public void move(PVector movement) {
    position.add(movement);
  }
  
  public float getXPos(){
    return position.x;
  }
  
  public float getYPos(){
    return position.y;
  }
  public PVector getPosition() {
    return position;
  }
  

  public void setHP(int newHP){
    HP = newHP;
  }
  
  public int getMaxHP(){
    return maxHP;
  }
  public int getHP(){
    return HP;
  }
  
  public int getHitbox(){
    return hitbox;
  }
  public void setHitbox(int num){
    hitbox = num;
  }
  
  public void decreaseHP(int damage){
    HP -= damage;
  }
  
  public boolean isDead(){
    return (getHP() <= 0);
  }
  
  public Gun getGun() {
    return weaponHolding;
  }
  public void setGun(Gun gun) {
    weaponHolding = gun;
  }

}
