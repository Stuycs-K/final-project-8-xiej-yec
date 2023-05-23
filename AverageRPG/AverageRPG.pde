ArrayList<Weapon> weaponList = new ArrayList<Weapon>(3);
weaponList.add(new Weapon("fist", 5, .01));
  
Player player = new Player(weaponList, new PVector(0, 0));

void setup() {
  size(1000, 1000);
  

}

void draw() {
  player.displayCharacter();
}
