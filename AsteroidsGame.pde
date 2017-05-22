SpaceShip theShip;
int levels = 0;
int nextLevel = 0;
int score = 0;
boolean oneStation = false;
boolean moreStation = false;
boolean resetLevel = false;
Star [] stars;
Camera theCamera;
int mapHeight = 10000;
int mapWidth = 10000;
int instructionsCounter = 0;
ArrayList <Bullet> shipBullet;
ArrayList <Bullet> enemyBullet;
Stats playerstats;
Button playButton;
Button resetButton;
Button instructionsButton;
Button backInstructionsButton;
Button continueButton;
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
boolean uPressed = false;
boolean justPressed = false;
double speed = 0;
SpaceStation goodStation;
SpaceStation badStation;
SpaceStation station2;
SpaceStation station3;
int nextShield = 0;
BossEnemy firstBoss;
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
  instructionsButton = new Button(130, 50, 850, 800, "Instructions");
  backInstructionsButton = new Button(130, 50, 850, 800, "Back");
  continueButton = new Button(124, 50, 450, 425, "Continue");
  shipBullet = new ArrayList <Bullet>();
  enemyBullet = new ArrayList <Bullet>();
  theEnemies = new ArrayList <EnemyShip>(30);
  stars = new Star[((int) (Math.random() * ((mapHeight * mapWidth) / 30000)))];
  goodStation = new SpaceStation(true, 450, 450);
  badStation = new SpaceStation(false, mapWidth - 450, mapHeight - 450);
  station2 = new SpaceStation(false, 450, mapHeight - 450);
  station3 = new SpaceStation(false, mapWidth - 450, 450);
  firstBoss = new BossEnemy(mapWidth - 500, mapHeight - 500, false);
  theAsteroids = new ArrayList <Asteroid>();
  rPressed = false;
  for (int q = 0; q < 100; q++)
  {
    theAsteroids.add(new Asteroid());
    theAsteroids.get(q).setPointDirection((int) (Math.random() * 360));
    theAsteroids.get(q).accelerate(Math.random() * 10 - 5);
  }
  for (int m = 0; m < 10; m++)
  {
    theEnemies.add(new EnemyShip((int) (Math.random() * 500 + mapWidth - 725), (int) (Math.random() * 500 + mapHeight - 725)));
  }
  for (int i = 0; i < stars.length; i++)
  {
    stars[i] = new Star();
  }
  wPressed = false;
  aPressed = false;
  dPressed = false;
  sPressed = false;
  spacePressed = false;
  jPressed = false;
  pPressed = false;
  mouseState = false;
  rPressed = false;
  playerstats = new Stats();
}
public void draw() 
{
  oneStation = false;
  moreStation = false;
  if (uPressed == true)
  {
    uPressed = false;
    nextLevel = levels + 1;
    levels = 14;
    instructionsCounter = 0;
    resetLevel = true;
  }
  //your code here
  background(0);
  if (justPressed == true)
  {
    justPressed = false;
    mouseState = false;
  }
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
      instructionsButton.show();
      if (playButton.updateButton() == true)
      {
        levels = 1;
        instructionsCounter = 0;
      }
    }
    if (instructionsButton.updateButton() == true)
    {
      levels = 13;
      justPressed = true;
    }
  }
  else if (levels == 1) //level 1
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level One:", 475, 400);
      text("Defeat all Enemies to Advance", 475, 500);
      instructionsCounter++;
    }
    oneStation = true;
    duringTheGame();  
    if (theEnemies.size() == 0)
    {
      nextLevel = levels + 1;
      levels = 14;
      instructionsCounter = 0;
      resetLevel = true;
    }
  }
  else if (levels == 2)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level Two:", 475, 400);
      text("Destroy the Enemy Base to Advance", 475, 500);
      instructionsCounter++;
    }
    oneStation = true;
    duringTheGame();
    if (badStation.getHealth() < 0)
    {
      nextLevel = levels + 1;
      levels = 14;
      instructionsCounter = 0;
      resetLevel = true;
    }
  }
  else if (levels == 3)
  {
    for (int i = theEnemies.size(); i < 30; i++)
    {
    }
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level Three:", 475, 400);
      text("Defeat all Enemies to Advance", 475, 500);
      instructionsCounter++;
    }
    oneStation = true;
    moreStation = true;
    duringTheGame();
    if (theEnemies.size() == 0)
    {
      nextLevel = levels + 1;
      levels = 14;
      instructionsCounter = 0;
      resetLevel = true;
    }
  }
  else if (levels == 4)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level Four:", 475, 400);
      text("Defeat 50 Enemies to Advance", 475, 500);
      instructionsCounter++;
    }
    oneStation = true;
    moreStation = true;
    duringTheGame();
    if (score == 50)
    {
      nextLevel = levels + 1;
      levels = 14;
      instructionsCounter = 0;
      resetLevel = true;
    }
  }
  else if (levels == 5)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
      text("Level Five:", 475, 400);
      text("Defeat the Boss to Advance", 475, 500);
      instructionsCounter++;
    }
    duringTheGame();
    if (firstBoss.getDistance() > 500)
    {
      firstBoss.accelerate(.3);
    }
    else if (firstBoss.getDistance() < 500)
    {
      firstBoss.accelerate(.1);
    }
    firstBoss.show();
    firstBoss.track();
    firstBoss.move();
    if (firstBoss.getHealth() < 0)
    {
      nextLevel = levels + 1;
      levels = 14;
      instructionsCounter = 0;
      resetLevel = true;
    }
  }
  else if (levels == 6)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
    }
  }
  else if (levels == 7)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
    }
  }
  else if (levels == 8)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
    }
  }
  else if (levels == 9)
  {
    background(255, 0, 0);
    fill(0);
    rect(-theCamera.getVector().x, -theCamera.getVector().y, mapWidth, mapHeight);
    if (instructionsCounter < 100)
    {
      fill(255);
      textSize(40);
      textAlign(CENTER);
    }
  }
  else if (levels == 10) //end game
  {
    textSize(100);
    fill(255);
    stroke(255);
    textAlign(CENTER);
    text("Game Over", 512, 450);
    if (mouseState == true)
    {
      levels = 11;
    }
  }
  else if (levels == 11) //reset
  {
    resetButton.show();
    if (resetButton.updateButton() == true)
    {
      levels = 0;
      theShip.setHealth(100);
      theShip.setFuel(100);
      setItUp();
    }
  }
  else if (levels == 12) //paused
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
    if (pPressed == true)
    {
      pPressed = false;
      levels = 1;
    }
  }
  else if (levels == 13)
  {
    //instructions level
    if (justPressed == true)
    {
      justPressed = false;
      mouseState = false;
    }
    background(0);
    backInstructionsButton.show();
    textSize(40);
    textAlign(CENTER);
    fill(255);
    stroke(255);
    text("Use WASD to move", 512, 200);
    text("Use the spacebar to shoot", 512, 300);
    text("Use P to pause and unpause", 512, 400);
    text("Use R for hyperspace", 512, 500);
    text("More instructions at the start of each level", 512, 600);
    if (backInstructionsButton.updateButton() == true)
    {
      levels = 0;
      justPressed = true;
    }
  }
  else if (levels == 14)
  {
    background(0);
    textAlign(CENTER);
    textSize(60);
    fill(255);
    stroke(255);
    text("Level Complete", 512, 300);
    continueButton.show();
    if (continueButton.updateButton())
    {
      levels = nextLevel;
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
  if (key == 'u')
  {
    uPressed = true;
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
      theShip.accelerate(-90);
    }
    else if (rPressed == false)
    {
      rPressed = true;
    }
  }
}
public void keyReleased()
{
  if (key == 'u')
  {
    uPressed = false;
  }
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