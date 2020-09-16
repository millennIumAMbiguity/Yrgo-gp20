
	//Key pressed, set our variables to true
	void inputKeyPressed()
	{
		if 		(keyCode == LEFT  || key == 'a')
			moveSide(-1);
		else if (keyCode == RIGHT || key == 'd')
			moveSide(1);
		else if (keyCode == UP 	  || key == 'w')
			{fallingObj.rotate(1);}
		else if (keyCode == DOWN  || key == 's')
			{fallingObj.rotate(3);}
		else if (key 	 == 32) //Hard drop
			addScore(2 * place(), 0); 
		else if (keyCode == SHIFT || key == 'h'){ //hold
			if (!holdV) {
				holdV = true;
				if (hold == null){
					hold = fallingObj;
					resetObj();
				} else {
					TObject temp = fallingObj;
					fallingObj = hold;
					hold = temp;
					resetFall();
				}
			}}
		else if (keyCode == CONTROL) { //soft drop
			if (move())
				addScore(1, 0);
		}
	}
