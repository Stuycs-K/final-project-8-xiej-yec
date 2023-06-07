public class RestoreRoom extends Room{
  float triangleOffset;
  boolean triangleDirection = true;
  private String[] dialogue;

  public RestoreRoom(){
    super("Restore Room", new PVector(200, 200), 600, 600, color(119, 252, 123));
    dialogue= new String[]{"Guide : That wasn't so bad was it?", //0
    "Guide : Hang in there!" //1
    };
  }
     
  public void displayRoom(){
    super.displayRoom();
    NPC guide = new NPC("Guide", new PVector(500, 400), dialogue);
    guide.display();
    fill(255);
    rect(400, 600, 200, 100);
    fill(0);
    textSize(20); 
    text("Walk over to refill hp", 420, 650);
    
    if (player.getYPos() >= 600 & player.getXPos() >= 400 & player.getYPos() <= 700 & player.getXPos() <= 600){
      player.setHP(player.getMaxHP());
      fill(255);
      textSize(50); 
      text(dialogue[0], 150, 870);
      textSize(12);
    }
    
    
    fill(0,255,0);
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
   
    if (rooms.size() > 0) {
      triangle(830 + triangleOffset, 500, 850 + triangleOffset, 450, 850 + triangleOffset, 550);
      rect(800, 400, 5, 200);
      nextRoom(790, 600, 400);
    }
    
    noFill();
  }
  
}
