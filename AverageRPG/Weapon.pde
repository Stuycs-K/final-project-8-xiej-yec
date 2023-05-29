public class Weapon{
  private String name;
  private int dmg;
  
  public Weapon(String name, int dmg){
    this.name = name;
    this.dmg = dmg;
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
    float speed = 10; //SPEED OF BULLET, I SHOULD PROBABLY MAKE THIS AN INSTANCE VARIABLE FOR BULLET CLASS

    
    PVector direction = PVector.sub(destination, origin);
    direction.normalize();
    
    direction.mult(speed);
    
    return new Bullet(origin.x, origin.y, direction.x, direction.y, this, radius);
    
  }
    
  
}
