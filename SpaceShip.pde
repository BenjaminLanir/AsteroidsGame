class SpaceShip extends Floater  
{   
  protected double health;
  protected double cannonHeat;
  protected double fuel;
  protected double shield;
  protected double shotTime;
  public void setX(int x)
  {
    myCenterX = x;
  }
  public int getX(){return (int) myCenterX;}
  public void setY(int y)
  {
    myCenterY = y;
  }
  public int getY(){return (int) myCenterY;}
  public void setDirectionX(double x)
  {
    myDirectionX = x;
  }
  public double getDirectionX(){return myDirectionX;}
  public void setDirectionY(double y)
  {
    myDirectionY = y;
  }
  public double getDirectionY(){return myDirectionY;}
  public void setPointDirection(int degrees)
  {
    myPointDirection = degrees;
  }
  public double getPointDirection(){return myPointDirection;}
  public void setHealth(double w)
  {
    health = w;
  }
  public double getHealth(){return health;}
  public void setCannonHeat(double c)
  {
    cannonHeat = c;
  }
  public double getCannonHeat(){return cannonHeat;}
  public void setFuel(double n)
  {
    fuel = n;
  }
  public double getFuel(){return fuel;}
  public void setShield(double g)
  {
    shield = g;
  }
  public double getShield(){return shield;}
  public void setShotTime(int shot)
  {
    shotTime = shot;
  }
  public double getShotTime(){return shotTime;}
  public SpaceShip()
    {
      corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = -8;
      yCorners[0] = -8;
      xCorners[1] = -2;
      yCorners[1] = 0;
      xCorners[2] = -8;
      yCorners[2] = 8;
      xCorners[3] = 16;
      yCorners[3] = 0;
      myColor = color(0, 0, 255);
      myCenterX = 512;
      myCenterY = 450;
      health = 100;
      cannonHeat = 0;
      fuel = 100;
      shield = 3;
      shotTime = 0;
    }
    public void highperspace()
    {
      /*myCenterX = (int) (Math.random() * mapWidth);
      myCenterY = (int) (Math.random() * mapHeight);
      myPointDirection = (int) (Math.random() * 360);
      myDirectionX = 0;
      myDirectionY = 0;*/
      myDirectionX = 0;
      myDirectionY = 0;
      accelerate(100);
    }
    public void move()
    {
      if (myDirectionX > 20)
      {
        myDirectionX = myDirectionX - 0.3;
      }
      if (myDirectionY > 20)
      {
        myDirectionY = myDirectionY - 0.3;
      }
      if (myDirectionX < -20)
      {
        myDirectionX = myDirectionX + 0.3;
      }
      if (myDirectionY < -20)
      {
        myDirectionY = myDirectionY + 0.3;
      }
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY; 
    }
    public void changeHealth()
    {
      if(myCenterX < 0)
      {
        health = health - Math.abs(myDirectionX)/2;
        myCenterX = 1;
        myDirectionX = (-1/2) * myDirectionX;
        theCamera.teleport();
        myDirectionX = 0;
      }
      else if(myCenterX > mapWidth)
      {
        health = health - Math.abs(myDirectionX)/2;
        myCenterX = mapWidth - 1;
        myDirectionX = (-1/2) * myDirectionX;
        theCamera.teleport();
        myDirectionX = 0;
      }
      else if(myCenterY < 0)
      {
        health = health - Math.abs(myDirectionY)/2;
        myCenterY = 1;
        myDirectionY = (-1/2) * myDirectionY;
        theCamera.teleport();
        myDirectionY = 0;
      }
      else if(myCenterY > mapHeight)
      {
        health = health - Math.abs(myDirectionY)/2;
        myCenterY = mapHeight - 1;
        myDirectionY = (-1/2) * myDirectionY;
        theCamera.teleport();
        myDirectionY = 0;
      }
      else
      {}
      if (shotTime != 0)
      {
        shotTime--;
      }
    }
}