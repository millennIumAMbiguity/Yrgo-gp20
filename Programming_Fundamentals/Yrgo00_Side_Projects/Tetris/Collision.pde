//collision and movment

boolean collision(){
	for (int i = 0; i < fallingObj.blocks.length; ++i) {
		if (fallingObj.blocks[i] == 1 && //floor collision
			i/4 + fallHeight > playAriaHeight+1 || 

			fallingObj.blocks[i] == 1 && //map collision
			i/4-2 + fallHeight >= 0 &&
			playAria[(i/4-2 + fallHeight)*playAriaWidth + i%4-2 + fallWidth] != 0)

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
		if (fallWidth + right > playAriaWidth){
			fallWidth--;
			mov--;
			if (fallWidth + right > playAriaWidth){
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