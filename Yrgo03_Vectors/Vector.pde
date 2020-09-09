public class Vector {
	public float x = 0;
	public float y = 0;

	public Vector(float x, float y) {
		this.x = x;
		this.y = y;
	}

	public void add(int n){ add((float)n); }
	public void add(float n){
		x += n;
		y += n;
	}
	public void add(Vector v){
		x += v.x;
		y += v.y;
	}

	public void sub(int n){ add((float)n); }
	public void sub(float n){
		x -= n;
		y -= n;
	}
	public void sub(Vector v){
		x -= v.x;
		y -= v.y;
	}

	public void div(int n){ div((float)n); }
	public void div(float n){
		x /= n;
		y /= n;
	}
	public void div(Vector v){
		x /= v.x;
		y /= v.y;
	}

	public void mult(int n){ div((float)n); }
	public void mult(float n){
		x *= n;
		y *= n;
	}
	public void mult(Vector v){
		x *= v.x;
		y *= v.y;
	}

	public void square() {
		x *= x;
		y *= y;
	}

	public void sqrtt() {
		x = sqrt(x);
		y = sqrt(y);
	}


	public void limit(int n){ limit((float)n); }
	public void limit(float n){
		float max = max(new float[] {x, y, -x, -y});
		float div = n/max;
		//div = max(div, 1);
		if (div < 1){
			x *= div;
			y *= div;
		}
	}

	public void crop(int min, int max) {
		x = max(min, min(max, x));
		y = max(min, min(max, y));
	}
	
	public Vector copy() {
		return new Vector(x, y);
	}

}