public class NPC extends Characters {
  private String[] dialogue;
  
  public NPC(String name, PVector position_, String[] dialogueTree_) {
    super(name, 20, 20, null, position_, true);
    dialogue = dialogueTree_;
  }
  
  public void display() { 
    float x = position.x;
    float y = position.y;
    rect(x - 15, y - 15, 30, 30);   
  }
}
