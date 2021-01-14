int blockAmount = 7;

int[] getBlock(int n){
	switch (n) {
		case 0:
		return new int[]{
			0,0,0,0,
			0,1,1,0,
			0,1,1,0,
			0,0,0,0
		};
		case 1:
		return new int[]{
			0,1,0,0,
			0,1,1,0,
			0,0,1,0,
			0,0,0,0
		};
		case 2:
		return new int[]{
			0,0,1,0,
			0,1,1,0,
			0,1,0,0,
			0,0,0,0
		};
		case 3:
		return new int[]{
			0,1,1,0,
			0,0,1,0,
			0,0,1,0,
			0,0,0,0
		};
		case 4:
		return new int[]{
			0,1,1,0,
			0,1,0,0,
			0,1,0,0,
			0,0,0,0
		};
		case 5:
		return new int[]{
			0,0,0,0,
			1,1,1,0,
			0,1,0,0,
			0,0,0,0
		};
		case 6:
		return new int[]{
			0,1,0,0,
			0,1,0,0,
			0,1,0,0,
			0,1,0,0
		};
	}
	return null;
}