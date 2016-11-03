SpaceShip theShip;
Star [] stars;
Camera theCamera;
int mapHeight = 5000;
int mapWidth = 5000;
Stats playerstats;
//Asteroid [] theAsteroids;
ArrayList <Asteroid> theAsteroids;
//your variable declarations here
public void setup() 
{
  //your code here
  theCamera = new Camera();
  theShip = new SpaceShip();
  playerstats = new Stats();
  size(1024, 900);
  stars = new Star[(int) (Math.random() * 3000 + 500)];
  theAsteroids = new ArrayList <Asteroid>();
  for (int q = 0; q < 100; q++)
  {
    theAsteroids.add(new Asteroid());
    theAsteroids.get(q).setPointDirection((int) (Math.random() * 360));
    theAsteroids.get(q).accelerate(Math.random() * 10 - 5);
  }
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}
public void draw() 
{
  //your code here
  background(255, 0, 0);
  fill(0);
  rect(0, 0, mapHeight, mapWidth);
  playerstats.show();
  duringGame();
  theShip.show();
  theShip.move();
  for (int j = 0; j < stars.length; j++)
  {
    stars[j].show();
  }
  for (int u = 0; u < 100; u++)
  {
    theAsteroids.get(u).show();
    theAsteroids.get(u).move();
  }
}
class Star
{
  private int myX, myY; //numStars;
  //int [] starX;
  //int [] starY;
  public Star()
  {
    myX = (int) (Math.random() * 5000);
    myY = (int) (Math.random() * 5000);
    /*numStars = (int) (Math.random() * 200);
    starX = new int[numStars];
    starY = new int[numStars];
    for (int w = 0; w < numStars; w++)
    {
      starX[w] = (int) (Math.random() * 1024);
      starY[w] = (int) (Math.random() * 900);
    }*/
  }
  public void show()
  {
    fill(255, 255, 0);
    ellipse(myX, myY, 10, 10);
  }
}
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
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
public void keyPressed()
{
  if (key == 'w')
  {
    theShip.accelerate(.3);
  }
  if (key == 's')
  {
    theShip.accelerate(-.3);
  }
  if (key == 'd')
  {
    theShip.rotate(5);
  }
  if (key == 'a')
  {
    theShip.rotate(-5);
  }
  if (key == 'j')
  {
    theShip.highperspace();
  }
}
public void duringGame()
{
  translate(-theCamera.position.x, -theCamera.position.y);
  theCamera.move();
}