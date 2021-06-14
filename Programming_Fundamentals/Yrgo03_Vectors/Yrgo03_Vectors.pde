//settings
float circleDiameter = 32f;
float lightSize = 13;
int gridSize = 32;


Vector velocity = new Vector(2, 2);
Vector position = new Vector(0, 0);
float cricleRadius;
float circleDiameterLightSize;

void setup()
{
	size(768, 432);
	background(0);
	noFill();
	stroke(255);
	
	position = new Vector(width / 2, height / 2);
	cricleRadius = circleDiameter / 2;
    circleDiameterLightSize = circleDiameter * lightSize;
}

void draw()
{
	background(0);
	
	if (mousePressed) {
		line(position.x, position.y, mouseX, mouseY);
		ellipse(position.x, position.y, circleDiameter + 1, circleDiameter + 1);
	} else {
		//Makethe circle bounce on the edges of the screen.
		position.add(velocity);
		if (position.x < cricleRadius || position.x > width - cricleRadius) {
			velocity.x = -velocity.x;
			position.add(velocity);
		}
		if (position.y < cricleRadius || position.y > height - cricleRadius) {
			velocity.y = -velocity.y;
			position.add(velocity);
		}
	}
	
	coolEffect();
	//text(frameRate,20,20);
	//ellipse(position.x, position.y, circleDiameter, circleDiameter); //Draw a circle (ellipse) on screen.
	
}

void mouseReleased() {
	
	Vector diffVector = new Vector(mouseX - position.x, mouseY - position.y); //Calculate the vector between the circle and the mouse.
	
	//Adjust thespeed in a way so it doesn't go too fast. But still make it so a longer line makes it go faster then a short line.
	diffVector.div(32);
	diffVector.limit(10); 
	
	velocity = new Vector(diffVector.x, diffVector.y); //Use the vector to give the circle direction (movement).
	//position = new Vector(mouseX, mouseY); //Teleport the circle to the mouse when you press the mouse button
}

void coolEffect() {
	loadPixels();
	
	Vector distCenterBase = new Vector(position.x - width / 2, position.y - height / 2);
	
	Vector distCenter = distCenterBase.copy();
	distCenter.square();
	float distCenterF = sqrt(distCenter.x + distCenter.y);
	
	//caculate angles for shadow.
	float circleangleBetweenLightAndPixel = atan2(distCenterBase.x, distCenterBase.y);
	
	float[] circleSides = {
		sin(circleangleBetweenLightAndPixel + HALF_PI) * cricleRadius,
		cos(circleangleBetweenLightAndPixel + HALF_PI) * cricleRadius};
	
	float angle1 = atan2(distCenterBase.x - circleSides[0], distCenterBase.y - circleSides[1]);
	float angle2 = atan2(distCenterBase.x + circleSides[0], distCenterBase.y + circleSides[1]);

    boolean angleCloseToZero = angle1 - angle2 > PI;
	
	for (int y = 0; y < height; y++) {   
		boolean yIsGrid = y % gridSize ==  0;
		int yMultWidth = y * width;
		for (int x = 0; x < width; x++) {
			
			//caculate normal and distance to circle
            boolean isInsideCircle = false;
			Vector distanceToCircle = position.copy();
            float distanceToCircleFloat = 0;
			distanceToCircle.sub(new Vector(x, y));
            Vector normal = distanceToCircle.copy();
            if (Math.abs(distanceToCircle.x) + Math.abs(distanceToCircle.y) < circleDiameter) {
                distanceToCircle.square();
                distanceToCircleFloat = sqrt(distanceToCircle.x + distanceToCircle.y);
                if (distanceToCircleFloat < cricleRadius)
                    isInsideCircle = true;
            }
			
			if (isInsideCircle) {
				
				normal = new Vector(norm(normal.x, 1, -1), norm(normal.y, 1, -1));
				
				//light derection
				Vector light = new Vector(width / 2 - x, height / 2 - y);
				light.limit(1);
				light.mult(normal);
				light.mult(max(distanceToCircleFloat,0));
				pixels[yMultWidth + x] = color(light.x + light.y + 127 * min(0,(cricleRadius) - (distanceToCircleFloat + 0.71f))); //light + anti aliasing
				
			} else if (yIsGrid || x % gridSize ==  0) {
				
				Vector distanceBetweenLightAndPixel = new Vector(x - width / 2, y - height / 2);
				
				float angleBetweenLightAndPixel = atan2(distanceBetweenLightAndPixel.x, distanceBetweenLightAndPixel.y);

				distanceBetweenLightAndPixel.square();
				float distanceBetweenLightAndPixelFloat = sqrt(distanceBetweenLightAndPixel.x + distanceBetweenLightAndPixel.y);
				
				if (angleCloseToZero) {
					if	(angleBetweenLightAndPixel < angle1 && angleBetweenLightAndPixel > angle2 || distanceBetweenLightAndPixelFloat < distCenterF)
						pixels[yMultWidth + x] = color(circleDiameterLightSize - distanceBetweenLightAndPixelFloat);
					else
						pixels[yMultWidth + x] = color(min(circleDiameterLightSize - distanceBetweenLightAndPixelFloat, 32));
				} else {
					if	(angleBetweenLightAndPixel < angle1 || angleBetweenLightAndPixel > angle2 || distanceBetweenLightAndPixelFloat < distCenterF)
						pixels[yMultWidth + x] = color(circleDiameterLightSize- distanceBetweenLightAndPixelFloat);
					else
						pixels[yMultWidth + x] = color(min(circleDiameterLightSize - distanceBetweenLightAndPixelFloat, 32));
				}
			}
		}
	}
	updatePixels();
}
