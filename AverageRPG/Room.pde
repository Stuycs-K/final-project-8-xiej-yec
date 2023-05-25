public class Room{
  private String name;

  
  public Room {
    rect(0, 0, 1000);
  }
  
  public boolean inBounds(Player player){
    //10 should be radius
    return (player.getXPos() + 10 < 1000 && player.getYPos() + 10 < 1000 && player.getXPos() - 10 > 0 && player.getYPos() - 10 > 0);
  }   
}
