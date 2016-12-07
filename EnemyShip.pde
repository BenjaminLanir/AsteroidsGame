class EnemyShip extends SpaceShip
{
  public double previousDirection;
  public EnemyShip()
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
    myCenterX = Math.random() * 500 + mapWidth - 725;
    myCenterY = Math.random() * 500 + mapHeight - 725;
    health = 100;
    cannonHeat = 0;
    myColor = color(255, 0, 0);
    previousDirection = 0;
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
    //if (Math.abs(myDirectionX * myDirectionX + myDirectionY * myDirectionY) == 1)
    //{
      //myDirectionX --;
      //myDirectionY --;
      //accelerate(-.3);
    //}
    super.move();
  }
}