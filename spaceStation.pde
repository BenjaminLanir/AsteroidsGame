class SpaceStation
{
	private boolean good;
	private int myColor;
	private int myX, myY;
	private double shipDistance;
	public SpaceStation(boolean side)
	{
		good = side;
		if (side == true)
		{
			myColor = color(0, 0, 255);
			myX = 450;
			myY = 450;
		}
		else
		{
			myColor = color(255, 0, 0);
			myX = mapWidth - 450;
			myY = mapHeight - 450;
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
	}
	public void editDistance()
	{
		shipDistance = dist(theShip.getX(), theShip.getY(), myX, myY);
	}
	public void setDistance(double a)
	{
		shipDistance = a;
	}
	public double getDistance() {return shipDistance;}
}