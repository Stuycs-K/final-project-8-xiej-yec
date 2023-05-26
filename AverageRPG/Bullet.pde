public class Bullet{  
  private PVector position, velocity;
  private Weapon gun;
  private int dmg;
  private float radius;
  //private int accel;
  
  //add acceleration if there's time
  public Bullet(float x, float y, float xSpeed, float ySpeed, Weapon gun, float radius){
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
   
   public boolean doDmg(Characters chara){
     //check math for position
     if (position.dist(chara.getPosition()) < chara.getHitbox()) { // 
       return true;
     }
     return false;
     //if (position.x < chara.position.x - radius || position.x > chara.position.x + radius) && (position.y < chara.position.y - radius || position.y > chara.position.y + radius){
     //  chara.getHp() - dmg;
     //}
   }
   
   
   public void move() {
     position.add(velocity);
     //if (position.x > 1000 || position.x < 0 || position.y > 1000 || position.y < 0) {
     //  velocity = new PVector(0, 0);
     //}
   }
   public PVector getPosition() {
     return position;
   }
}
