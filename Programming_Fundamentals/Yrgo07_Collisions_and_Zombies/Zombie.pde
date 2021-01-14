public class Zombie extends CharacterManager {
	
	float closestHumanDist = 0;
	int closestHumanId = -1;
	PVector closestHumanPos = new PVector();

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

		//get 3x3 grids from the grid
		int xMax = (int)position.x/gridSize +2;
		int yMax = (int)position.y/gridSize +2;

		for (int x = (int)position.x/gridSize -1; x < xMax; ++x) {
			for (int y = (int)position.y/gridSize-1; y < yMax; ++y) {
				
				//warp grid box pos
				int x2 = warp(x, 0, gridX);
				int y2 = warp(y, 0, gridY);

				//for each caracter in current grid box
				for (CharacterManager c : caracterGrid[gridX*y2+x2]) {

					//only humans
					if (c.objType == 1){
						//distance for infection
						int dist = objSize + c.objSize;
						dist = dist/2;

						//obj distance
						float distance = position.dist(c.position);

						if(distance > dist) {
							//check if target is closest human
							if (closestHumanDist > distance) {
								closestHumanDist = distance;
								closestHumanId = c.id;

								//get unwarped position
								closestHumanPos.x = x*gridSize + (c.position.x % gridSize);
								closestHumanPos.y = y*gridSize + (c.position.y % gridSize);

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

	public void move() {

		if (closestHumanId == -1) { //wander AI
			//change tharget wander pos on a set offset based on id
			if ((frameCount&0xF) == (id&0xF)) {
				wanderTarget.x += random(-10, 10);
				wanderTarget.y += random(-10, 10);
			}

			//move character
			velocity.x = wanderTarget.x - position.x;
			velocity.y = wanderTarget.y - position.y;

		} else { //hunt AI
			//line(position.x, position.y, caracters[closestHumanId].position.x, caracters[closestHumanId].position.y); //show targeting

			velocity = closestHumanPos;

			velocity.sub(position);

		}
		//limit speed
		velocity.limit(zombieSpeed); 

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