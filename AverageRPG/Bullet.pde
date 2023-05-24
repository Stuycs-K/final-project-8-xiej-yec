public class Bullet{
  private PVector pos;
  private int speed;
  private Gun gun;
  private int dmg;
  private int radius;
  //private int accel;
  
  //add acceleration if there's time
  public Bullet(PVector pos, int speed, Gun gun, int radius){
    this.pos = pos;
    this.speed = speed;
    this.gun = gun;
    dmg = gun.getDmg;
    this.radius = radius;
    //this.accel = accel;
  }
  
  public void setSpeed(int newSpd){
    speed = newSpd;
  }
  
   public int getSpeed(){
     return speed;
   }
   
   
}
