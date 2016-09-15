Die firstDie;
int sum = 0;
boolean firstRun = true;
boolean stopped = true;
void setup(){
	size(800, 800);
	noLoop();
}
void draw(){
	background(150, 200, 256);
	sum=0;
	//
	strokeWeight(1);
	stroke(0);
	for (int xPos=100; xPos<width; xPos+=200){
		for (int yPos=100; yPos<height; yPos+=200){
			firstDie=new Die (xPos, yPos);
			firstDie.display();
			sum+=firstDie.value;
		}
	}
	if (firstRun){
		fill (0, 0, 0, 150);
		rect (width/2, height/2, width, height);
		fill(256);
		//triangle(width/2-25, y1, width/2-25, y2, x3, y3);
		firstRun=false;
	}
	text(sum, height/2, width/2);
}

void mouseClicked(){
	if (stopped){
		loop();
		stopped=!stopped;
	}
	else{
		fill (0, 0, 0, 150);
		rect (width/2, height/2, width, height);
		noLoop();
		stopped=!stopped;
	}
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
			translate(this.x+(int)(Math.random()*100)-50, this.y+(int)(Math.random()*100)-50);
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
				ellipse(0, 25, 20, 20);
				ellipse(0, -25, 20, 20);
			break;
		}
		popMatrix();		
	}
}
