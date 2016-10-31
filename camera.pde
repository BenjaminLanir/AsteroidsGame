class Camera
{
  PVector position;
  Camera()
  {
    position = new PVector(0 , 0);
  }
  public void move()
  {
    position.x = position.x + (float) theShip.getDirectionX();
    position.y = position.y + (float) theShip.getDirectionY();
  }
  public PVector getVector() {return position;}
}