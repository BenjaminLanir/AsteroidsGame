SpaceShip theShip;
Star [] stars;
//Asteroid [] theAsteroids;
ArrayList <Asteroid> theAsteroids;
//your variable declarations here
public void setup() 
{
  //your code here
  camera(100, 100, 0, 100, 100, 0, -1, 1, 1);
  theShip = new SpaceShip();
  size(1024, 900);
  stars = new Star[(int) (Math.random() * 150 + 50)];
  //theAsteroids = new Asteroid[10];
  theAsteroids = new ArrayList <Asteroid>();
  //Asteroids someAsteroid = new Asteroid();
  //theAsteroids.add(someAsteroid);
  //theAsteroids.add(new Asteroid());
  //theAsteroids.remove(1);
  /*for (int q = 0; q < theAsteroids.length; q++)
  {
    theAsteroids[q] = new Asteroid();
    theAsteroids[q].setPointDirection((int) (Math.random() * 360));
    theAsteroids[q].accelerate(Math.random() * 10 - 5);
  }*/
  for (int q = 0; q < 10; q++)
  {
    theAsteroids.add(new Asteroid());
    //theAsteroids(q).setPointDirection((int) (Math.random() * 360));
    //theAsteroids(q).accelerate(Math.random() * 10 - 5);
    theAsteroid set (q, Asteroid.setPointDirection((int) (Math.random() * 360)));
  }
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
}
public void draw() 
{
  //your code here
  background(0);
  theShip.show();
  theShip.move();
  for (int j = 0; j < stars.length; j++)
  {
    stars[j].show();
  }
  for (int u = 0; u < theAsteroids.length; u++)
  {
    theAsteroids[u].show();
    theAsteroids[u].move();
  }
}
class Star
{
  private int myX, myY; //numStars;
  //int [] starX;
  //int [] starY;
  public Star()
  {
    myX = (int) (Math.random() * 1024);
    myY = (int) (Math.random() * 900);
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
class SpaceShip extends Floater  
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
      myColor = 255;
      myCenterX = 512;
      myCenterY = 450;
    }
    public void highperspace()
    {
      myCenterX = (int) (Math.random() * 1024);
      myCenterY = (int) (Math.random() * 900);
      myPointDirection = (int) (Math.random() * 360);
      myDirectionX = 0;
      myDirectionY = 0;
    }
}
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
    myCenterX = (Math.random() * 1024);
    myCenterY = (Math.random() * 900);
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
    super.move();
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