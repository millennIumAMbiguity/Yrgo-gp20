int place(){ //place object on ground
	int mov = 0;
	while (true) {
		fallHeight++;
		if (collision()){
			fallHeight--;
			placeHere();
			return mov;
		} else 
			mov++;
	}
}
void placeHere(){ //place object at curent pos
	for (int i = 0; i < fallingObj.blocks.length; ++i) {
		if (fallingObj.blocks[i] == 1){
			if (i/4-2 + fallHeight >= 0){
				playAria[(i/4-2 + fallHeight)*10 + i%4-2 + fallWidth] = fallingObj.objColor;
			} else {
				gameover = true;
			}
		}
	}

	resetObj(); //spawn new object

	int newLines = 0;
	for (int y = 0; y < 20; ++y) {
		for (int x = 0; x < 10; ++x) {
			if (playAria[y*10+x] == 0)
				break;
			if (x == 9) { //full row
				newLines++;
				removeLine(y*10+9);
			}
		}
	}

	if (newLines > 0){
		addScore(0, newLines); //add score
	}

}

void removeLine(int inY){ //todo: make into one for loop
	for (int i = inY; i >= 10; --i) { //move one row down
		playAria[i] = playAria[i-10];
	}
	for (int i = 0; i < 10; ++i) { //remove top row
		playAria[i] = 0;
	}
}


boolean collision(){
	for (int i = 0; i < fallingObj.blocks.length; ++i) {
		if (fallingObj.blocks[i] == 1 && //floor collision
			i/4 + fallHeight > 21 || 

			fallingObj.blocks[i] == 1 && //map collision
			i/4-2 + fallHeight >= 0 &&
			playAria[(i/4-2 + fallHeight)*10 + i%4-2 + fallWidth] != 0)

			return true; //found collision
	}
	return false; //no collision
}
boolean move() {
	fallHeight++;
	if (collision()){
		fallHeight--;
		placeHere();
		return false;
	}
	return true; //move successful
}
int moveSide(int n){
	fallWidth+=n;
	int mov = n;

	//collision with walls
	if (n >= 0) {
		int right = min(1,fallingObj.blocks[2] + fallingObj.blocks[6] + fallingObj.blocks[10] + fallingObj.blocks[14]) + min(1,fallingObj.blocks[7] + fallingObj.blocks[11]);
		if (fallWidth + right > 10){
			fallWidth--;
			mov--;
			if (fallWidth + right > 10){
				fallWidth--;
				mov--;
			}
		}
	}
	if (n <= 0) {
		int left = -min(1,fallingObj.blocks[4] + fallingObj.blocks[8]) -min(1,fallingObj.blocks[1] + fallingObj.blocks[5] + fallingObj.blocks[9] + fallingObj.blocks[13]);
		if (fallWidth + left < 0){
			fallWidth++;
			mov++;
			if (fallWidth + left < 0){
				fallWidth++;
				mov++;
			}
		}
	}

	//map collision
	if (collision()){
		fallWidth-=mov;
		return 1000; //invalid move
	}

	return mov;
}