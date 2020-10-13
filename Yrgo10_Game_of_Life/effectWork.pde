void effectWork() {
	for (Cell cell : cellsEffect) {
		cell.effect();
	}
	effectWork1Done = true;
}

void effectWork1() {
	int loopStart = 0;
	int loopEnd = boardLength / 4;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsEffect[i].effect();
	}
	effectWork1Done = true;
}
void effectWork2() {
	int loopStart = boardLength / 4;
	int loopEnd = boardLength / 2;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsEffect[i].effect();
	}
	effectWork2Done = true;
}
void effectWork3() {
	int loopStart = boardLength / 2;
	int loopEnd = (int)(boardLength / 1.5f);
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsEffect[i].effect();
	}
	effectWork3Done = true;
}
void effectWork4() {
	int loopStart = (int)(boardLength / 1.5f);
	int loopEnd = boardLength;
	
	for (int i = loopStart; i < loopEnd; ++i) {
		cellsEffect[i].effect();
	}
	effectWork4Done = true;
}