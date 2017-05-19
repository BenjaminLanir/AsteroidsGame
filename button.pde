class Button
{
	private color myColor;
	private double myWidth, myHeight, myX, myY;
	//private boolean pressed;
	private String buttonText;
	public Button(double w, double x, double y, double z, String h)
	{
		myWidth = w;
		myHeight = x;
		myX = y;
		myY = z;
		//pressed = false;
		myColor = color(0, 0, 0);
		buttonText = h;
	}
	public boolean updateButton()
	{
		if (mouseX > myX && mouseY > myY && mouseX < (myX + myWidth) && mouseY < (myY + myHeight) && mouseState == true)
		{
			return true;
		}
		else
		{
			return false;
		}
	}
	public void show()
	{
		if (mouseX > myX && mouseY > myY && mouseX < (myX + myWidth) && mouseY < (myY + myHeight) && updateButton() == false)
		{
			myColor = color(0, 255, 0);
		}
		else if (updateButton() == false)
		{
			myColor = color(0, 0, 0);
		}

		else if (updateButton() == true)
		{
			myColor = color(255, 0, 0);
		}
		fill(myColor);
		stroke(255);
		strokeWeight(2); 
		rect((float) myX, (float) myY, (float) myWidth, (float) myHeight);
		fill(255);
		textSize(20);
		textAlign(CENTER);
		text(buttonText, (float) (myX + (myWidth/2)), (float) (myY + (myHeight/1.7)));
	}
	//public boolean getPressed(){return pressed;}
}