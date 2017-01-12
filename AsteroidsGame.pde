SpaceShip theShip;
int levels = 0;
Star [] stars;
Camera theCamera;
int mapHeight = 10000;
int mapWidth = 10000;
ArrayList <Bullet> shipBullet;
ArrayList <Bullet> enemyBullet;
Stats playerstats;
Button playButton;
Button resetButton;
EnemyShip testEnemy;
ArrayList <EnemyShip> theEnemies;
//Asteroid [] theAsteroids;
ArrayList <Asteroid> theAsteroids;
boolean wPressed = false;
boolean aPressed = false;
boolean dPressed = false;
boolean sPressed = false;
boolean spacePressed = false;
boolean jPressed = false;
boolean pPressed = false;
boolean mouseState = false;
boolean rPressed = false;
double speed = 0;
SpaceStation goodStation;
SpaceStation badStation;
int nextShield = 0;
//your variable declarations here
public void setup() 
{
  size(1024, 900);
  //your code here
  setItUp();
}
public void setItUp()
{
  frameRate(60);
  theCamera = new Camera();
  theShip = new SpaceShip();
  playButton = new Button(124, 50, 450, 425, "Play");
  resetButton = new Button(124, 50, 450, 425, "Respawn?");
  shipBullet = new ArrayList <Bullet>();
  enemyBullet = new ArrayList <Bullet>();
  theEnemies = new ArrayList <EnemyShip>();
  playerstats = new Stats();
  testEnemy = new EnemyShip();
  stars = new Star[(int) (Math.random() * 3000 + 500)];
  goodStation = new SpaceStation(true);
  badStation = new SpaceStation(false);
  theAsteroids = new ArrayList <Asteroid>();
  for (int q = 0; q < 100; q++)
  {
    theAsteroids.add(new Asteroid());
    theAsteroids.get(q).setPointDirection((int) (Math.random() * 360));
    theAsteroids.get(q).accelerate(Math.random() * 10 - 5);
  }
  for (int m = 0; m < 10; m++)
  {
    theEnemies.add(new EnemyShip());
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
    boolean go = false;
    for (int z = 0; z < 120; z++)
    {
      if (z == 119)
      {
        go = true;
      }
    }
    if (go == true)
    {
      playButton.show();
      if (playButton.getPressed() == true)
      {
        levels = 1;
      }
    }
  }
  else if (levels == 1) //in game
  {
    duringTheGame();
  }
  else if (levels == 2) //end game
  {
    textSize(100);
    fill(255);
    stroke(255);
    textAlign(CENTER);
    text("Game Over", 512, 450);
    if (mouseState == true)
    {
      levels = 3;
      //theShip.setHealth(100);
    }
  }
  else if (levels == 3) //reset
  {
    resetButton.show();
    if (resetButton.getPressed() == true)
    {
      levels = 0;
      theShip.setHealth(100);
      theShip.setFuel(100);
      setItUp();
    }
  }
  else if (levels == 4)
  {
    theCamera.teleport();
    translate(-theCamera.getVector().x, -theCamera.getVector().y);
    goodStation.show();
    badStation.show();
    for (int u = 0; u < theAsteroids.size(); u++)
    {
      theAsteroids.get(u).show();
    }
    theShip.show();
    for (int w = 0; w < theEnemies.size(); w++)
    {
      theEnemies.get(w).show();
    }
    //System.out.println(theCamera.getVector());
    if (pPressed == true)
    {
      pPressed = false;
      levels = 1;
    }
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
    ellipse(myX, myY, 15, 15);
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
  if (key == 'p')
  {
    pPressed = true;
  }
  if (key == 'r')
  {
    if (rPressed == true)
    {
      rPressed = false;
      theShip.accelerate(-180);
    }
    else if (rPressed == false)
    {
      rPressed = true;
    }
    System.out.println(rPressed);
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
  mouseState = true;
  if (levels == 0)
  {
    playButton.updateButton();
  } 
  if (levels == 3)
  {
    resetButton.updateButton();
  } 
}
public void mouseReleased()
{
  mouseState = false;
}
public void duringGame()
{
  translate(-theCamera.position.x, -theCamera.position.y);
  //theCamera.move();
  theCamera.teleport();
}
