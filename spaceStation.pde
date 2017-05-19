class SpaceStation
{
	private boolean good;
	private int myColor;
	private int myX, myY;
	private double shipDistance;
	private double stationHealth;
	private int nextEnemy;
	public SpaceStation(boolean side, int theX, int theY)
	{
		good = side;
		myX = theX;
		myY = theY;
		stationHealth = 20;
		if (side == true)
		{
			myColor = color(0, 0, 255);
		}
		else
		{
			myColor = color(255, 0, 0);
		}
		shipDistance = dist(theShip.getX(), theShip.getY(), myX, myY);
	}
	public void show()
	{
		noFill();
		strokeWeight(20);
		stroke(myColor);
		ellipse(myX, myY, 500, 500);
		strokeWeight(0);
		nextEnemy++;
		if (!good)
		{
			if (levels == 2 || levels > 3)
			{
				if (nextEnemy % 400 == 0)
				{
					if (theEnemies.size() < 30)
					{
						theEnemies.add(new EnemyShip((int) (Math.random() * 500 + myX - 250), (int) (Math.random() * 500 + myY -250)));
					}
				}
			}
		}
	}
	public void editDistance()
	{
		shipDistance = dist(theShip.getX(), theShip.getY(), myX, myY);
		if (!good)
		{
			int i = 0;
			while(i < shipBullet.size())
			{
				if (dist(myX, myY, shipBullet.get(i).getX(), shipBullet.get(i).getY()) < 250)
				{
					stationHealth = stationHealth - 0.5;
					shipBullet.remove(i);
				}
				else
				{
					i++;
				}
			}
		}
	}
	public void setDistance(double a)
	{
		shipDistance = a;
	}
	public double getDistance() {return shipDistance;}
	public void setHealth(double a)
	{
		stationHealth = a;
	}
	public double getHealth() {return stationHealth;}
}