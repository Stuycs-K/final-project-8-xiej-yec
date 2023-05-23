public class Bullet{
  private PVector pos;
  private int speed;
  //private int accel;
  
  //add acceleration if there's time
  public Bullet(PVector pos, int speed){
    this.pos = pos;
    this.speed = speed;
    //this.accel = accel;
  }
  
  public void setSpeed(int newSpd){
    speed = newSpd;
  }
  
   public int getSpeed(){
     return speed;
   }
   
}
