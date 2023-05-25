public class EnemyGrunt extends Characters {
  public EnemyGrunt(String name_, int maxHP_, int HP_, Weapon weapon, PVector position_) {
    super(name_, maxHP_, HP_, weapon, position_, false);
  }
  
    public void displayCharacter() { //include health bar and sprites
    float x = position.x;
    float y = position.y;
    circle(x, y, 20);
  }
}
