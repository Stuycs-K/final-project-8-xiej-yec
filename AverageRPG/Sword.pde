public class Sword extends Weapon{
  private int durability;

  public Sword(String name, int dmg, double rarity, int durability){
    super(name, dmg, rarity);
    this.durability = durability;
  }
}
