void render() {
	background(0);

	for (Ball o : list) {
		o.draw();
	}

	fill(255);
	ellipse(playerPosition.x, playerPosition.y, playerSize, playerSize);

	if(gameover){
		String format = String.format("%%0%dd", 2);
		long elapsedTime = time / 1000;
        String seconds = String.format(format, elapsedTime % 60);
        String minutes = String.format(format, (elapsedTime % 3600) / 60);
        String hours = String.format(format, elapsedTime / 3600);
        String timeString =  hours + ":" + minutes + ":" + seconds;

        textSize(64);
		text("Game Over", width/2 - textWidth("Game Over")/2, height/2);
		textSize(32);
		text(timeString, width/2 - textWidth(timeString)/2, height/2 + 32);

	}
}