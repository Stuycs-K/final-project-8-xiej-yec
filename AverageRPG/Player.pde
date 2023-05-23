public class Player extends Character {
  private int coins;
  private ArrayList<Weapon> weapons;
  
  public Player(ArrayList<Weapon> weapons_, PVector position_) {
    super("Player", 20, 20, weapons_.get(0), position_, true);
    coins = 0;
    weapons = weapons_;
  }
}
