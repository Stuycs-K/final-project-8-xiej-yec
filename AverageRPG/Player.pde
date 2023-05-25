import java.util.*;
public class Player extends Characters {
  private int coins;
  //private ArrayList<Weapon> weapons;
  
  public Player(Weapon weapon_, PVector position_) {
    super("Player", 20, 20, weapon_, position_, true);
    coins = 0;
    //weapons = weapons_;
  }
}
