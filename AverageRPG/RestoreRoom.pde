public class RestoreRoom extends Room{
  float triangleOffset;
  boolean triangleDirection = true;

  public RestoreRoom(){
    super("Restore Room", new PVector(200, 200), 600, 600, color(119, 252, 123));
  }
     
  public void displayRoom(){
    super.displayRoom();
    
    fill(255);
    rect(400, 600, 200, 100);
    fill(0);
    textSize(20); 
    text("Walk over to refill hp", 420, 650);
    
    if (player.getYPos() >= 600 & player.getXPos() >= 400 & player.getYPos() <= 700 & player.getXPos() <= 600){
      player.setHP(player.getMaxHP());
    }
    
    
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
    
    nextRoom(790, 600, 400, new CombatRoom((int)(random(2, 5))));
  }
