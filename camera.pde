class Camera
{
  PVector position;
  Camera()
  {
    position = new PVector(0 , 0);
  }
  /*public void move()
  {
    position.x = position.x + (float) theShip.getDirectionX();
    position.y = position.y + (float) theShip.getDirectionY();
  }*/
  public void teleport()
  {
    position.x = (float) theShip.getX() - 512;
    position.y = (float) theShip.getY() - 450;
  }
  public PVector getVector() {return position;}
}