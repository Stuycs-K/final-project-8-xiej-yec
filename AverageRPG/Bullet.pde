public class Bullet{  
  Pvector position, velocity
  private Gun gun;
  private int dmg;
  private float radius;
  //private int accel;
  
  //add acceleration if there's time
  public Bullet(float x, float y, float xSpeed, float ySpeed, Gun gun, float radius){
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    this.gun = gun;
    dmg = gun.getDmg;
    this.radius = radius;
    //this.accel = accel;
  }
 
  //public void setSpeed(int newSpd){
  //  speed = newSpd;
  //}
  
  // public int getSpeed(){
  //   return speed;
  // }
   
   public void doDmg(Character char){
     //check math for position
     if (position.x < char.position.x - radius || position.x > char.position.x + radius) && (position.y < char.position.y - radius || position.y > char.position.y + radius){
       char.getHp() - dmg;
     }
   }
   
}
