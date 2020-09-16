void reset(){ //todo: restart game

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