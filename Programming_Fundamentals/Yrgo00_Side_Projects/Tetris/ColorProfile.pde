int backgroundColor = 0;
int textNOutlines = color(255);

int getColor(int n){
	switch (n) {
		case 0:
		return color(255,255,0);
		case 1:
		return color(0,255,0);
		case 2:
		return color(255,0,0);
		case 3:
		return color(255,127,0);
		case 4:
		return color(0,0,255);
		case 5:
		return color(255,0,255);
		case 6:
		return color(127,127,255);
	}
	return color(0);
}