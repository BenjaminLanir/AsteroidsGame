class EnemyShip extends SpaceShip
{
  public double previousDirection;
  public EnemyShip(int myX, int myY)
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
    myColor = 255;
    myCenterX = myX;
    myCenterY = myY;
    health = 100;
    cannonHeat = 0;
    myColor = color(255, 0, 0);
    previousDirection = 0;
    shotTime = 0;
  }
  public void setPreviousDirection(double i)
  {
      previousDirection = i;
  }
  public double getPreviousDirection(){return previousDirection;}
  public void track()
  {
    if (theShip.getX() < myCenterX)
    {
        myPointDirection = 180 + Math.atan((theShip.getY() - myCenterY) / (theShip.getX() - myCenterX)) / (Math.PI/180);
    }
    else
    {
    	myPointDirection = Math.atan((theShip.getY() - myCenterY) / (theShip.getX() - myCenterX)) / (Math.PI/180);
    }
  }
  public double getDistance()
  {
    double distance = dist(theShip.getX(), theShip.getY(), (float)myCenterX, (float)myCenterY);
    return distance;
  }
  public void move()
  {
    if (myDirectionX > 10)
    {
      myDirectionX = myDirectionX - 0.3;
    }
    if (myDirectionY > 10)
    {
      myDirectionY = myDirectionY - 0.3;
    }
    if (myDirectionX < -10)
    {
      myDirectionX = myDirectionX + 0.3;
    }
    if (myDirectionY < -10)
    {
      myDirectionY = myDirectionY + 0.3;
    }
      myCenterX += myDirectionX;    
      myCenterY += myDirectionY;
    //super.move();
    if (shotTime != 0)
    {
      shotTime--;
    }
  }
  public void show()
  {
    strokeWeight(5);
    stroke(255);
    rect((float) myCenterX - 5, (float) myCenterY - 20, 20, 5);
    strokeWeight(2);
    fill(255, 0, 0);
    stroke(255, 0, 0);
    rect((float) myCenterX - 4.5, (float) myCenterY - 20, (float) health/100 * 18, 4);
    strokeWeight(0);
    super.show();
  }
}