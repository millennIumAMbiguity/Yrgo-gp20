
public class TObject {
	public int[] blocks;
	int objColor;

	public TObject() {object((int)random(7));}
	public void object(int n) {
		objColor = getColor(n);
		switch (n) {
			case 0:
			blocks = new int[]{
				0,0,0,0,
				0,1,1,0,
				0,1,1,0,
				0,0,0,0
			};
			break;
			case 1:
			blocks = new int[]{
				0,1,0,0,
				0,1,1,0,
				0,0,1,0,
				0,0,0,0
			};
			break;
			case 2:
			blocks = new int[]{
				0,0,1,0,
				0,1,1,0,
				0,1,0,0,
				0,0,0,0
			};
			break;
			case 3:
			blocks = new int[]{
				0,1,1,0,
				0,0,1,0,
				0,0,1,0,
				0,0,0,0
			};
			break;
			case 4:
			blocks = new int[]{
				0,1,1,0,
				0,1,0,0,
				0,1,0,0,
				0,0,0,0
			};
			break;
			case 5:
			blocks = new int[]{
				0,0,0,0,
				1,1,1,0,
				0,1,0,0,
				0,0,0,0
			};
			break;
			case 6:
			blocks = new int[]{
				0,1,0,0,
				0,1,0,0,
				0,1,0,0,
				0,1,0,0
			};
			break;
		}
	}

	public void rotate(int n) {
		for (int i = 0; i < n; ++i) {
			blocks = new int[] {
					    0 ,blocks[ 8],blocks[4],	   0 ,
				blocks[13],blocks[ 9],blocks[5],blocks[1],
				blocks[14],blocks[10],blocks[6],blocks[2],
					    0 ,blocks[11],blocks[7],	   0
			};
		}
		if (moveSide(0) == 1000)
			rotate(4-n); //ctrl+z
	}

	public void draw(int x, int y, int scale) {
		fill(objColor);
		for (int i = 1; i < blocks.length-1; ++i) {
			if (blocks[i] == 1){
				rect((i%4-2)*scale + x, (i/4-2)*scale + y, scale, scale);
			}
		}
	}
	public void drawIn(int x, int y) {
		fill(objColor);
		for (int i = 1; i < blocks.length-1; ++i) {
			if (blocks[i] == 1 && i/4-2+fallHeight >= 0){
				rect((i%4-2)*scale + x, (i/4-2)*scale + y, scale, scale);
			}
		}
	}

}