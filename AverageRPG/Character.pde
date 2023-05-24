public class Character {
  private String name;
  private int maxHP;
  private int HP;
  private Weapon weaponHolding;
  PVector position;
  boolean isFriendly;
  
  public Character(String name_, int maxHP_, int HP_, Weapon weapon_, PVector position_, boolean isFriendly_) {
    name = name_;
    maxHP = maxHP_;
    HP = HP_;
    weaponHolding = weapon_;
    position = position_;
    isFriendly = isFriendly_;
  }
  
  public void displayCharacter() { //include health bar and sprites
    int x = position.x;
    int y = position.y;
    circle(x, y, 20);
  }
  
  public void takeDMG(int damage) {
    HP -= damage;
  }
  public void useWeapon(Weapon weapon) {
    
  }
  public void move(PVector movement) {
    
  }
}