Vector velocity = new Vector(2, 2);
Vector position = new Vector(0, 0);

float size = 32f;

void setup()
{
  size(768, 432);
  background(0);
  noFill();
  stroke(255);

  position = new Vector(width/2, height/2);
}
void draw()
{
	background(0);

	if (mousePressed){

		line(position.x, position.y, mouseX, mouseY);
		ellipse(position.x, position.y, size+1, size+1);

	} else {

		//Make the circle bounce on the edges of the screen.
		position.add(velocity);
		if (position.x < size/2 || position.x > width - size/2){
			velocity.x = -velocity.x;
			position.add(velocity);
		}
		if (position.y < size/2 || position.y > height - size/2){
			velocity.y = -velocity.y;
			position.add(velocity);
		}
	}

	coolEffect();

	//ellipse(position.x, position.y, size, size); //Draw a circle (ellipse) on screen.
}
void mouseReleased(){

	Vector diffVector = new Vector(mouseX - position.x, mouseY - position.y); //Calculate the vector between the circle and the mouse.

	//Adjust the speed in a way so it doesn't go too fast. But still make it so a longer line makes it go faster then a short line.
	diffVector.div(32);
	diffVector.limit(10); 

	velocity = new Vector(diffVector.x, diffVector.y); //Use the vector to give the circle direction (movement).
	//position = new Vector(mouseX, mouseY); //Teleport the circle to the mouse when you press the mouse button
}

float gridSize = 13;
void coolEffect() {
	loadPixels();

	
	Vector distCenter = new Vector(position.x-width/2, position.y-height/2);
	distCenter.square();
     float distCenterF = sqrt(distCenter.x + distCenter.y);
  	
  	//caculate angles for shadow.
    float ballAng = atan2(position.x-width/2, position.y-height/2);

    float[] ballSides = {
    	sin(ballAng + PI/2)* size/2, cos(ballAng + PI/2)* size/2};

    float angle1 = atan2(position.x-width/2 - ballSides[0], position.y-height/2 - ballSides[1]);
    float angle2 = atan2(position.x-width/2 + ballSides[0], position.y-height/2 + ballSides[1]);

     for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {   

      	//caculate normal and distance to ball
		Vector ditanceToBall = position.copy();
  		ditanceToBall.sub(new Vector(x, y));
  		Vector normal = ditanceToBall.copy();
  		ditanceToBall.square();
      	float dist = sqrt(ditanceToBall.x + ditanceToBall.y);

      	float ang = atan2(x-width/2, y-height/2);
  		Vector lDistCenter = new Vector(x-width/2, y-height/2);
  		lDistCenter.square();
 		float lDistCenterF = sqrt(lDistCenter.x + lDistCenter.y);

      	if (abs(dist) < size/2){

      		normal = new Vector(norm(normal.x, 1, -1), norm(normal.y, 1, -1));

      		//light derection
	      	Vector light = new Vector(width/2-x,height/2-y);
	  		light.limit(1);
      		light.mult(normal);
  			light.mult(max(dist,0));
      		pixels[y*width + x] = color(light.x+light.y);

      	} else if ((x)%32==0 || (y)%32==0){
      		
      		Vector localDistanceToCenterVector = new Vector(width/2, height/2);
	  		localDistanceToCenterVector.sub(new Vector(x, y));
	  		localDistanceToCenterVector.square();
	      	float localDistanceToCenter = sqrt(localDistanceToCenterVector.x + localDistanceToCenterVector.y);

      		
     		if (angle1-angle2 > PI){
     			if ((ang < angle1 && ang > angle2) || lDistCenterF < distCenterF)
      				pixels[y*width + x] = color(size*gridSize-localDistanceToCenter);
      			else 
		      		pixels[y*width + x] = color(min(size*gridSize-localDistanceToCenter, 32));
     		} else {
     			if ((ang < angle1 || ang > angle2) || lDistCenterF < distCenterF)
      				pixels[y*width + x] = color(size*gridSize-localDistanceToCenter);
      			else 
		      		pixels[y*width + x] = color(min(size*gridSize-localDistanceToCenter, 32));
     		}
      	} 
      }
    }
  updatePixels();
}
