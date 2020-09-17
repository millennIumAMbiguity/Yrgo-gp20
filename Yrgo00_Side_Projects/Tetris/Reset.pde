void reset(){ //todo: restart game
	
	playAria = new int[playAriaHeight*playAriaWidth+playAriaWidth];
	gameSpeed = 800;
 	score = 0;
 	level = 0;
 	linesCleared = 0;
 	linesForNextLevel = 10;
	hold = null;
 	next = new TObject();

 	resetObj();
}
void resetFall(){
	fallHeight = -1;
	fallWidth = playAriaWidth/2;
	time = millis()+gameSpeed;
}
void resetObj(){
	resetFall();
	fallingObj = next;
	next = new TObject();
	holdV = false;
}