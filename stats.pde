class Stats
{
	private double statHealth, statOverheat, statFuel;
	public Stats()
	{
		statHealth = theShip.getHealth();
		statOverheat = 0;
		statFuel = 100;
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
		text("Health", 893, 330);
		text("Fuel", 900, 430);
		text("Cannon Heat", 880, 530);
		fill(0, 0, 0, 0);
		stroke(0);
		strokeWeight(5);
		rect(850, 300, 124, 17);
		rect(850, 400, 124, 17);
		rect(850, 500, 124, 17);
	}
	public void updateStats()
	{
		statHealth = theShip.getHealth();
		statOverheat = 0;
		statFuel = 100;
	}
}