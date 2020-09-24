public class Human extends CharacterManager {
	
	PVector wanderTarget;

	public Human() {
		PVector p = new PVector(random(0,width), random(0,height));
		PVector v = new PVector(random(-maxSpeed,maxSpeed), random(-maxSpeed,maxSpeed));
		v.limit(maxSpeed);

		Human(p, v, (int)random(maxSize/2,maxSize), color(random(255)));
	}
	public void Human(PVector p, PVector v, int s, int c) {
		position = p;
		wanderTarget = p.copy();
		velocity = v;
		objSize = s;
		objColor = c;

		addToGrid();
		objType = 1;
	}

	public void edgeCollision() {
		position.x = warp(position.x, 0, width);
		position.y = warp(position.y, 0, height);
	}

	public void move() {
		//change tharget wander pos on a set offset based on id
		if ((frameCount&0xF) == (id&0xF)) {
			wanderTarget.x += random(-10, 10);
			wanderTarget.y += random(-10, 10);
			}

		//move character
		velocity.x = wanderTarget.x - position.x;
		velocity.y = wanderTarget.y - position.y;

		//limit speed
		velocity.limit(maxSpeed);

		//move character
		position.x += velocity.x;
		position.y += velocity.y;

		//check for screen warp
		edgeCollision();

		//check for canged grid pos
		int g = gridX*((int)position.y/gridSize)+(int)position.x/gridSize;
		if (intGridPos != g)
			addToGrid(g);
	}

}