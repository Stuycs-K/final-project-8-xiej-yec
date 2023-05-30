public class ShopRoom extends Room{
  private ArrayList<Weapon> items;
  
  public ShopRoom(){
    super.name =  "Shop Room";
    String [] dialogue= new String[]{"What would you like to buy?"};
    NPC merchant = new NPC("Merchant", new PVector(500, 800), dialogue);
  }
  
  //should it display the name of items as words
  //maybe when items are clicked, the details are displayed?
  
 public void makeWeapons(){
   //cost depends on how many coins enemies drop
   
   //Standard Gun: does 3 dmg per bullet and has 50 bullets in a mag
   //slow fire rate
   Gun standardGun = new Gun("Standard Gun", 2, 50 , 20);
   
   //Good Gun: 10 dmg per bullet and has 50 bullets in a mag
   //med fire rate
   Gun goodGun = new Gun("Good Gun", 10, 50, 50);
   
   //Machine Gun: 2 dmg per bullet but has 200 bullets in a mag
   //high fire rate
   Gun machineGun = new Gun("Machine Gun", 2, 200, 100);
 }
}
