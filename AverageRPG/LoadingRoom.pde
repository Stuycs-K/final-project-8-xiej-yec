public class LoadingRoom extends Room{
  float triangleOffset;
  boolean triangleDirection = true;
  private String[] dialogue;
  
   public LoadingRoom(){
    super("Loading Room", new PVector(200, 200), 600, 600, color(140, 244, 255));
    dialogue= new String[] {"Welcome to your average RPG game", //0
    "Just walk to the triangle to progress!"}; //1
    NPC guide = new NPC("Guide", new PVector(500, 800), dialogue);
  }
 
   public void displayRoom(){
   super.displayRoom();
    fill(0,255,0);
    rect(800, 400, 5, 200);
    if (triangleOffset + 830 >= 840) {
      triangleDirection = false;
    }
    else if (triangleOffset + 830 <= 820) {
      triangleDirection = true;
    }
    if (triangleDirection) {
      triangleOffset += .5;
    }
    else {
      triangleOffset -= .5;
    }
    triangle(830 + triangleOffset, 500, 850 + triangleOffset, 450, 850 + triangleOffset, 550);
    noFill();
    
      if (rooms.size() > 0) {
        triangle(830 + triangleOffset, 500, 850 + triangleOffset, 450, 850 + triangleOffset, 550);
        rect(800, 400, 5, 200);
        nextRoom(790, 600, 400);
      }
   }
  
}
