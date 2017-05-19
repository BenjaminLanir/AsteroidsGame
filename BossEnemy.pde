class BossEnemy extends EnemyShip
{
	boolean finalBoss;
	public BossEnemy(int myX, int myY, boolean endGame)
  	{
  		super(myX, myY);
    	corners = 6;
    	xCorners = new int[corners];
    	yCorners = new int[corners];
    	xCorners[0] = -24;
    	yCorners[0] = 0;
    	xCorners[1] = -48;
    	yCorners[1] = -48;
    	xCorners[2] = 24;
    	yCorners[2] = -48;
    	xCorners[3] = 48;
    	yCorners[3] = 0;
    	xCorners[4] = 24;
    	yCorners[4] = 48;
    	xCorners[5] = -48;
    	yCorners[5] = 48;
    	myCenterX = myX;
    	myCenterY = myY;
    	health = 1000;
    	cannonHeat = 0;
    	myColor = color(255, 0, 0);
    	previousDirection = 0;
    	shotTime = 0;
    	finalBoss = endGame;
  	}
  	public void show()
  	{
    	fill(myColor);   
    	stroke(myColor);    
    	//convert degrees to radians for sin and cos         
    	double dRadians = myPointDirection*(Math.PI/180);                 
    	int xRotatedTranslated, yRotatedTranslated;    
    	beginShape();         
    	for(int nI = 0; nI < corners; nI++)    
    	{     
      	//rotate and translate the coordinates of the floater using current direction 
      	xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      	yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      	vertex(xRotatedTranslated,yRotatedTranslated);    
    	}   
    	endShape(CLOSE); 
  	}
}