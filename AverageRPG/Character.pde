public class Character {
  private String name;
  private int maxHP;
  private int HP;
  private Weapon[3] weapons;
  private Weapon weaponHolding;
  PVector position;
  boolean isFriendly;
  
  public class Character(String name_, int maxHP_, int HP_, Weapon[] weapons_, PVector position_, boolean isFriendly_) {
    name = name_;
    maxHP = maxHP_;
    HP = HP_;
    weapons = weapons_;
    weaponHolding = weapons[0];
    position = position_;
    isFriendly = isFriendly_;
  }
  
  public void displayCharacter() { //include health bar and sprites
    int x = position.x;
    int y = position.y;
  }
  
  
  
}
