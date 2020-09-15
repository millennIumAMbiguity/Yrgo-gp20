float heightSize;

void collision(){
	//screen     wrap  in x 
	position.x = position.x % width;
	if (position.x < 0)
	position.x = width - position.x;

	if (!enableGravity){
		//screen     wrap  in y 
		position.y = position.y % height;
		if (position.y < 0)
		position.y = height - position.y;
	}
	else {
		if  (position.y >    heightSize){
			if (input.y > 0)
				input.y = 		-input.y;
			if (input.y < 0.1 && input.y > -0.1)
				position.y = heightSize ;
		}
					
	}
}