Die firstDie;
int sum;
void setup(){
	size(800, 800, P3D);
	noLoop();

}
void draw(){
	//
	rotate(PI/20);
	background(150, 200, 256);
	for (int i=0; i< 4; i++){
		firstDie=new Die((int)(Math.random()*(width-400)+200), (int)(Math.random()*(height-400)+200));
		firstDie.display();
		sum+=firstDie.value;
	}
	fill(256);
	ellipseMode(CENTER);
	ellipse(400, 400, 50, 50);
}
void mouseWheel(){
	redraw();

}
void mousePressed(){
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
		fill(256,256, 256, 200);
		textAlign(CENTER);
		rectMode(CENTER);
		text(this.value, this.x, this.y);
		pushMatrix();
			translate(this.x, this.y);
			rotate(radians(this.rot));
			rect(0, 0, 100, 100, 10);

		fill(0);
		switch(this.value){
			case 1 : 
				ellipse(0, 0, 20, 20); //center dot
			break;
			case 2 : 
				ellipse(-25, -25, 20, 20); 
				ellipse(25, 25, 20, 20); 
			break;
			case 3 : 
				ellipse(-25, -25, 20, 20); 
				ellipse(25, 25, 20, 20); 
				ellipse(0, 0, 20, 20); //center dot
			break;
			case 4 : 
				ellipse(-25, -25, 20, 20); 
				ellipse(25, 25, 20, 20); 
				ellipse(-25, 25, 20, 20); 
				ellipse(25, -25, 20, 20); 	
			break;
			case 5 : 
				ellipse(-25, -25, 20, 20); 
				ellipse(25, 25, 20, 20); 
				ellipse(-25, 25, 20, 20); 
				ellipse(25, -25, 20, 20); 
				ellipse(0, 0, 20, 20); //center dot
			break;
			case 6 : 
				ellipse(-25, -25, 20, 20); 
				ellipse(25, 25, 20, 20); 
				ellipse(-25, 25, 20, 20); 
				ellipse(25, -25, 20, 20); 
				ellipse(0, 25, 20, 20); //center dot
				ellipse(0, -25, 20, 20); //center dot
			break;
		}
		popMatrix();		
	}
}
