public void duringTheGame()
{
  if (resetLevel)
  {
    theShip.setX(512);
    theShip.setY(450);
    theShip.setDirectionX(0);
    theShip.setDirectionY(0);
    theShip.setFuel(100);
    theShip.setHealth(100);
    theShip.setCannonHeat(100);
    wPressed = false;
    aPressed = false;
    dPressed = false;
    sPressed = false;
    spacePressed = false;
    jPressed = false;
    pPressed = false;
    mouseState = false;
    rPressed = false;
    resetLevel = false;
    speed = 0;
    nextShield = 0;
    theShip.setShield(3);
    while(enemyBullet.size() > 0)
    {
      enemyBullet.remove(0);
    }
    while(shipBullet.size() > 0)
    {
      shipBullet.remove(0);
    }
    while(theEnemies.size() > 0)
    {
      theEnemies.remove(0);
    }
    score = 0;
    badStation.setHealth(20);
    station2.setHealth(20);
    station3.setHealth(20);
    if (levels == 3)
    {
      for (int i = 0; i < 10; i++)
      {
        theEnemies.add(new EnemyShip((int) (Math.random() * 500 + mapWidth - 725), (int) (Math.random() * 500 + mapHeight - 725)));
      }
      for (int i = 0; i < 10; i++)
      {
        theEnemies.add(new EnemyShip((int) (Math.random() * 500 + mapWidth - 725), (int) (Math.random() * 500 + 250)));
      }
      for (int i = 0; i < 10; i++)
      {
        theEnemies.add(new EnemyShip((int) (Math.random() * 500 + 250), (int) (Math.random() * 500 + mapHeight - 725)));
      }
    }
  }
  textSize(20);
  playerstats.show();
  playerstats.updateStats();
  duringGame();
  theShip.changeHealth();
  fill(0);
  strokeWeight(1);
  if (wPressed == true)
  {
    theShip.accelerate(.3);
    /*if (Math.sqrt(theShip.getDirectionX() * theShip.getDirectionX() + theShip.getDirectionY() * theShip.getDirectionY()) > 10)
    {
      theShip.accelerate(-.3);
    }*/
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
  if (rPressed == true)
  {
    theShip.highperspace();
    theCamera.teleport();
  }
  if (spacePressed == true)
  { 
    if (theShip.getShotTime() == 0)
    {
      if (playerstats.getOverheat() == false)
      {
        shipBullet.add(new Bullet(theShip, 0, 255, 255));
        theShip.setCannonHeat(theShip.getCannonHeat() + 1);
        theShip.setShotTime(3);
      }
    } 
    else
    {
    }
  }
  goodStation.show();
  goodStation.editDistance();
  if (goodStation.getDistance() < 250)
  {
    if (theShip.getHealth() < 95)
    {
      theShip.setHealth(theShip.getHealth() + 0.2);
    }
    if (theShip.getFuel() < 95)
    {
      theShip.setFuel(theShip.getFuel() + 0.2);
    }
  }
  if (oneStation)
  {
    badStation.show();
    badStation.editDistance();
    if (badStation.getDistance() < 250)
    {
      theShip.setHealth(theShip.getHealth() - 0.5);
    }
  }
  if (moreStation)
  {
    station2.show();
    station3.show();
    station2.editDistance();
    station3.editDistance();
    if (station2.getDistance() < 250)
    {
      theShip.setHealth(theShip.getHealth() - 0.5);
    }
    if (station3.getDistance() < 250)
    {
      theShip.setHealth(theShip.getHealth() - 0.5);
    }
  }
  theShip.show();
  theShip.move();
  for (int j = 0; j < theEnemies.size(); j++)
  {
    theEnemies.get(j).setPreviousDirection(theEnemies.get(j).getPointDirection());
    theEnemies.get(j).show();
    theEnemies.get(j).track();
    theEnemies.get(j).move();
  }
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
    } else if (shipBullet.get(c).getX() < 0)
    {
      shipBullet.remove(c);
    } else if (shipBullet.get(c).getY() > mapHeight)
    {
      shipBullet.remove(c);
    } else if (shipBullet.get(c).getY() < 0)
    {
      shipBullet.remove(c);
    }
  }
  for (int i = 0; i < theEnemies.size(); i++)
  {
    for (int g = 0; g < shipBullet.size(); g++)
    {
      if (dist(theEnemies.get(i).getX(), theEnemies.get(i).getY(), shipBullet.get(g).getX(), shipBullet.get(g).getY()) < 20)
      {
        theEnemies.get(i).setHealth(theEnemies.get(i).getHealth() - 5);
        if (theEnemies.get(i).getHealth() < 0)
        {
          theEnemies.remove(i);
          score++;
          break;
        }
      }
    }
  }
  for (int u = 0; u < theAsteroids.size(); u++)
  {
    theAsteroids.get(u).show();
    theAsteroids.get(u).move();
  }
  //detects if ship hit asteroids
  for (int q = 0; q < theAsteroids.size(); q++)
  {
    if (dist(theShip.getX(), theShip.getY(), theAsteroids.get(q).getX(), theAsteroids.get(q).getY()) < 30)
    {
      theAsteroids.remove(q);
      if (theShip.getShield() == 0)
      {
        theShip.setHealth((theShip.getHealth() - Math.sqrt(theShip.getDirectionX() * theShip.getDirectionX() + theShip.getDirectionY() * theShip.getDirectionY())));
      }
      else
      {
        theShip.setShield(theShip.getShield() - 1);
      }
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
        n--;
        g--;
        break;
      }
    }
  }
  if (wPressed == true || sPressed == true)
  {
    if (theShip.getFuel() > 0)
    {
      theShip.setFuel(theShip.getFuel() - 0.03);
    }
  }
  if (theShip.getHealth() < 0)
  {
    levels = 10;
  }
  for (int xy = 0; xy < enemyBullet.size(); xy++)
  {
    enemyBullet.get(xy).show();
    enemyBullet.get(xy).move();
    if (enemyBullet.get(xy).getX() > mapWidth)
    {
      enemyBullet.remove(xy);
      xy--;
    } else if (enemyBullet.get(xy).getX() < 0)
    {
      enemyBullet.remove(xy);
      xy--;
    } else if (enemyBullet.get(xy).getY() > mapHeight)
    {
      enemyBullet.remove(xy);
      xy--;
    } else if (enemyBullet.get(xy).getY() < 0)
    {
      enemyBullet.remove(xy);
      xy--;
    } else if (dist(theShip.getX(), theShip.getY(), enemyBullet.get(xy).getX(), enemyBullet.get(xy).getY()) < 10)
    {
      enemyBullet.remove(xy);
      theShip.setHealth(theShip.getHealth() - 0.7);
      xy--;
    }
  }
  //moves enemy ship toward theShip
  for (int t = 0; t < theEnemies.size(); t++)
  {
    { 
      if (theEnemies.get(t).getDistance() > 500)
      {
        theEnemies.get(t).accelerate(0.3);
      }
      else
      {
        if (theEnemies.get(t).getShotTime() == 0)
        {
          enemyBullet.add(new Bullet(theEnemies.get(t), 0, 204, 0));
          theEnemies.get(t).setShotTime(3);
        }
        theEnemies.get(t).accelerate(0.1);
      }
      for (int z = 0; z < theEnemies.size(); z++)
      {
        if (t != z)
        {
          if (theEnemies.get(t).getX() == theEnemies.get(z).getX() && theEnemies.get(t).getY() == theEnemies.get(z).getY())
          {
            theEnemies.get(t).setX((int) (theEnemies.get(t).getX() + (Math.random() * 50 - 25)));
            theEnemies.get(t).setY((int) (theEnemies.get(t).getY() + (Math.random() * 50 - 25)));
          }
        }
      }
    }
  }
  if (pPressed == true)
  {
    //pause
    pPressed = false;
    levels = 12;
  }
  nextShield ++;
  if (nextShield % 3000 == 0)
  {
    if (theShip.getShield() != 3)
    {
      theShip.setShield(theShip.getShield() + 1);
    }
  }
}