void drawScreen() {
	
	if (width - boardSize > 0 && height - boardSize > 0) {
		if (size == 1) {
			loadPixels();
			int offset = width - boardSize - 1;
			for (int i = 0; i < boardLength; ++i) {
				pixels[i + (i >> shiftSize) * offset] = cellsDraw[i].cellColor;
			}
			updatePixels();
			return;
		} else if (size == 2) {
			if (width - boardSize - boardSize > 1 && height - boardSize - boardSize > 1) {
				loadPixels();
				int offset = width - boardSize - boardSize - 2;
				for (int i = 0; i < boardLength; ++i) {
					int index = i >> shiftSize;
					index = i + i + index * offset + index * width;
					
					pixels[index] = cellsDraw[i].cellColor;
					pixels[index + width] = cellsDraw[i].cellColor;
					index += 1;
					pixels[index] = cellsDraw[i].cellColor;
					pixels[index + width] = cellsDraw[i].cellColor;
				}
				updatePixels();
				return;
			}
		} else {
			if (width - boardSize * size > size - 1 && height - boardSize * size >= size - 1) {
				loadPixels();
				int offset = width - boardSize * size - size - boardSize - 1;
                int startOffset = offset/2 +
                ((height - boardSize - size - 1 - boardSize * size)/2*width);
				for (int i = 0; i < boardLength; ++i) {
					int index = i >> shiftSize;
					index = startOffset + i * size + i + index * offset + index * width * size;
					
					for (int y = 0; y < size; ++y) {
						for (int x = 0; x < size; ++x) {
							pixels[index + x] = cellsDraw[i].cellColor;
						}
                        index += width;
					}
					
				}
				updatePixels();
				return;
			}
		}
	}
	
	//slow
	for (Cell cell : cellsDraw) {
		cell.draw();
	}
	
	
}
