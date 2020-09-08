
void setup()
{
  //size(768, 432);
  fullScreen();
  stroke(255);
}

boolean enableGameAnimations = true;

/*
mode 0: main menu
mode 1: main menu - edit text 1
mode 2: main menu - edit text 2
mode 3: game
mode 4: game over
mode 5: game victory
*/
int curentMode = 0;
int[] mineFieldSize = {32, 32};
int diff = 10;
int[][] mineField;
boolean[][] mineFieldDetected;
boolean[][] flags;
int lastButtonID = -1;

int size = 12;
int[] offset;
int score;
int mineAmount;
int remaning;

boolean update = true;

int t = 0;
int aniID;

void draw()
{
	
	lastButtonID = -1;

	if (curentMode < 3){
		background(0);
		// menu animation
		for (int y = 0; y < height; y++) { 
			if ((y+t)%64 == 0){
				stroke(127*sin(((float)y/height)*PI));
				line(0, y, width, y);
			}
		}
		for (int x = 0; x < width; x++) {
			if ((x+t)%64 == 0){
				stroke(127*sin(((float)x/width)*PI));
				line(x, 0, x, height);
			}
		}
		t--;
		stroke(255);

		textSize(64);
		renderTextCenter("MineSweeper", -2);
		textSize(32);
		renderButtonCenter(1,"START", 0);
		textSize(24);
		if (curentMode == 0)
			renderButtonCenter(2,mineFieldSize[0]+"x"+mineFieldSize[1], 2);
		else if (curentMode == 1){ 
			renderButtonCenter(2,keys+"_", 2);
			lastButtonID = 2;
		}
		if (curentMode == 0)
			renderButtonCenter(3,diff+"%", 3);
		else if (curentMode == 2) { 
			renderButtonCenter(3,keys+"_", 3);
			lastButtonID = 3;
		}
	} else if (curentMode > 2 && update){
		background(0);
		if (enableGameAnimations && size > 10)
			t--;
		else 
			update = false;

		stroke(255);
		textSize(size);
		for (int x = max(0, -offset[0]/size); x <= min(mineFieldSize[0], width/size -offset[0]/size + 2); ++x) { //lines along the x axis
			line(
				x*size+offset[0],
				mineFieldSize[1]*size+offset[1],
				x*size+offset[0],
				offset[1]);
		}
		for (int y = max(0, -offset[0]/size); y <= min(mineFieldSize[1], height/size -offset[1]/size + 2); ++y) { //lines along the y axis
			line(
				offset[0],
				y*size+offset[1],
				mineFieldSize[0]*size+offset[0],
				y*size+offset[1]);
		}

		for (int x = max(0, -offset[0]/size); x < min(mineFieldSize[0], width/size -offset[0]/size + 2); ++x) {
			for (int y = max(0, -offset[1]/size); y < min(mineFieldSize[1], height/size -offset[1]/size + 2); ++y) {
				String s = Integer.toString(mineField[x][y]);
				if (curentMode == 4 && mineField[x][y] == -1){ //show bombs
					fill(255,0,0);
					rect(x*size + offset[0] + 4, y*size + offset[1] + 1, size - 4, size - 6);
					if (flags[x][y])
						fill(0);
					else
						fill(255);
					text("X", x*size + offset[0] + size/5 + 1, y*size + offset[1] - size/10 + size);
				} else if (mineFieldDetected[x][y]){ // render text
					switch (mineField[x][y]) {
						case -1 :
							fill(255);
						 	s = "X";
						break;	
						case 0 :
							s = "";
						break;	
						case 1 :
							fill(0,127,255);
						break;	
						case 2 :
							fill(0,255,0);
						break;	
						case 3 :
							fill(255,16,16);
						break;
						default:
							fill(255,32*(mineField[x][y]-3)-1,255);
						break;	
					}
					text(s, x*size + offset[0] + size/5 + 1, y*size + offset[1] - size/10 + size);
				} else { //render boxes on sqares
					if (enableGameAnimations && size > 10){
						switch (aniID) { //animations
							case 0 :
								fill(100+60*sin(0.3*y+0.04f*t)+60*cos(0.3*x+0.04f*t));
							break;
							case 1 :
								fill(160+60*sin(0.3*y+0.04f*t));
							break;
							case 2 :
								fill(160+60*sin(0.3*y+0.3*x+0.04f*t));
							break;
							case 3 :
								fill(
									55+200*sin(0.4*y+0.04f*t)*cos(0.4*x+0.04f*t),
									55+200*sin(0.4*y+0.045f*t)*cos(0.4*x+(-0.035f)*t),
									55+200*sin(0.4*y+(-0.03f)*t)*cos(0.4*x+(-0.05f)*t));
							break;
							case 4 :
								fill(160+60*sin(((y+x)%10)*0.314f+0.04f*t));
							break;
							case 5 :
								fill(160+60*sin(0.3*y+0.04f*t*x/mineFieldSize[0]));
							break;
						}
					} else {
						fill(220);
					}
					
					rect(x*size + offset[0] + 4, y*size + offset[1] + 1, size - 4, size - 6);
					if (flags[x][y])
					{
						fill(0);
						text("X", x*size + offset[0] + size/5 + 1, y*size + offset[1] - size/10 + size);
					}
				}
			}
		}
		if (curentMode == 3){
			textSize(16);
			renderTextBox("mines: "+mineAmount+" score: "+score,-1,-1);

			if (remaning == mineAmount){
				curentMode = 5;
				update = true;
			}
		} else if (curentMode == 4){
			textSize(32);
			renderTextCenter("Game Over", -1);
			renderTextBoxCenter(Integer.toString(score), 0);
		} else if (curentMode == 5){
			textSize(32);
			renderTextCenter("Level Cleared", -1);
			renderTextBoxCenter(Integer.toString(score), 0);
		}

	}

}


