Die firstDie;
int sum;
void setup(){
	size(800, 800, P3D);
	noLoop();
	lights();

}
void draw(){
	//
	rotate(PI/20);
	background(0);
	for (int i=0; i< 4; i++){
		firstDie=new Die((int)(Math.random()*(width-200)+100), (int)(Math.random()*(height-200)+100));
		firstDie.display();
		sum+=firstDie.value;
	}
	fill(256);
	text(sum, 20, 20);
}
void mouseWheel(){
	redraw();

}
class Die
{
	int value, x, y, rot;
	Die(int x, int y){
		this.x=x;
		this.y=y;
		this.rot=(int)(Math.random()*360);
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
		pushMatrix();
			translate(this.x, this.y);
			rotate(radians(this.rot));
			rect(0, 0, 100, 100, 10);
		popMatrix();
		switch(this.value){
			case 1 : 
			break;
			case 2 : 
					
			break;
			case 3 : 
					
			break;
			case 4 : 
					
			break;
			case 5 : 
					
			break;
			case 6 : 
			break;
		}
	}
}
