public class Zombie extends CharacterManager {
	
	float closestHumanDist = 0;
	int closestHumanId = -1;

	PVector wanderTarget;

	public Zombie() {
		PVector p = new PVector(random(0,width), random(0,height));
		Zombie(p, (int)random(maxSize/2,maxSize));
	}
	public Zombie(PVector p) {
		Zombie(p, (int)random(maxSize/2,maxSize));
	}
	public void Zombie(PVector p, int s) {
		position = p;
		wanderTarget = p.copy();
		velocity = new PVector();;
		objSize = s;
		objColor = color(0, random(63, 255), 0);

		addToGrid();
		objType = 2;
	}

	public void collision() {

		closestHumanId = -1;
		closestHumanDist = 9999;

		int xMax = (int)position.x/gridSize +2;
		int yMax = (int)position.y/gridSize +2;

		for (int x = (int)position.x/gridSize -1; x < xMax; ++x) {
			for (int y = (int)position.y/gridSize-1; y < yMax; ++y) {
				
				int x2 = warp(x, 0, gridX);
				int y2 = warp(y, 0, gridY);

				for (CharacterManager c : caracterGrid[gridX*y2+x2]) {

					if (c.objType == 1){
						int dist = objSize + c.objSize;
						dist = dist/2;

						float distance = position.dist(c.position);

						if(distance > dist) {
							if (closestHumanDist > distance) {
								closestHumanDist = distance;
								closestHumanId = c.id;
							}
							continue;
						} else { //turn tagert into zombie
							c.removeFromGrid();
							int cId = c.id;
							c = new Zombie(c.position);
							c.id = cId;
							caracters[cId] = c;
							
							return;
						}
					}
				}
			}
		}
	}

	public void edgeCollision() {
		position.x = warp(position.x, 0, width);
		position.y = warp(position.y, 0, height);
	}

	PVector unwarp(PVector n){
		float[] xWarps = new float[] {n.x, n.x - width , n.x + width };
		float[] yWarps = new float[] {n.y, n.y - height, n.y + height};

		float min = 99999;
		int minId = 0;

		for (int i = 0; i < xWarps.length; ++i) {
			float abs = abs(xWarps[i])+ abs(yWarps[i]);
			if (min > abs){
				min = abs;
				minId = i;
			}
		}

		n.x = xWarps[minId];
		n.y = yWarps[minId];

		return n;

	}

	public void move() {

		if (closestHumanId == -1) { //wander AI
			if ((frameCount&0xF) == (id&0xF)) {
				wanderTarget.x += random(-10, 10);
				wanderTarget.y += random(-10, 10);
			}

			velocity.x = wanderTarget.x - position.x;
			velocity.y = wanderTarget.y - position.y;

		} else { //hunt AI
			//line(position.x, position.y, caracters[closestHumanId].position.x, caracters[closestHumanId].position.y); //show targeting

			velocity.x = caracters[closestHumanId].position.x - position.x;
			velocity.y = caracters[closestHumanId].position.y - position.y;

			//unwarp
			//velocity = unwarp(velocity); //enables tarket on otherside of the screen

		}
		velocity.limit(zombieSpeed);

		position.x += velocity.x;
		position.y += velocity.y;

		edgeCollision();

		int g = gridX*((int)position.y/gridSize)+(int)position.x/gridSize;
		if (intGridPos != g)
			addToGrid(g);
	}

}