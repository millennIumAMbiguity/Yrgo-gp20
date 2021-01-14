static int 	   playerSize		= 16;
static float   acceleration 	= 1;
static float   maxSpeed 		= 8;

static float   deltaTime;
	   long    time;
	   long	   nextBall;

static boolean gameover;

static ArrayList<Ball> list 	= new ArrayList<Ball>();
static int 	   ballAmount;

void setup()
{
  size  (640,480);
  stroke(255);
  fill  (0);
  playerPosition = new PVector(width/2, height/2);
  time = millis();
  nextBall = time + 3000L;

  //spawn balls
  for (int i = 0; i < 10; ++i) {
  	list.add(new Ball());
  }
}

void draw()
{
	if (!gameover){
		//cacluate deltaTime
		long currentTime = millis();
		deltaTime = (currentTime - time) * 0.001f;
		if (ballAmount <= 100 && time >= nextBall){ //spawn a ball
			list.add(new Ball());
			nextBall = time + 3000L;
		}
		time = currentTime;

		InputHandler.inputCalculation();
		movement  ();
		collision ();
	}
	render();

	
}


//Key pressed, set our variables to true
void keyPressed () {InputHandler.inputKeyPressed (keyCode, key);}
//When a key is released, we will set our variable to false
void keyReleased() {InputHandler.inputKeyReleased(keyCode, key);}

