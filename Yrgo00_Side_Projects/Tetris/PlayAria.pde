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
				playAria[(i/4-2 + fallHeight)*playAriaWidth + i%4-2 + fallWidth] = fallingObj.objColor;
			} else {
				gameover = true;
			}
		}
	}

	resetObj(); //spawn new object

	int newLines = 0;
	for (int y = 0; y < playAriaHeight; ++y) {
		for (int x = 0; x < playAriaWidth; ++x) {
			if (playAria[y*playAriaWidth+x] == 0)
				break;
			if (x == playAriaWidth-1) { //full row
				newLines++;
				removeLine(y*playAriaWidth+9);
			}
		}
	}

	if (newLines > 0){
		addScore(0, newLines); //add score
	}

}

void removeLine(int inY){ //todo: make into one for loop
	for (int i = inY; i >= playAriaWidth; --i) { //move one row down
		playAria[i] = playAria[i-playAriaWidth];
	}
	for (int i = 0; i < playAriaWidth; ++i) { //remove top row
		playAria[i] = 0;
	}
}