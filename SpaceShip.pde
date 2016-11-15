class SpaceShip extends Floater  
{   
  protected double health;
  protected double cannonHeat;
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
    }
    public void highperspace()
    {
      myCenterX = (int) (Math.random() * 1024);
      myCenterY = (int) (Math.random() * 900);
      myPointDirection = (int) (Math.random() * 360);
      myDirectionX = 0;
      myDirectionY = 0;
    }
    public void move()
    {
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY; 
    }
    public void changeHealth()
    {
      if(myCenterX < 0)
      {
        health = health - Math.abs(myDirectionX);
        myCenterX = 1;
        myDirectionX = (-1/2) * myDirectionX;
        theCamera.teleport();
        myDirectionX = 0;
      }
      else if(myCenterX > mapWidth)
      {
        health = health - Math.abs(myDirectionX);
        myCenterX = mapWidth - 1;
        myDirectionX = (-1/2) * myDirectionX;
        theCamera.teleport();
        myDirectionX = 0;
      }
      else if(myCenterY < 0)
      {
        health = health - Math.abs(myDirectionY);
        myCenterY = 1;
        myDirectionY = (-1/2) * myDirectionY;
        theCamera.teleport();
        myDirectionY = 0;
      }
      else if(myCenterY > mapHeight)
      {
        health = health - Math.abs(myDirectionY);
        myCenterY = mapHeight - 1;
        myDirectionY = (-1/2) * myDirectionY;
        theCamera.teleport();
        myDirectionY = 0;
      }
      else
      {}
    }
}