class Button
{
	private color myColor;
	private double myWidth, myHeight, myX, myY;
	private boolean pressed;
	public Button(double w, double x, double y, double z)
	{
		myWidth = w;
		myHeight = x;
		myX = y;
		myY = z;
		pressed = false;
		myColor = color(0, 0, 0);
	}
	public void updateButton()
	{
		if (mouseX > myX && mouseY > myY && mouseX < (myX + myWidth) && mouseY < (myY + myHeight))
		{
			pressed = true;
		}
	}
	public void show()
	{
		if (mouseX > myX && mouseY > myY && mouseX < (myX + myWidth) && mouseY < (myY + myHeight) && pressed == false)
		{
			myColor = color(0, 255, 0);
		}
		else if (pressed == false)
		{
			myColor = color(0, 0, 0);
		}
		else if (pressed == true)
		{
			myColor = color(255, 0, 0);
		}
		fill(myColor);
		stroke(0);
		strokeWeight(2);
		rect((float) myX, (float) myY, (float) myWidth, (float) myHeight);
	}
	public boolean getPressed(){return pressed;}
}