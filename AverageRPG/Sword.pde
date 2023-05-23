public class Sword extends Weapon{
  private int durability;

  //TODO: Might update rarity feature
  public Sword(String name, int dmg, double rarity, int durability){
    super(name, dmg, rarity);
    this.durability = durability;
  }
}
