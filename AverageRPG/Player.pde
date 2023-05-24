import java.util.*;
public class Player extends Characters {
  //private int coins;
  //private ArrayList<Weapon> weapons;
  
  public Player(PVector position_) {
    super("Player", 20, 20, null, position_, true);
    //coins = 0;
    //weapons = weapons_;
  }
  
  public void move(PVector movement) {
    super.changePosition(movement);
  }
}
