Vector velocity = new Vector(2, 2);
Vector position = new Vector(0, 0);

float size = 32f;

void setup()
{
  size(768, 432);
  background(0);
  fill(0);
  stroke(255);

  position = new Vector(width/2, height/2);
}
void draw()
{
	background(0);

	if (mousePressed){

		line(position.x, position.y, mouseX, mouseY);

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

	ellipse(position.x, position.y, size, size); //Draw a circle (ellipse) on screen.
}
void mouseReleased(){

	Vector diffVector = new Vector(mouseX - position.x, mouseY - position.y); //Calculate the vector between the circle and the mouse.

	//Adjust the speed in a way so it doesn't go too fast. But still make it so a longer line makes it go faster then a short line.
	diffVector.div(32);
	diffVector.limit(10); 

	velocity = new Vector(diffVector.x, diffVector.y); //Use the vector to give the circle direction (movement).
	position = new Vector(mouseX, mouseY); //Teleport the circle to the mouse when you press the mouse button
}
