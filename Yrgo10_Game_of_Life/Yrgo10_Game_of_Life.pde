
int shiftSize = 8; 
int boardSize;
int boardLength;
int size = 3;

Cell[] cellsCalculate;
Cell[] cellsEffect;
Cell[] cellsDraw;

void setup() {
	//noLoop();
	size(1024,1024);
	background(4);
	noStroke();
	surface.setResizable(true);
	
	boardSize = (1 << (shiftSize)) - 1;
	
	println("size : " + boardSize + "x" + boardSize);
	
	//create cells
	boardLength = (boardSize << shiftSize) + boardSize + 1;
	cellsCalculate = new Cell[boardLength];
	cellsEffect = new Cell[boardLength];
	cellsDraw = new Cell[boardLength];
	
	println("boardLength : " + boardLength);
	
	for (int i = 0; i < boardLength; ++i) {
		cellsCalculate[i] = new Cell(i);
	}
	
	//caculate all nabor cells
	for (Cell ce : cellsCalculate) {
		ce.getNabors();
	}
	
	
	
	fullArrayShift(cellsCalculate, cellsDraw);
	fullArrayShift(cellsCalculate, cellsEffect);
}

void draw() {
	//delay(500);
	//background(0);
	
	/*
	if (calculateLifeWork1Done && calculateLifeWork2Done && calculateLifeWork3Done && calculateLifeWork4Done && effectWork1Done && effectWork2Done && effectWork3Done && effectWork4Done)
	updateThread4();
	*/
	
	/*
	if (effectWork1Done && calculateLifeWork1Done)
	updateThread2();
	*/

	if (calculateLifeWork1Done)
	updateThread1();
	
	//update();
}