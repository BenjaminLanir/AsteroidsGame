class Button
{
	private color myColor;
	private double myWidth, myHeight, myX, myY;
	private boolean pressed;
	private String buttonText;
	public Button(double w, double x, double y, double z, String h)
	{
		myWidth = w;
		myHeight = x;
		myX = y;
		myY = z;
		pressed = false;
		myColor = color(0, 0, 0);
		buttonText = h;
	}
	public void updateButton()
	{
		if (mouseX > myX && mouseY > myY && mouseX < (myX + myWidth) && mouseY < (myY + myHeight))
		{
			pressed = true;
		}
		else
		{
			pressed = false;
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
		stroke(255);
		strokeWeight(2);
		rect((float) myX, (float) myY, (float) myWidth, (float) myHeight);
		fill(255);
		textSize(20);
		text(buttonText, (float) myX + 42, (float) myY + 30);
	}
	public boolean getPressed(){return pressed;}
}