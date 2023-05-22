public class Player extends Character {
  private int coins;
  private Weapon[] weapons;
  
  public Player(String name, Weapon[] weapons_, PVector position_) {
    super("Player", 20, 20, weapons[0], position_, true);
    coins = 0;
    weapons = weapons_;
  }
}
