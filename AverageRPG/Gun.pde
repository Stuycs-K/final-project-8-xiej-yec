public class Gun{
  private String name;
  private int dmg;
  private int speedBullets;
  private int cost;
  private boolean isFriendly;
  private int totalBulletCount;
  private int currentBulletCount;

  public Gun(String name, int dmg, int totalBulletCount, int cost, int speed, boolean isFriendly){
    this.name = name;
    this.dmg = dmg;
    speedBullets = speed;
    this.cost = cost;
    this.isFriendly = isFriendly;
    currentBulletCount = totalBulletCount;
    this.totalBulletCount = totalBulletCount;
  }

  public int getCurrentBulletCount(){
    return currentBulletCount;
  }
  public void reload(){
    AverageRPG.shootCooldown = -100;
    currentBulletCount = totalBulletCount;
  }
  public boolean getIsFriendly(){
    return isFriendly;
  }
  
  public int getDmg(){
    return dmg;
  }
  
  public String getName(){
    return name;
  }
  
  public int doDmg(Character charHP, Weapon weapon){
    return charHP - weapon.getDmg();
  }
  
  //public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
  //  float speed = speedBullets; //SPEED OF BULLET, I SHOULD PROBABLY MAKE THIS AN INSTANCE VARIABLE FOR BULLET CLASS

    
  //  PVector direction = PVector.sub(destination, origin);
  //  direction.normalize();
    
  //  direction.mult(speed);
    
  //  return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  //}
  
  public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
    if (currentBulletCount == 0) {
      reload();
      //return null;
    }
    else if (currentBulletCount > 0) {
      currentBulletCount --;
    }
    return spawnBullet(origin, destination, radius);
  }
  
  //public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
  //  PVector direction = PVector.sub(destination, origin);
  //  direction.normalize();
  //  return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  //}
  
}
