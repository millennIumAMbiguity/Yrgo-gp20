boolean calculateLifeWork1Done = true;
boolean effectWork1Done = true;


void update() {
	arrayShift(cellsCalculate, cellsDraw);
	work();
	drawScreen();
	//drawFPS();
}
void updateThread1() {
	arrayShift(cellsCalculate, cellsDraw);
	calculateLifeWork1Done = false;
	thread("work");
	drawScreen();
	//drawFPS();
}

void drawFPS(){
	fill(0,50);
	rect(0,0,16,10);
	fill(255);
	text((int)(frameRate+0.5f), 0, 9);
}

void work() {
	for (Cell cell : cellsCalculate) {
		cell.life();
	}

	refreshLife();

	for (Cell cell : cellsCalculate) {
		cell.effect();
	}

	calculateLifeWork1Done = true;
}
