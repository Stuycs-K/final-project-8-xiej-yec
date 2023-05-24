public class Bullet{  
  Pvector position, velocity, acceleration
  private Gun gun;
  private int dmg;
  private float radius;

  public Bullet(float x, float y, float xSpeed, float ySpeed, Gun gun, float radius){
    position = new PVector(x, y);
    velocity = new PVector(xSpeed, ySpeed);
    acceleration = new PVector(0, 0);
    this.gun = gun;
    dmg = gun.getDmg;
    this.radius = radius;
    //this.accel = accel;
  }
  
  public void displayBullet() {
    int x = position.x;
    int y = position.y;
    circle(x, y, raidus*2);
  }
  
  
  //public void setSpeed(int newSpd){
  //  speed = newSpd;
  //}
  
  // public int getSpeed(){
  //   return speed;
  // }
   
   public void doDmg(Character char){
     //check math for position
     if (position.x >= char.position.x - radius || position.x <= char.position.x + radius) && (position.y >= char.position.y - radius || position.y <= char.position.y + radius){
       char.getHp() -= dmg;
     }
   }
   
   public void move(){
    velocity.add(acceleration);
    position.add(velocity);
    acceleration.set(0, 0);
   }
   
}
