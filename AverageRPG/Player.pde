import java.util.*;
public class Player extends Characters {
  private int coins;
  //private ArrayList<Weapon> weapons;
  
  public Player(Weapon weapon_, PVector position_) {
    super("Player", 20, 20, weapon_, position_, true);
    coins = 0;
    //weapons = weapons_;
  }
  
  public void displayCharacter() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    fill(0,255,127);
    rect(x - 10, y - 10, 20, 20);
  }
}
