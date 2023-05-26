public class RestoreRoom extends Room{
  public RestoreRoom(){
    super.name =  "Restore Room";
  }
  
  public void restoreHP(Characters player){
    player.setHP(player.getMaxHP());
  }
}
