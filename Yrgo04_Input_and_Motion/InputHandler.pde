
static PVector input = new PVector();

public static class InputHandler {

	private static boolean moveLeft, moveRight, moveUp, moveDown;

	//Key pressed, set our variables to true
	public static  void inputKeyPressed(int keyCode, char key)
	{
		if 		(keyCode == LEFT  || key == 'a')
			moveLeft 	 = true;
		else if (keyCode == RIGHT || key == 'd')
			moveRight 	 = true;
		else if (keyCode == UP 	  || key == 'w')
			moveUp 		 = true;
		else if (keyCode == DOWN  || key == 's')
			moveDown 	 = true;
		else if (					 key == 'g')
			enableGravity = !enableGravity;
	}

	//When a key is released, we will set our variable to false
	public static  void inputKeyReleased(int keyCode, char key)
	{
		if 		(keyCode == LEFT  || key == 'a')
			moveLeft 	 = false;
		else if (keyCode == RIGHT || key == 'd')
			moveRight 	 = false;
		else if (keyCode == UP 	  || key == 'w')
			moveUp 		 = false;
		else if (keyCode == DOWN  || key == 's')
			moveDown 	 = false;
	}

	//convert input to velocity
	public static  void inputCalculation() {
		input.x += 												   input(moveRight, moveLeft, input.x);
		input.y += enableGravity ? gravityInput(moveUp, input.y) : input(moveDown,  moveUp,   input.y);

		input = clamp(input, maxSpeed); //max speed
	}
	//acceleration or deceleration to 0
	private static float input(boolean bPositive, boolean bNegative, float inputVelosity){
		if 		(bPositive) return  					 acceleration  * deltaTime;
		else if (bNegative) return -					 acceleration  * deltaTime;
		else 				return -clamp(inputVelosity, acceleration) * deltaTime; 
	}
	//gravity velocity
	private static float gravityInput(boolean jump, float inputVelosity){
		float v = gravity;
		if (jump) {if   (inputVelosity < 0) v -=           acceleration;}
		else  v -= clamp(inputVelosity +    v * deltaTime, acceleration);
		return 							    v * deltaTime;
	}
	//clamps for float and PVector
	private static float   clamp(float   v, float max, float min) {return max(min(v, max), min);									   }
	private static float   clamp(float   v, float maxAndMin) 	  {return max(min(v, maxAndMin), 			     -maxAndMin);		   }
	private static PVector clamp(PVector v, float max, float min) { v.x = clamp(v.x, max,  min); v.y = clamp(v.y, max,  min); return v;}
	private static PVector clamp(PVector v, float maxAndMin) 	  { v.x = clamp(v.x, maxAndMin); v.y = clamp(v.y, maxAndMin); return v;}


}