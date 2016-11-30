SpaceShip theShip;
int levels = 0;
Star [] stars;
Camera theCamera;
int mapHeight = 10000;
int mapWidth = 10000;
ArrayList <Bullet> shipBullet;
Stats playerstats;
Button playButton;
EnemyShip testEnemy;
//Asteroid [] theAsteroids;
ArrayList <Asteroid> theAsteroids;
boolean wPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean sPressed = false;
boolean spacePressed = false;
boolean jPressed = false;
double speed = 0;
//your variable declarations here
public void setup() 
{
  //your code here
  frameRate(60);
  theCamera = new Camera();
  theShip = new SpaceShip();
  playButton = new Button(124, 50, 450, 425, "Play");
  shipBullet = new ArrayList <Bullet>();
  playerstats = new Stats();
  testEnemy = new EnemyShip();
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
  background(0);
  //different levels
  if (levels == 0) //start screen
  {
    playButton.show();
    if (playButton.getPressed() == true)
    {
      levels = 1;
    }
  }
  else if (levels == 1) //in game
  {
    duringTheGame();
  }
  else if (levels == 2) //end game
  {
  }
    for (int j = 0; j < stars.length; j++)
    {
      stars[j].show();
    }
}
class Star
{
  private int myX, myY; //numStars;
  public Star()
  {
    myX = (int) (Math.random() * mapWidth);
    myY = (int) (Math.random() * mapHeight);
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
    stroke(0, 0, 0, 0);
    ellipse(myX, myY, 10, 10);
  }
}
public void keyPressed()
{
  if (theShip.getFuel() > 0)
  {
    if (key == 'w')
    {
      wPressed = true;
    }
    if (key == 's')
    {
      sPressed = true;
    }
  }
  else
  {
    wPressed = false;
    sPressed = false;
  }
  if (key == 'd')
  {
    dPressed = true;
  }
  if (key == 'a')
  {
    aPressed = true;
  }
  if (key == 'j')
  {
    jPressed = true;
  }
  if (key == ' ')
  {
    spacePressed = true;
  }
}
public void keyReleased()
{
  if (key == 'w')
  {
    wPressed = false;
  }
  if (key == 's')
  {
    sPressed = false;
  }
  if (key == 'd')
  {
    dPressed = false;
  }
  if (key == 'a')
  {
    aPressed = false;
  }
  if (key == ' ')
  {
    spacePressed = false;
  }
  if (key == 'j')
  {
    jPressed = false;
  }
}
public void mousePressed() 
{
  if (levels == 0)
  {
    playButton.updateButton();
  }  
}
public void duringGame()
{
  translate(-theCamera.position.x, -theCamera.position.y);
  theCamera.move();
  //theCamera.teleport();
}