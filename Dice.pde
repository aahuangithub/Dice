Die firstDie;
int[] sums=new int[10];
void setup(){
	size(800, 800);
	noLoop();

}
void draw(){
	background(150, 200, 256);

	//
	int sum = 0;
	strokeWeight(1);
	stroke(0);
	for (int i=0; i< 6; i++){
		firstDie=new Die((int)(Math.random()*(width-200)+100), (int)(Math.random()*(height-200)+100));
		firstDie.display();
		sum+=firstDie.value;
	}
	for (int i=0; i<sums.length; i++){
		if (sums[i]==0){
			sums[i]=sum;
			break;
		}
	}
	for (int i=0; i<sums.length; i++){
		if (i==0){
			line(0,0,i*80,sums[i]*(400/36));
		}
		else{
			line(i*80,sums[i]*(400/36),i*80-80, sums[i-1]*(400/36));
		}
	}
	
	//clears screen if graph reaches 10
	if (sums[9]!=0){
		for (int i=0; i<sums.length; i++){
			sums[i]=0;
		}
	}
}
void mouseWheel(){
	redraw();
}
void mouseDragged(){
	redraw();
}
void mouseClicked(){
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
				ellipse(0, 25, 20, 20);
				ellipse(0, -25, 20, 20);
			break;
		}
		popMatrix();		
	}
}
