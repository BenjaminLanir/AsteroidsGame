class Stats
{
  private boolean overheat;
  private double statHealth, statOverheat, statFuel;
  public Stats()
  {
    statHealth = theShip.getHealth();
    statOverheat = theShip.getCannonHeat();
    statFuel = theShip.getFuel();
    overheat = false;
  }
  public void show()
  {
    fill(100, 100, 100, 122);
    stroke(100, 100, 100, 122);
    rect(800, 0, 224, 900);
    fill(255, 0, 0, 255);
    stroke(255, 0, 0, 255);
    rect(850, 300, (float) statHealth * 1.24, 17);
    fill(0, 0, 255, 255);
    stroke(0, 0, 255, 255);
    rect(850, 400, (float) statFuel * 1.24, 17);
    fill(0, 255, 0, 255);
    stroke(0, 255, 0, 255);
    rect(850, 500, (float) statOverheat * 1.24, 17);
    fill(0, 255, 255, 255);
    rect(850, 600, (float) theShip.getShield() * 124/3, 17);
    fill(255);
    stroke(255);
    textAlign(LEFT);
    text("Health", 880, 350);
    text("Fuel", 895, 450);
    text("Cannon Heat", 850, 550);
    text("Shield Level", 850, 650);
    fill(0, 0, 0, 0);
    stroke(0);
    strokeWeight(5);
    rect(850, 300, 124, 17);
    rect(850, 400, 124, 17);
    rect(850, 500, 124, 17);
    rect(850, 600, 124, 17);
    rect(850 + 121/3, 600, 2, 17);
    rect(850 + 245/3, 600, 2, 17);
    //miniMap
    fill(0, 0, 0, 255);
    rect(810, 10, 204, 204);
    //scale everything
    fill(0, 0, 255);
    strokeWeight(0);
    rect(theShip.getX() / (mapWidth / 204.0) + 810.0, theShip.getY() / (mapHeight / 204.0) + 10.0, 5, 5);
    fill(255, 0, 0);
    for (int i = 0; i < theAsteroids.size(); i++)
    {
      fill(122, 50, 10);
      strokeWeight(0);
      rect(theAsteroids.get(i).getX() / (mapWidth / 204.0) + 810.0, theAsteroids.get(i).getY() / (mapHeight / 194.0) + 10, 5, 5);
    }
    for (int j = 0; j < theEnemies.size(); j++)
    {
      fill(255, 0, 0);
      rect(theEnemies.get(j).getX() / (mapWidth / 204.0) + 810, theEnemies.get(j).getY() / (mapHeight / 204.0) + 10.0, 5, 5);
    }
  }
  public void updateStats()
  {
    statHealth = theShip.getHealth();
    statOverheat = theShip.getCannonHeat();
    statFuel = theShip.getFuel();
  }
  public boolean getOverheat(){return overheat;}
  public void cannonOverheat()
  {
    if (theShip.getCannonHeat() > 100)
    {
      overheat = true;
    }   
    if (theShip.getCannonHeat() == 0)
    {
      overheat = false;
    }
  }
}