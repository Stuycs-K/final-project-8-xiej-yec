public class Sword extends Weapon{
  private int durability;

  //TODO: Might update rarity feature
  public Sword(String name, int dmg, int durability){
    super(name, dmg);
    this.durability = durability;
  }
}
