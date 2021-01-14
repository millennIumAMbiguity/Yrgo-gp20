void render() {
	background(0);
	ellipse   (position.x, position.y, size, size);
	if        (enableGravity) //draw floor
	 	line  (0, height-1, width, height-1);
}