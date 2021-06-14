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
	int loopEnd = boardLength / 4;
	
	for (int i = 0; i < loopEnd; ++i) {
		cellsCalculate[i].life();
	}
	calculateLifeWork1Done = true;
}