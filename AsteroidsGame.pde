SpaceShip theShip;
int levels = 0;
Star [] stars;
Camera theCamera;
int mapHeight = 10000;
int mapWidth = 10000;
ArrayList <Bullet> shipBullet;
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
boolean mouseState = false;
double speed = 0;
//your variable declarations here
public void setup() 
{
  size(1024, 900);
  //your code here
  frameRate(60);
  theCamera = new Camera();
  theShip = new SpaceShip();
  playButton = new Button(124, 50, 450, 425, "Play");
  resetButton = new Button(124, 50, 450, 425, "Respawn?");
  shipBullet = new ArrayList <Bullet>();
  theEnemies = new ArrayList <EnemyShip>();
  playerstats = new Stats();
  testEnemy = new EnemyShip();
  stars = new Star[(int) (Math.random() * 3000 + 500)];
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
  else if (levels == 3)
  {
    resetButton.show();
    if (resetButton.getPressed() == true)
    {
      levels = 0;
      System.out.println("it worked");
      theShip.setHealth(100);
      theShip.setFuel(100);
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
class Stats
{
  private boolean overheat;
  private double statHealth, statOverheat, statFuel;
  public Stats()
  {
    statHealth = theShip.getHealth();
    statOverheat = theShip.getCannonHeat();
    statFuel = theShip.getFuel();
    overheat = false;
  }
  public void show()
  {
    fill(100, 100, 100, 122);
    stroke(100, 100, 100, 122);
    rect(800, 0, 224, 900);
    fill(255, 0, 0, 255);
    stroke(255, 0, 0, 255);
    rect(850, 300, (float) statHealth * 1.24, 17);
    fill(0, 0, 255, 255);
    stroke(0, 0, 255, 255);
    rect(850, 400, (float) statFuel * 1.24, 17);
    fill(0, 255, 0, 255);
    stroke(0, 255, 0, 255);
    rect(850, 500, (float) statOverheat * 1.24, 17);
    fill(255);
    stroke(255);
    textAlign(LEFT);
    text("Health", 880, 350);
    text("Fuel", 895, 450);
    text("Cannon Heat", 850, 550);
    fill(0, 0, 0, 0);
    stroke(0);
    strokeWeight(5);
    rect(850, 300, 124, 17);
    rect(850, 400, 124, 17);
    rect(850, 500, 124, 17);
    //miniMap
    fill(0, 0, 0, 255);
    rect(810, 10, 204, 204);
    //scale everything
    fill(0, 0, 255);
    strokeWeight(0);
    rect(theShip.getX() / (mapWidth / 204.0) + 810.0, theShip.getY() / (mapHeight / 204.0) + 10.0, 5, 5);
    fill(255, 0, 0);
    rect(testEnemy.getX() / (mapWidth / 204.0) + 810.0, testEnemy.getY() / (mapHeight / 204.0) + 10.0, 5, 5);
    for (int i = 0; i < theAsteroids.size(); i++)
    {
      fill(122, 50, 10);
      strokeWeight(0);
      rect(theAsteroids.get(i).getX() / (mapWidth / 204.0) + 810.0, theAsteroids.get(i).getY() / (mapHeight / 204.0), 5, 5);
    }
    for (int j = 0; j < theEnemies.size(); j++)
    {
      fill(255, 0, 0);
      rect(theEnemies.get(j).getX() / (mapWidth / 204.0) + 810, theEnemies.get(j).getY() / (mapHeight / 204.0) + 10.0, 5, 5);
    }
  }
  public void updateStats()
  {
    statHealth = theShip.getHealth();
    statOverheat = theShip.getCannonHeat();
    statFuel = theShip.getFuel();
  }
  public boolean getOverheat(){return overheat;}
  public void cannonOverheat()
  {
    if (theShip.getCannonHeat() > 100)
    {
      overheat = true;
    }   
    if (theShip.getCannonHeat() == 0)
    {
      overheat = false;
    }
  }
}