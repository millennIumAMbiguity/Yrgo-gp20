	   int 	   size 		 = 16;
static float   acceleration  = 1;
static float   maxSpeed 	 = 8;
static float   gravity 		 = 9.8f; //9.80665
static boolean enableGravity = false;

static float   deltaTime;
	   long    time;

void setup()
{
  size  (640,480);
  stroke(255);
  fill  (0);
  position   = new PVector(width/2, height/2);
  time 		 = millis();
  heightSize = height - size/2 - 1;
}

void draw()
{
	//cacluate deltaTime
	long currentTime = millis();
	deltaTime = (currentTime - time) * 0.001f;

	InputHandler.inputCalculation();
	movement  ();
	collision ();
	render    ();

	time = currentTime;
}


//Key pressed, set our variables to true
void keyPressed () {InputHandler.inputKeyPressed (keyCode, key);}
//When a key is released, we will set our variable to false
void keyReleased() {InputHandler.inputKeyReleased(keyCode, key);}

