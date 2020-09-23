public class CharacterManager 
{

	int objType;

	int objSize;
	int objColor;
	PVector position;
	PVector velocity;

	int intGridPos = -1;
	public int id;

	public CharacterManager() {

		PVector p = new PVector(random(0,width), random(0,height));
		PVector v = new PVector(random(-maxSpeed,maxSpeed), random(-maxSpeed,maxSpeed));
		v.limit(maxSpeed);

		CharacterManager(p, v, (int)random(maxSize/2,maxSize), color(random(255),random(255),random(255)));
	}
	public void CharacterManager(PVector p, PVector v, int s, int c) {
		position = p;
		velocity = v;
		objSize = s;
		objColor = c;

		addToGrid();
	}

	void addToGrid(){
		removeFromGrid();

		intGridPos = gridX*((int)position.y/gridSize)+(int)position.x/gridSize;
		caracterGrid[intGridPos].add(this);
	}
	void addToGrid(int g){
		removeFromGrid();

		intGridPos = g;
		caracterGrid[intGridPos].add(this);
	}
	public void removeFromGrid(){
		if (intGridPos != -1){
			caracterGrid[intGridPos].remove(this);
			intGridPos = -1;
		}
	}

	public void collision() {
	}

	public void edgeCollision() {
		//bounce collision
		if ((position.x > width  - objSize/2) || (position.x < objSize/2)) {
		    velocity.x = -velocity.x;
		    position.x = constrain(position.x, objSize/2, width  - objSize/2);
		    position.y = constrain(position.y, objSize/2, width  - objSize/2);
		}
		if ((position.y > height - objSize/2) || (position.y < objSize/2)) {
		    velocity.y = -velocity.y; 
		    position.x = constrain(position.x, objSize/2, width  - objSize/2);
		    position.y = constrain(position.y, objSize/2, width  - objSize/2);
		}
	}
	public void move() {
		position.x += velocity.x;
		position.y += velocity.y;

		edgeCollision();

		int g = gridX*((int)position.y/gridSize)+(int)position.x/gridSize;
		if (intGridPos != g)
			addToGrid(g);
	}
	public void draw() {
		fill(objColor);
		ellipse(position.x, position.y, objSize, objSize);
	}

	float warp(float n, float min, float max){
		if (n < min){
			n += max;
		} else {
			n = n % max; 
		}
		return n;
	}
	int warp(int n, int min, int max){
		if (n < min){
			n += max;
		} else {
			n = n % max; 
		}
		return n;
	}
}