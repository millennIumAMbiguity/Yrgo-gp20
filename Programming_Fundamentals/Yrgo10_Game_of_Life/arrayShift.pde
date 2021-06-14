void arrayShift(Cell[] from, Cell[] target) {
	for (int i = 0; i < from.length; ++i) {
		from[i].copy(target[i]);
	}
}
void fullArrayShift(Cell[] from, Cell[] target) {
	for (int i = 0; i < from.length; ++i) {
		target[i] = from[i].fullCopy();
	}
}
void arrayShift(Cell[] array1, Cell[] array2, Cell[] array3) {
	arrayCopy(array2, array3);
	arrayShift(array1, array2);
}