class EnemyShip extends SpaceShip
{
	public void EnemyShip()
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
      myCenterX = 512;
      myCenterY = 450;
      health = 100;
      cannonHeat = 0;
	}
	public void track()
	{
	    myPointDirection = Math.atan((theShip.getY() - myCenterY) / (theShip.getX() - myCenterX));
	}
}