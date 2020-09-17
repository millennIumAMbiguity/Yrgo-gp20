void localDraw(){

	if (millis() >= time && !gameover){
		time = millis()+gameSpeed;
		move();
		render();
	} else if (updateScreen)
		render(); 
}