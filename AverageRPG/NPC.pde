public class NPC extends Characters {
  private String[] dialogue;
  
  public NPC(String name, PVector position_, String[] dialogueTree_) {
    super(name, 20, 20, null, position_, true);
    dialogue = dialogueTree_;
  }
  
  //void talk(Player player) { // display an element from dialogue when player is nearby
    
  //}
}
