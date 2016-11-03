class Asteroid extends Floater
{
    private int mySpinSpeed;
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
  public Asteroid()
  {
    corners = 5;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = (122);
    myCenterX = (Math.random() * 5000);
    myCenterY = (Math.random() * 5000);
    mySpinSpeed = (int) (Math.random() * 50 - 25);
    /*for (int w = 0; w < corners; w++)
    {
      xCorners[w] = 
      yCorners[w] = (int) (Math.random() * 100 - 50);
    }*/
    xCorners[0] = -27;
    xCorners[1] = -9;
    xCorners[2] = 18;
    xCorners[3] = 27;
    xCorners[4] = 18;
    yCorners[0] = -9;
    yCorners[1] = 18;
    yCorners[2] = 27;
    yCorners[3] = 9;
    yCorners[4] = -27;
  }
  public void move()
  {
    rotate(mySpinSpeed);
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;
    if(myCenterX > mapWidth)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = mapWidth;    
    }    
    if(myCenterY > mapHeight)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = mapHeight;    
    }   
  }
}