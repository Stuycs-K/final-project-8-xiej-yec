public class CombatRoom extends Room{
  public CombatRoom(){
    super.name =  "Combat Room";
  }
  
  public void generateEnemies(int numOfEnemies){
    
    for (int i = 0 ; i < numOfEnemies; i++){
      //enemies have infintite bulets
      Gun gun = new Gun("standard", 10, 1000000000);
      EnemyGrunt newEnemy = new EnemyGrunt("basic", 100, 100, gun, new PVector(50, 10 + i * 10));
      newEnemey.display();
    }
  }
}
