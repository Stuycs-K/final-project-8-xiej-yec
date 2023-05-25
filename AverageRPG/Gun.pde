public class Gun extends Weapon{
  private int currentBulletCount;
  private int totalBulletCount;

  //TODO: Update when you make bullet
  public Gun(String name, int dmg, double rarity, int totalBulletCount){
    super(name, dmg, rarity);
    currentBulletCount = 0;
    this.totalBulletCount = totalBulletCount;
  }
  
  public void reload(){
   if (totalBulletCount == 0){
     currentBulletCount = totalBulletCount;
   }
  }
  
  //public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
  //  PVector direction = PVector.sub(destination, origin);
  //  direction.normalize();
  //  return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  //}
  
}
