public class Weapon{
  private String name;
  private int dmg;
  private double rarity;
  
  public Weapon(String name, int dmg, double rarity){
    this.name = name;
    this.dmg = dmg;
    this.rarity = rarity;
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
}
