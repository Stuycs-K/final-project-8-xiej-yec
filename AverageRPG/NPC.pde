public class NPC extends Characters {
  private String[] dialogue;
  
  public NPC(String name, PVector position_, String[] dialogueTree_) {
    super(name, 20, 20, null, position_, true);
    dialogue = dialogueTree_;
  }
}
