public class Vector {
	public float x;
	public float y;

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

	public void div(int n){ div((float)n); }
	public void div(float n){
		x /= n;
		y /= n;
	}
	public void div(Vector v){
		x /= v.x;
		y /= v.y;
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
}