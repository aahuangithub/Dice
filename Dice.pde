Die firstDie;
int sum;
void setup(){
	size(800, 800);
	noLoop();
}
void draw(){
	//
	background(0);
	for (int i=0; i< 4; i++){
		firstDie=new Die(Math.random(), Math.random());
		firstDie.display();
		sum+=firstDie.value;
	}
	fill(256);
	text(sum, 20, 20);
}
void mouseClicked(){
	redraw();
}
class Die
{
	int value, x, y;
	Die(int x, int y){
		this.x=x;
		this.y=y;
		roll();
	}
	void roll(){
		int rand=(int)(Math.random()*10+1);
		while (!(rand<=6)){
			rand=(int)(Math.random()*10+1);
		}
		this.value=rand;
	}
	void display(){
		fill(256,256, 256);
		textAlign(CENTER);
		text(this.value, this.x, this.y);
		switch(this.value){
			case 1 : rect(this.x, this.y, 50, 50, 10);
			break;
			case 2 : ellipse(20, 20, 20, 20);
			break;
			case 3 : ellipse(50, 50, 50, 50);
			break;
			case 4 : ellipse(100, 100, 100, 100);
			break;
			case 5 : rect(20, 20, 20, 20);
			break;
			case 6 : rect(1, 1, 22, 22);
			break;
		}
	}
}
