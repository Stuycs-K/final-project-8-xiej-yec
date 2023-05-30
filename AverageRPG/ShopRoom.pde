public class ShopRoom extends Room{
  private ArrayList<Weapon> items;
  
  public ShopRoom(){
    super.name =  "Shop Room";
    String [] dialogue= new String[]{"What would you like to buy?"};
    NPC merchant = new NPC("Merchant", new PVector(500, 800), dialogue);
  }
  
  //should it display the name of items as words
  //maybe when items are clicked, the details are displayed?
}
