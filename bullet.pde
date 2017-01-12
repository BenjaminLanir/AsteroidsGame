class Bullet extends Floater
{
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
	Bullet(SpaceShip ship, int red, int green, int blue)
	{
		myCenterX = ship.getX();
		myCenterY = ship.getY();
		myPointDirection = ship.getPointDirection();
		double dRadians = myPointDirection*(Math.PI/180);
		myDirectionX = 5 * Math.cos(dRadians) + theShip.getDirectionX();
		myDirectionY = 5 * Math.sin(dRadians) + theShip.getDirectionY();
		myColor = color(red, green, blue);
	}
	void show()
	{
		fill(myColor);
		stroke(0, 0, 0, 0);
		ellipse((float) myCenterX, (float) myCenterY, 6, 6);
	}
	void move()
	{
	  myCenterX += myDirectionX;    
      myCenterY += myDirectionY;
	}
}