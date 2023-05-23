public class Gun extends Weapon{
  private Bullet bullet;
  private int currentBulletCount;
  private int totalBulletCount;

  //TODO: Update when you make bullet
  public Gun(String name, int dmg, double rarity, int totalBulletCount){
    super(name, dmg, rarity);
    Bullet bullet = new Bullet(new PVector(0, 0), 10);
    currentBulletCount = 0;
    this.totalBulletCount = totalBulletCount;
  }
  
  public void reload(){
   if (totalBulletCount == 0){
     currentBulletCount = totalBulletCount;
   }
  }
  
}
