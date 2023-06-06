public class Room{
  private String name;
  private PVector leftCorner;
  private color fill;
  private float w, h;
  //ArrayList<Room> rooms;
  
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
  
  public boolean inBounds(Characters player){
    return (player.getXPos() < getRight() & player.getYPos() < getDown() & player.getXPos() > getLeft() & player.getYPos() - 10 > getUp());
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
    
    text(name, getRight() - name.length() * 5, getUp() - 12);
    
    noFill();
    //nextRoom(790, 600, 400, rooms.remove(0));
  }
  
  public void nextRoom(float xCoord, float yCoordTop, float yCoordBot, Room nextRoom) {
    if (player.getXPos() >= xCoord & player.getYPos() >= yCoordBot & player.getYPos() <= yCoordTop) {
      player.setPosition(new PVector(nextRoom.getLeft() + player.getHitbox(), nextRoom.getUp() + h / 2));
      room = nextRoom;
    }
  }
  
  public boolean checkBulletCollision(Bullet bullet) {
    return false;
  }
  public boolean checkEnemyBulletCollision(Bullet bullet) {
    return false;
  }

}
