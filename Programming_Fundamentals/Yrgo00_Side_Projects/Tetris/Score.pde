void addScore(int s, int lines){

	switch (lines) {
		case 1:
		s += 40;
		break;
		case 2:
		s += 100;
		break;
		case 3:
		s += 300;
		break;
		case 4:
		s += 1200; //a tetris
		break;
	}
	

	score += s*(level+1);
	linesCleared+=lines;

	if (linesCleared >= linesForNextLevel){
		level++;
		linesForNextLevel += 10;
		gameSpeed();
	}
}

void gameSpeed(){
	switch (level) {
		case 0:
		gameSpeed = 800L;
		break;
		case 1:
		gameSpeed = 717L;
		break;
		case 2:
		gameSpeed = 633L;
		break;
		case 3:
		gameSpeed = 550L;
		break;
		case 4:
		gameSpeed = 467L;
		break;
		case 5:
		gameSpeed = 383L;
		break;
		case 6:
		gameSpeed = 300L;
		break;
		case 7:
		gameSpeed = 217L;
		break;
		case 8:
		gameSpeed = 133L;
		break;
		case 9:
		gameSpeed = 100L;
		break;
		default :
			if (level < 13)
				gameSpeed = 83L;
			else if (level < 16)
				gameSpeed = 67L;
			else if (level < 19)
				gameSpeed = 50L;
			else if (level < 29)
				gameSpeed = 33L;
			else 
				gameSpeed = 17L;

		break;
	}
}
