

float player1Velocity;
float player1Position;
float player2Velocity;
float player2Position;

PVector ballVelocity;
PVector ballPosition;

int ballSize = 8;

int playerSize = 10;

float acceleration = 2f;

float speedDifault = 4f;
float speed = 4f;
float speedAcceleration = 0.5f;

int player1Points;
int player2Points;

int player1Controls, player2Controls;
boolean ai1 = true, ai2 = true;

void setup()
{
  //size(768, 432);
  fullScreen();
  stroke(255);
  textSize(64);

  player1Position = player2Position = height/2;
  resetBall();
}

void draw()
{
	inputs();
	movment();
	colision();
	drawScreen();
}

void inputs(){
	if (ai1){
		//float prediction = abs(( ballPosition.y + (width/8 - ballPosition.x)* ballVelocity.x * ballVelocity.y ) % height);
		player1Controls = (int)(norm(ballPosition.y-player1Position,-1,1)+0.5);
	} 
	player1Velocity *= 0.5;
	player1Velocity += acceleration * player1Controls;
	player1Velocity = constrain(player1Velocity, -4, 4);

	if (ai2){
		//float prediction = abs(( ballPosition.y + (ballPosition.x-width-width/8)* ballVelocity.x * ballVelocity.y ) % height);
		float prediction =   abs(abs(ballPosition.y + (width-width/8-ballPosition.x) /  ballVelocity.x * ballVelocity.y ) *-1 + height )*-1 + height;
		player2Controls = (int)(norm(prediction-player2Position,-1,1)+0.5);
	} 
	player2Velocity *= 0.5;
	player2Velocity += acceleration * player2Controls;
	player2Velocity = constrain(player2Velocity, -4, 4);
}

void movment(){
	ballPosition.add(ballVelocity);
	player1Position = min(height - playerSize, max(playerSize, player1Position + player1Velocity));
	player2Position = min(height - playerSize, max(playerSize, player2Position + player2Velocity));
}

void colision(){

	if (ballPosition.y <= ballSize/2 || ballPosition.y >= height-ballSize/2)
		ballVelocity.y = -ballVelocity.y;

	if (ballPosition.x < width/8 + ballSize){

		if (ballPosition.x > width/8 - ballSize && 
			player1Position + playerSize + ballSize >= ballPosition.y && player1Position - playerSize - ballSize <= ballPosition.y &&
			ballVelocity.x < 0){

			ballVelocity = new PVector(ballPosition.x - width/8, ballPosition.y - player1Position);
			ballVelocity.mult(speed);
			ballVelocity.limit(speed);
			speed += speedAcceleration;
		} else if (ballPosition.x < 16){
			player2Points++;
			resetBall();
		}


	} else if (ballPosition.x > width-width/8 - ballSize){

		if (ballPosition.x < width-width/8 + ballSize && 
			player2Position + playerSize + ballSize >= ballPosition.y && player2Position - playerSize - ballSize <= ballPosition.y &&
			ballVelocity.x > 0){

			ballVelocity = new PVector(ballPosition.x - width - width/8, ballPosition.y - player2Position);
			ballVelocity.mult(speed);
			ballVelocity.limit(speed);
			speed += speedAcceleration;
		} else if (ballPosition.x > width-16){
			player1Points++;
			resetBall();
		}

	}

}

void resetBall(){

	speed = speedDifault;

	ballPosition = new PVector(width/2, height/2);
	if (random(0,100) < 50)
		ballVelocity = new PVector(2,random(-4,4));
	else
		ballVelocity = new PVector(-2,random(-4,4));
}


void drawScreen(){
	background(0);

	line(width/2, 16, width/2, height-16);

	text(player1Points, width/4, 80);
	text(player2Points, width-width/4, 80);

	ellipse(ballPosition.x, ballPosition.y, ballSize, ballSize);

	rect(width/8-4, player1Position - playerSize, 4, playerSize*2);
	rect(width-width/8-4, player2Position - playerSize, 4, playerSize*2);
}


void keyPressed() {
  keyCodeInput(keyCode, true);
  keyInput(key, true);
}
 
void keyReleased() {
  keyCodeInput(keyCode, false);
  keyInput(key, false);
}
 
void keyCodeInput(int k, boolean b) {
  switch (k) {
  case UP:
  	if (b)
    	player2Controls = -1;
    else
    	player2Controls = 0;
    ai2 = false;
 	break;
  case DOWN:
    if (b)
    	player2Controls = 1;
    else
    	player2Controls = 0;
    ai2 = false;
    break;

  }
}
void keyInput(int k, boolean b) {
  switch (k) {
  case 'w':
    if (b)
    	player1Controls = -1;
    else
    	player1Controls = 0;
    ai1 = false;
    break;
 
  case 's':
    if (b)
    	player1Controls = 1;
    else
    	player1Controls = 0;
    ai1 = false;
    break;
 
  }
}