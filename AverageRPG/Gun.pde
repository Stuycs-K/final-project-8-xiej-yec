public class Gun extends Weapon{
  private int currentBulletCount;
  private int totalBulletCount;

  //TODO: Update when you make bullet
  public Gun(String name, int dmg, int totalBulletCount, int speed){
    super(name, dmg, speed);
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
  public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
    if (currentBulletCount == 0) {
      reload();
      //return null;
    }
    else if (currentBulletCount > 0) {
      currentBulletCount --;
    }
    return super.spawnBullet(origin, destination, radius);
  }
  
  //public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
  //  PVector direction = PVector.sub(destination, origin);
  //  direction.normalize();
  //  return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  //}
  
}
