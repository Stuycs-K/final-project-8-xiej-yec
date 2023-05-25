public class Room{
  private String name;
  
  public Room {
    rect(0, 0, 1000);
  }
  
  public boolean inBounds(Player player){
    //10 should be radius
    return (player.getX() + 10 > 500 && player.getX() - 10 < 500  && player.getY() - 10 < 500 player.getX() + 10 > 500);
  }
  
}
