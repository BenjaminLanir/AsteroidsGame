public void duringTheGame()
{
	fill(0);
    rect(0, 0, mapHeight, mapWidth);
    playerstats.show();
    playerstats.updateStats();
    theShip.changeHealth();
    fill(0);
    strokeWeight(1);
    duringGame();
    if (wPressed == true)
    {
    	theShip.accelerate(.3);
    }
    if (aPressed == true)
    {
    	theShip.rotate(-5);
    }
    if (dPressed == true)
    {
    	theShip.rotate(5);
    }
    if (sPressed == true)
    {
    	theShip.accelerate(-.3);
    }
    if (jPressed == true)
    {
    	theShip.highperspace();
    	theCamera.teleport();
    }
    if (spacePressed == true)
    {
    	if (playerstats.getOverheat() == false)
        {
            shipBullet.add(new Bullet());
            theShip.setCannonHeat(theShip.getCannonHeat() + 1);
        }
        else
        {}
    }
    theShip.show();
    theShip.move();
    testEnemy.show();
    testEnemy.track();
    testEnemy.move();
    if (theShip.getCannonHeat() != 0)
    {
      theShip.setCannonHeat(theShip.getCannonHeat() - 0.5);
    }
    playerstats.cannonOverheat();
    for (int c = 0; c < shipBullet.size(); c++)
    {
      shipBullet.get(c).show();
      shipBullet.get(c).move();
      //removes bullets after leaving screen
      if (shipBullet.get(c).getX() > mapWidth)
      {
        shipBullet.remove(c);
      } 
      else if(shipBullet.get(c).getX() < 0)
      {
      shipBullet.remove(c);
      }
      else if(shipBullet.get(c).getY() > mapHeight)
      {
        shipBullet.remove(c);
      }
      else if(shipBullet.get(c).getY() < 0)
      {
        shipBullet.remove(c);
      }
    }
    for (int j = 0; j < stars.length; j++)
    {
      stars[j].show();
    }
    for (int u = 0; u < theAsteroids.size(); u++)
    {
      theAsteroids.get(u).show();
      theAsteroids.get(u).move();
    }
    //detects if ship hit asteroids
    for (int q = 0; q < theAsteroids.size(); q++)
    {
      if(dist(theShip.getX(), theShip.getY(), theAsteroids.get(q).getX(), theAsteroids.get(q).getY()) < 30)
      {
        theAsteroids.remove(q);
        theShip.setHealth(theShip.getHealth() - Math.sqrt(theShip.getDirectionX() * theShip.getDirectionX() + theShip.getDirectionY() * theShip.getDirectionY()));
      }
    }
    //detects if bullet hit asteroids3
    for (int g = 0; g < theAsteroids.size(); g++)
    {
      for (int n = 0; n <shipBullet.size(); n++)
      {
        if (dist(theAsteroids.get(g).getX(), theAsteroids.get(g).getY(), shipBullet.get(n).getX(), shipBullet.get(n).getY()) < 30)
        {
          theAsteroids.remove(g);
          shipBullet.remove(n);
        }
      }
    }
    if (wPressed == true || sPressed == true)
    {
      if (theShip.getFuel() != 0)
      {
        theShip.setFuel(theShip.getFuel() - 1);
      }
    }
    if (theShip.getHealth() < 0)
    {
      levels = 2;
    }
}