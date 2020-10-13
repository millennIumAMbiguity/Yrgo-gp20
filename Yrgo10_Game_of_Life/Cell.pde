public class Cell {
	int state;
	int nextState;
	int col;
	int cellColor;
	int id;
	
	int posX, posY;
	
	int[] nabors = new int[8];
	
	Cell(int i) {
		id = i;
		posX = id & boardSize;
		posY = id >> shiftSize;
		
		state = ((int)random(4)) == 0 ? 1 : 0; 
		//state = (id&128)>>7;
		nextState = state;
	}
	Cell() {}
	void getNabors() {
		int c = 0;
		for (int _x = posX - 1; _x < posX + 2; ++_x) {
			for (int _y = posY - 1; _y < posY + 2; ++_y) { 
				if (_x != posX || _y != posY) {
					nabors[c++] = ((_y & boardSize) << shiftSize) + (_x & boardSize);
				}
			}
		}
	}
	void life() {
		col = 0;
		for (int cId : nabors) {
			col += cellsCalculate[cId].state;
		}
		
		if (col == 2) {
			return;
		}
		if (col == 3) {
			nextState = 1; 
			return;
		}
		nextState = 0; 
	}
	void refreshLife() {
		cellColor = (state - nextState)<<15;
		state = nextState;
	}
	void effect() {
		cellColor += 28 * col + ((28 * col)<<8) + ((28 * col)<<16) + (28<<24);
		//col = color(col * 28, 28);
	}
	void draw() {
		//if (state == 1) {
		fill(cellColor);
		square(posX * size, posY * size, size);
		//}
	}

	void copy(Cell cell) {
		//cell.state = state;
		cell.col = col;
		cell.cellColor = cellColor;
		cell.posX = posX;
		cell.posY = posY;
	}

	Cell fullCopy() {
		Cell cell = new Cell();
		cell.state = state;
		cell.nextState = nextState;
		cell.col = col;
		cell.cellColor = cellColor;
		cell.id = id;
		cell.posX = posX;
		cell.posY = posY;
		cell.nabors = nabors; 
		return cell;
	}
}