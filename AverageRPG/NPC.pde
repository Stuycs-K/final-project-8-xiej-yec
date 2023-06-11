public class NPC extends Characters {
  private String[] dialogue;
  
  public NPC(String name, PVector position_, String[] dialogueTree_) {
    super(name, 20, 20, null, position_, true);
    dialogue = dialogueTree_;
  }
  
  public void display(){
    float x = position.x;
    float y = position.y;
    fill(248, 252, 119);
    rect(x - 30, y - 30, 30, 30);
    noFill();
  }
  
}