void renderLevel(){

	aniID = (int)random(-0.5, 5.6); //randome animation

	update = true;

	offset = new int[] {(width - mineFieldSize[0]*size)/2, (height - mineFieldSize[1]*size)/2}; //move board to center of screen

	mineAmount = 0;
	score = 0;
	remaning = 0;

	mineFieldDetected = new boolean[mineFieldSize[0]][mineFieldSize[1]];
	flags = new boolean[mineFieldSize[0]][mineFieldSize[1]];

	mineField = new int[mineFieldSize[0]][mineFieldSize[1]];

	for (int x = 0; x < mineFieldSize[0]; ++x) {
		for (int y = 0; y < mineFieldSize[1]; ++y) {
			if (random(0, 100) < diff){ // place mines
				mineField[x][y] = -1;
				mineAmount++;
			} 
			remaning++;
		}
	}

	for (int x = 0; x < mineFieldSize[0]; ++x) { //calculate how many surrounding mines a square have
		for (int y = 0; y < mineFieldSize[1]; ++y) {
			if (mineField[x][y] == 0){ 
				int c = 0;
				for (int x2 = x-1; x2 < x+2; ++x2) { //calculate amount of surrounding mines
					for (int y2 = y-1; y2 < y+2; ++y2) {
						if (x2 > -1 && y2 > -1 && x2 < mineFieldSize[0] && y2 < mineFieldSize[1])
							if (mineField[x2][y2] == -1)
								c++;
					}
				}
				mineField[x][y] = c;
			}
		}
	}
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  if (curentMode > 2 && (size > 1 || e<0)){ //zoom
  	offset[0] += e * (mineFieldSize[0]/2) ;
  	offset[1] += e * (mineFieldSize[1]/2) ;
  	size -= e;
  	update = true;
  }
  
}
void mousePressed() {
	update = true;
	if (curentMode == 3){ //game 
		int x = (mouseX-offset[0])/size;
		int y = (mouseY-offset[1])/size;

		if (x < mineFieldSize[0] && y < mineFieldSize[1] && x > -1 && y > -1){
			if (!mineFieldDetected[x][y]){
				if (mouseButton == LEFT && !flags[x][y]){ 
					mineFieldDetected[x][y] = true;
					remaning--;
					if(mineField[x][y] == -1){ //game over
						curentMode=4;
						return;
					} else if (mineField[x][y] == 0){
							detectNabor(0, x, y);
					}
					
					score += 1+mineField[x][y];
				} else if (mouseButton == RIGHT) { // place/remove flag
					flags[x][y] = !flags[x][y];
				}
			}
		}

	} else if (mouseButton == LEFT) {
    mousePress();
  }
}
void mousePress(){
	switch (curentMode) {
    	case 0 :
    		if (lastButtonID == 2){ //start game
				keyMode=true;
				keys = "";
				curentMode = 1;
			} else if (lastButtonID == 3){ //edit bord size
				keyMode=true;
				keys = "";
				curentMode = 2;
			} else if (lastButtonID == 1){ // edit difficulty
				curentMode = 3;
				renderLevel();
			}
    	break;	
    	case 1 :
    		curentMode = 0;
			if (keys!=""&&keys.split("x").length>1){//bord size string to int[2]
				mineFieldSize[0]=Integer.parseInt(keys.split("x")[0]);
				mineFieldSize[1]=Integer.parseInt(keys.split("x")[1]);
			}
			keyMode=false;
    	break;	
    	case 2 :
    		curentMode = 0;
			if (keys!=""){ //difficulty string to int
				diff= max(Integer.parseInt(keys),8);
			}
			keyMode=false;
    	break;	
    	case 4 :
    	case 5 :
    		curentMode = 0; // back to menu
    	break;	
    }
}

