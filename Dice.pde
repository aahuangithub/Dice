Die firstDie;
int sum = 0;
boolean firstRun = true;
boolean stopped = true;
PFont f1, f2;
void onStop(){
	noStroke();
	fill (0, 0, 0, 200);
	rect (width/2, height/2, width, height);
	fill(0, 256, 0);
	triangle(width/2-25, height/2-35.35, width/2-25, height/2+35.35, width/2+25, height/2);
	fill(233, 256, 233);
	textSize(66);
	if (!firstRun){
		text(sum, width/2, height/3);
		text("YOUR SCORE:", width/2, height/3-122);
		textFont(f2, 15);
		text("(out of 72)", width/2, height/3+25);
		textFont(f1, 66);
		text("YOU ARE IN THE TOP\n"+round((float)sum*0.72)+"\nPERCENT", width/2, 2*height/3);
	}
}
void setup(){
	size(800, 800);
	noLoop();
	f1 = createFont("Arial",66);
	f2 = createFont("Arial Italic",66);
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
		onStop();
		firstRun=false;
	}
}

void mouseClicked(){
	if (stopped){
		loop();
		stopped=!stopped;
	}
	else{
		onStop();
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
