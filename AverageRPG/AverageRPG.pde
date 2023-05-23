//ArrayList<Weapon> weaponList = new ArrayList<Weapon>();
//Weapon fist = new Weapon("fist", 5, .1);
//weaponList.add(fist);
  
  

Characters player = new Characters("John", 20, 20, new Weapon("fist", 5, .01), new PVector(0, 0), true);

void setup() {
  size(1000, 1000);
}



void draw() {
  player.displayCharacter();
}
