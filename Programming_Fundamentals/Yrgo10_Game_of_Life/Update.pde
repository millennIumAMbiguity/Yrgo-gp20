boolean calculateLifeWork1Done = true;
boolean calculateLifeWork2Done = true;
boolean calculateLifeWork3Done = true;
boolean calculateLifeWork4Done = true;

boolean effectWork1Done = true;
boolean effectWork2Done = true;
boolean effectWork3Done = true;
boolean effectWork4Done = true;



void update() {
	arrayShift(cellsCalculate, cellsEffect, cellsDraw);
	work();
	drawScreen();
	drawFPS();
}
void updateThread1() {
	arrayShift(cellsCalculate, cellsDraw);
	calculateLifeWork1Done = false;
	thread("work");
	drawScreen();
	drawFPS();
}
void updateThread2() {
	arrayShift(cellsCalculate, cellsEffect, cellsDraw);
	
	calculateLifeWork1Done = false;
	effectWork1Done = false;
	
	thread("calculateLifeWork");
	thread("effectWork");
	drawScreen();
	drawFPS();
}
void updateThread4() {
	refreshLife();
	arrayShift(cellsCalculate, cellsEffect, cellsDraw);
	calculateLifeWork1Done = false;
	calculateLifeWork2Done = false;
	calculateLifeWork3Done = false;
	calculateLifeWork4Done = false;
	effectWork1Done = false;
	effectWork2Done = false;
	effectWork3Done = false;
	effectWork4Done = false;
	
	thread("calculateLifeWork1");
	thread("calculateLifeWork2");
	thread("calculateLifeWork3");
	thread("calculateLifeWork4");
	thread("effectWork1");
	thread("effectWork2");
	thread("effectWork3");
	thread("effectWork4");
	drawScreen();
	drawFPS();
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
