public class Ball {
	int size;
	int ballColor;
	PVector pos;
	PVector vel;
	PVector nextVel;

	float mass;

	public Ball() {

		PVector p = new PVector(random(0,width), random(0,height));
		while (p == null || 
			p.x < playerPosition.x - playerSize*2 && p.x > playerPosition.x + playerSize*2 && 
			p.y < playerPosition.y - playerSize*2 && p.y > playerPosition.y + playerSize*2)
		p = new PVector(random(0,width), random(0,height));

		PVector v = new PVector(random(-maxSpeed,maxSpeed), random(-maxSpeed,maxSpeed));
		v.limit(maxSpeed);

		ball(p, v, (int)random(playerSize/2,playerSize*2), color(random(255),random(255),random(255)));
	}
	public void ball(PVector p, PVector v, int s, int c) {
		pos = p;
		vel = v;
		size = s;
		ballColor = c;

		mass = (s/2)*(s/2)*PI;
		ballAmount++;
	}
	public void collision() {

		{ // player collision
			float dist = pos.dist(playerPosition);
			if (dist <= playerSize/2 + size/2){
				gameover = true;
				return;
			}
		}

		//bounce collision
		if ((pos.x > width  - size/2) || (pos.x < size/2)) {
		    vel.x = -vel.x;
		    pos.x = constrain(pos.x, size/2, width  - size/2);
		    pos.y = constrain(pos.y, size/2, width  - size/2);
		    return;
		}
		if ((pos.y > height - size/2) || (pos.y < size/2)) {
		    vel.y = -vel.y; 
		    pos.x = constrain(pos.x, size/2, width  - size/2);
		    pos.y = constrain(pos.y, size/2, width  - size/2);
		    return;
		}

		for (Ball o : list) {
			if (o != this){
				float dist = pos.dist(o.pos);
				if (dist <= size/2 + o.size/2){
					//ball collision

					//calculate new position
					nextVel = new PVector(
						(  vel.x * (mass - o.mass) + (2 *   mass * o.vel.x))/(o.mass + mass),
						(  vel.y * (mass - o.mass) + (2 *   mass * o.vel.y))/(o.mass + mass));
					o.nextVel = new PVector(
						(o.vel.x * (o.mass - mass) + (2 * o.mass *   vel.x))/(o.mass + mass),
						(o.vel.y * (o.mass - mass) + (2 * o.mass *   vel.y))/(o.mass + mass));

					return;
				}
			}
		}
	}
	public void move() {
		pos.x += vel.x * deltaTime;
		pos.y += vel.y * deltaTime;
	}
	public void draw() {
		fill(ballColor);
		ellipse(pos.x, pos.y, size, size);
		if (nextVel != null){
			vel = nextVel;
			nextVel = null;
		}
	}

}