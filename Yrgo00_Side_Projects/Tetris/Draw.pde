void localDraw(){

	if (millis() >= time && !gameover){
		time = millis()+gameSpeed;
		 move();
	}

	render(); //todo: optimize so that it only render when needed
}