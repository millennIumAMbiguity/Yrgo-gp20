float heightSize;

void collision(){
	//screen     wrap  in x 
	playerPosition.x = playerPosition.x % width;
	if (playerPosition.x < 0)
	playerPosition.x = width - playerPosition.x;

	//screen     wrap  in y 
	playerPosition.y = playerPosition.y % height;
	if (playerPosition.y < 0)
	playerPosition.y = height - playerPosition.y;
					
	
	for (Ball o : list) {
		o.collision();
	}
}