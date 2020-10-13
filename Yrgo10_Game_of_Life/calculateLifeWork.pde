void calculateLifeWork() {
	for (Cell cell : cellsCalculate) {
		cell.life();
	}
	
	refreshLife();

	calculateLifeWork1Done = true;
}

void refreshLife() {
	for (Cell cell : cellsCalculate) {
		cell.refreshLife();
	}
}

void calculateLifeWork1() {
	int loopStart = 0;
	int loopEnd = boardLength / 4;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsCalculate[i].life();
	}
	calculateLifeWork1Done = true;
}
void calculateLifeWork2() {
	int loopStart = boardLength / 4;
	int loopEnd = boardLength / 2;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsCalculate[i].life();
	}
	calculateLifeWork2Done = true;
}
void calculateLifeWork3() {
	int loopStart = boardLength / 2;
	int loopEnd = (int)(boardLength / 1.5f);
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsCalculate[i].life();
	}
	calculateLifeWork3Done = true;
}
void calculateLifeWork4() {
	int loopStart = (int)(boardLength / 1.5f);
	int loopEnd = boardLength;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsCalculate[i].life();
	}
	calculateLifeWork4Done = true;
}