public class EnemyGrunt extends Characters {
  public EnemyGrunt(String name_, int maxHP_, int HP_, Weapon weapon, PVector position_) {
    super(name_, maxHP_, HP_, weapon, position_, false);
  }
  
    public void displayEnemy() { 
    float x = position.x;
    float y = position.y;
    triangle(x, y, x + 10, y, x + 5, y + 5);
  }
}
