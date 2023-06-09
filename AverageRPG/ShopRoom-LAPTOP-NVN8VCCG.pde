public class ShopRoom extends Room{
  private ArrayList<Gun> items;
  private String[] dialogue;
  float triangleOffset;
  boolean triangleDirection = true;
  int buyCooldown = 0;
  
  public ShopRoom(){
    super();
    super.name =  "Shop Room";    
    dialogue= new String[]{"What would you like to buy?", //0
      "The Standard Gun has 50 bullets in a mag and does 3 damage per bullet. However, it has a slow fire rate\nCOST: 20          PRESS [E] TO BUY", //1
      "The Good Gun also has 50 bullets in a mag but does 10 damage per bullet. It has a medium fire rate\nCOST: 50          PRESS [E] TO BUY", //2
      "The Machine Gun has a total of 200 bulls in a mag but does 2 damage per bullet. \n It doesn't even matter because it has a high fire rate!\nCOST: 100          PRESS [E] TO BUY" //3
    };
    NPC merchant = new NPC("Merchant", new PVector(500, 800), dialogue);
   //cost depends on how many coins enemies drop
   
   //Standard Gun: does 3 dmg per bullet and has 50 bullets in a mag
   //slow fire rate
   Gun standardGun = new Gun("Standard Gun", 2, 50 , 20, 6, true);
   
   //Good Gun: 10 dmg per bullet and has 50 bullets in a mag
   //med fire rate
   Gun goodGun = new Gun("Good Gun", 10, 50, 50, 7, true);
   
   //Machine Gun: 2 dmg per bullet but has 200 bullets in a mag
   //high fire rate
   Gun machineGun = new Gun("Machine Gun", 2, 200, 100, 10, true);
     
   items= new ArrayList<Gun>();
   items.add(standardGun);
   items.add(goodGun);
   items.add(machineGun);
  }
  
  public void displayRoom() {
    super.displayRoom();
    displayItems();
    
    fill(0,255,0);
    rect(800, 400, 5, 200);
    if (triangleOffset + 830 >= 840) {
      triangleDirection = false;
    }
    else if (triangleOffset + 830 <= 820) {
      triangleDirection = true;
    }
    if (triangleDirection) {
      triangleOffset += .5;
    }
    else {
      triangleOffset -= .5;
    }
    triangle(830 + triangleOffset, 500, 850 + triangleOffset, 450, 850 + triangleOffset, 550);
    noFill();
    
    nextRoom(790, 600, 400, new CombatRoom((int)(random(2, 5))));
  }
  
  public void displayDialogue(String words){
    text(words, 250, 700);
  }
  
  public String checkStandardStats(){
    return dialogue[1];
  }
  
  public String checkGoodStats(){
    return dialogue[2];
  }
  
  public String checkMachineStats(){
    return dialogue[3];
  }
  
  public void displayItems(){
    buyCooldown ++;
      fill(255,255,0);
      rect(250, 800, 100, 25);
      rect(450, 800, 100, 25);
      rect(650, 800, 100, 25);
      fill(0);
      text("Standard Gun", 260, 815);
      text("Good Gun", 465, 815);
      text("Machine Gun", 660, 815);
      
      if (triangleOffset + 830 >= 840) {
        triangleDirection = false;
      }
      else if (triangleOffset + 830 <= 820) {
        triangleDirection = true;
      }
      if (triangleDirection) {
        triangleOffset += .5;
      }
      else {
        triangleOffset -= .5;
      }
      
      //right triangle
      triangle(300 , 850 + triangleOffset, 250, 900 + triangleOffset, 350, 900 + triangleOffset);
      
      // middle triangle
      triangle(500, 850 + triangleOffset, 450, 900 + triangleOffset, 550, 900 + triangleOffset);
      
      // left triangle
      triangle(700, 850 + triangleOffset, 650, 900 + triangleOffset, 750, 900 + triangleOffset);
      
      //check right
      if (player.getYPos() >= 790 & player.getXPos() >= 250 & player.getXPos() <= 350) {
        fill(0);
        displayDialogue(dialogue[1]);
        
        if ((key == 'e' || key == 'E') & player.getCoins() >= 20 & buyCooldown > 50) {
          player.setGun(items.get(0));
          player.addCoins(-20);
          buyCooldown = 0;
          AverageRPG.shootCooldownMax = 12;
        }
      }
      
      //check middle
      if (player.getYPos() >= 790 & player.getXPos() >= 450 & player.getXPos() <= 550) {
        fill(0);
        displayDialogue(dialogue[2]);
        if ((key == 'e' || key == 'E') & player.getCoins() >= 50 & buyCooldown > 50) {
          player.setGun(items.get(1));
          player.addCoins(-50);
          buyCooldown = 0;
          AverageRPG.shootCooldownMax = 10;
        }
      }
      
      //check left
      if (player.getYPos() >= 790 & player.getXPos() >= 650 & player.getXPos() <= 750) {
        fill(0);
        displayDialogue(dialogue[3]);
        
        if ((key == 'e' || key == 'E') & player.getCoins() >= 100 & buyCooldown > 50) {
          player.setGun(items.get(2));
          player.addCoins(-100);
          buyCooldown = 0;
          AverageRPG.shootCooldownMax = 1;
        }
      }
    }
  
  
  
  
}
