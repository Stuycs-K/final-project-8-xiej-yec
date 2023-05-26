public class Room{
  private String name;
  private PVector leftCorner;
  private color fill;
  private float w, h;
  
  public Room(String name_, PVector left, float wid, float hei, color fill_) {
    name = name_;
    leftCorner = left;
    fill = fill_;
    w = wid;
    h = hei;
  }
  public Room() {
    name = "test";
    leftCorner = new PVector(200, 200);
    fill = color(255,182,193);
    w = 600;
    h = 600;
  }
  
  public boolean inBounds(Player player){
    //10 should be radius
    return (player.getXPos() + 10 < 1000 & player.getYPos() + 10 < 1000 & player.getXPos() - 10 > 0 & player.getYPos() - 10 > 0);
  }
  
  public float getLeft() {
    return leftCorner.x + 10;
  }
  public float getRight() {
    return leftCorner.x + w - 10;
  }
  public float getUp() {
    return leftCorner.y + 10;
  }
  public float getDown() {
    return leftCorner.y + h - 10;
  }
  
  public void displayRoom() {
    fill(fill);
    rect(leftCorner.x, leftCorner.y, w, h); //all of these should be parameters in the future
    
    text(name, getRight() - 10, getUp() - 10);
  }
}