int recursionLimit = 4330; // limit to pervent error
void detectNabor(int recursionCount, int x, int y){
	for (int x2 = x-1; x2 < x+2; ++x2) {
		for (int y2 = y-1; y2 < y+2; ++y2) {
			if (x2 < mineFieldSize[0] && y2 < mineFieldSize[1] && x2 > -1 && y2 > -1) {
				if (!mineFieldDetected[x2][y2]){
					mineFieldDetected[x2][y2] = true;
					remaning--;
					if (mineField[x2][y2] == 0 && recursionCount < recursionLimit){
						detectNabor(recursionCount + 1, x2, y2);
					}
					score += 1+mineField[x][y];
				}
			}
		}
	}
}


boolean keyMode = false;
String keys = "";
void keyPressed() { // keyInput
  if (keyMode){
  	if (key > 47 && key < 58 || (key == 'x' && curentMode == 1))
  	keys += key;
  } 


  switch (key) {
  	case DELETE :
  		keys = "";
  	break;	
  	case 8 : // backslash
  		if (keys.length() > 0)
  		keys = keys.substring(0, keys.length() - 1);
  	break;	
  	case ENTER :
  		mousePress();
  	break;	
  }


   if (curentMode > 2){ //move on board
	   	update = true;
		switch (keyCode) {
		  	case UP :
		  		offset[1] += size;
		  	break;	
		  	case DOWN :
		  		offset[1] -= size;
		  	break;	
		  	case LEFT :
		  		offset[0] += size;
		  	break;	
		  	case RIGHT :
		  		offset[0] -= size;
		  	break;	
		  }
   }
   	
}

void renderTextCenter(String s, int offsetH){
	int textW = (int)textWidth(s)+10;
	int textH = (int)textAscent();
	int posX = width/2-textW/2;
	int posY = height/2-textH/2+offsetH*(textH+10);

	fill(255);
	text(s, posX + 5, posY + textH); 
}

void renderButtonCenter(int id, String s, int offsetH){
	int textW = (int)textWidth(s)+10;
	int textH = (int)textAscent()+10;
	int posX = width/2-textW/2;
	int posY = height/2-textH/2+offsetH*(textH+10);

	if (overRect(posX,posY,textW,textH)) {
	   fill(127);
	   lastButtonID = id;
	} else {
	   //fill(0);
	   noFill();
	}

	rect(posX,posY,textW,textH);
	fill(255);
	text(s, posX + 5, posY + textH -10 ); 
}

void renderTextBoxCenter(String s, int offsetH){
	int textW = (int)textWidth(s)+10;
	int textH = (int)textAscent()+10;
	int posX = width/2-textW/2;
	int posY = height/2-textH/2+offsetH*(textH+10);
	fill(0);
	rect(posX,posY,textW,textH);
	fill(255);
	text(s, posX + 5, posY + textH -10 ); 
}
void renderTextBox(String s, int x, int y){
	int textW = (int)textWidth(s)+10;
	int textH = (int)textAscent()+5;

	fill(0);
	rect(x,y,textW,textH);
	fill(255);
	text(s, x + 5, y + textH -5 ); 
}

boolean overRect(int x, int y, int width, int height)  { // from https://processing.org/reference
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
