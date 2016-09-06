Die firstDie;
int sum;
void setup()
{
	size(800, 800);
	
}
void draw()
{
	//
	background(0);
	for (int i=0; i< 4; i++){
		firstDie=new Die(i*200+50, i*200+50);
		firstDie.display();
		sum+=firstDie.value;
	}
	fill(256);
	text(sum, 20, 20);
}
void mouseClicked()
{
	firstDie.roll();
}
class Die
{
	int value, xPos, yPos;
	Die(int x, int y) 
	{
		xPos=x;
		yPos=y;
		roll();
	}
	void roll()
	{
		int rand=(int)(Math.random()*10+1);
		while (!(rand<=6)){
			rand=(int)(Math.random()*10+1);
		}
		value=rand;
		println(value);
	}
	void display()
	{
		
		fill(256, 256, 256);
		ellipse(xPos, yPos, 100, 100);
		fill(0);
		textAlign(CENTER);
		text(value, xPos, yPos);
	}
}
