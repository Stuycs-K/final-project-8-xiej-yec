public class Weapon{
  private String name;
  private int dmg;
  private int speedBullets;
  private double rarity;
  private int cost;

  public Weapon(String name, int dmg, int speed, int cost){
    this.name = name;
    this.dmg = dmg;
    speedBullets = speed;
    this.cost = cost;
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
  
  public Bullet spawnBullet(PVector origin, PVector destination, float radius) {
    float speed = speedBullets; //SPEED OF BULLET, I SHOULD PROBABLY MAKE THIS AN INSTANCE VARIABLE FOR BULLET CLASS

    
    PVector direction = PVector.sub(destination, origin);
    direction.normalize();
    
    direction.mult(speed);
    
    return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  }
    
  
}
