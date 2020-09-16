void reset(){ //todo: restart game

}
void resetFall(){
	fallHeight = -2;
	fallWidth = 5;
	time = millis()+gameSpeed;
}
void resetObj(){
	resetFall();
	fallingObj = next;
	next = new TObject();
	holdV = false;
}