
int shiftSize = 8; //board weight and height == 2^<shiftSize>
int size = 3;      //cell size


int boardSize;
int boardLength;

Cell[] cellsCalculate;
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
}

void draw() {
	//delay(500);
	//background(0);

	if (calculateLifeWork1Done)
	updateThread1();
	
	//update();
}