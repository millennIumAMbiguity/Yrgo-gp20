Vector velocity = new Vector(2, 2);
Vector position = new Vector(0, 0);

float circleDiameter = 32f;

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
		ellipse(position.x, position.y, circleDiameter+1, circleDiameter+1);

	} else {

		//Make the circle bounce on the edges of the screen.
		position.add(velocity);
		if (position.x < circleDiameter/2 || position.x > width - circleDiameter/2){
			velocity.x = -velocity.x;
			position.add(velocity);
		}
		if (position.y < circleDiameter/2 || position.y > height - circleDiameter/2){
			velocity.y = -velocity.y;
			position.add(velocity);
		}
	}

	coolEffect();

	//ellipse(position.x, position.y, circleDiameter, circleDiameter); //Draw a circle (ellipse) on screen.

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
    float circleangleBetweenLightAndPixel = atan2(position.x-width/2, position.y-height/2);

    float[] circleSides = {
    	sin(circleangleBetweenLightAndPixel + PI/2)* circleDiameter/2, cos(circleangleBetweenLightAndPixel + PI/2)* circleDiameter/2};

    float angle1 = atan2(position.x-width/2 - circleSides[0], position.y-height/2 - circleSides[1]);
    float angle2 = atan2(position.x-width/2 + circleSides[0], position.y-height/2 + circleSides[1]);

     for (int x = 0; x < width; x++) {
      for (int y = 0; y < height; y++) {   

      	//caculate normal and distance to circle
		Vector distanceToCircle = position.copy();
  		distanceToCircle.sub(new Vector(x, y));
  		Vector normal = distanceToCircle.copy();
  		distanceToCircle.square();
      	float distanceToCircleFloat = sqrt(distanceToCircle.x + distanceToCircle.y);

      	if (abs(distanceToCircleFloat) < circleDiameter/2){

      		normal = new Vector(norm(normal.x, 1, -1), norm(normal.y, 1, -1));

      		//light derection
	      	Vector light = new Vector(width/2-x,height/2-y);
	  		light.limit(1);
      		light.mult(normal);
  			light.mult(max(distanceToCircleFloat,0));
      		pixels[y*width + x] = color(light.x+light.y);

      	} else if (x%32==0 || y%32==0){
      		
	  		Vector distanceBetweenLightAndPixel = new Vector(x-width/2, y-height/2);

	  		float angleBetweenLightAndPixel = atan2(distanceBetweenLightAndPixel.x, distanceBetweenLightAndPixel.y);

	  		distanceBetweenLightAndPixel.square();
	 		float distanceBetweenLightAndPixelFloat = sqrt(distanceBetweenLightAndPixel.x + distanceBetweenLightAndPixel.y);
      		
     		if (angle1-angle2 > PI){
     			if ((angleBetweenLightAndPixel < angle1 && angleBetweenLightAndPixel > angle2) || distanceBetweenLightAndPixelFloat < distCenterF)
      				pixels[y*width + x] = color(circleDiameter*gridSize-distanceBetweenLightAndPixelFloat);
      			else 
		      		pixels[y*width + x] = color(min(circleDiameter*gridSize-distanceBetweenLightAndPixelFloat, 32));
     		} else {
     			if ((angleBetweenLightAndPixel < angle1 || angleBetweenLightAndPixel > angle2) || distanceBetweenLightAndPixelFloat < distCenterF)
      				pixels[y*width + x] = color(circleDiameter*gridSize-distanceBetweenLightAndPixelFloat);
      			else 
		      		pixels[y*width + x] = color(min(circleDiameter*gridSize-distanceBetweenLightAndPixelFloat, 32));
     		}
      	} 
      }
    }
  updatePixels();
}
