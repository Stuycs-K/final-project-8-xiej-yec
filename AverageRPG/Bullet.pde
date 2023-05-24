public class Bullet{  
  PVector position, velocity;
  private Gun gun;
  private int dmg;
  private float radius;
  //private int accel;
  
  //add acceleration if there's time
  public Bullet(float x, float y, float xSpeed, float ySpeed, Gun gun, float radius){
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    this.gun = gun;
    dmg = gun.getDmg();
    this.radius = radius;
    //this.accel = accel;
  }

  public void displayBullet() {
    float x = position.x;
    float y = position.y;
    circle(x, y, radius*2);
  }
  
  
  //public void setSpeed(int newSpd){
  //  speed = newSpd;
  //}
  
  // public int getSpeed(){
  //   return speed;
  // }
   
   public void doDmg(Character chara){
     //check math for position
     //if (position.x < chara.position.x - radius || position.x > chara.position.x + radius) && (position.y < chara.position.y - radius || position.y > chara.position.y + radius){
     //  chara.getHp() - dmg;
     //}
   }
   
}
