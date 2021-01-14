void render(){
	background(backgroundColor);

	//todo: optimize

	//score
	fill(textNOutlines);
	textSize(18);
	String str = Integer.toString(score);
	float tw = textWidth(str);
	text(str, width/2-tw/2, offsetY-2);

	textSize(12);

	//HOLD 
	text("HOLD", offsetX - scale - scale - textWidth("HOLD")/2, offsetY + 12);
	if (hold != null)
		hold.draw(offsetX - scale - scale, offsetY + scale + 14, scale/2);

	//NEXT object 
	fill(textNOutlines);
	text("NEXT", offsetX + (playAriaWidth+2)*scale - textWidth("NEXT")/2, offsetY + 12);
	next.draw(offsetX + (playAriaWidth+2)*scale, offsetY + scale + 14, scale/2);

	//LEVEL text
	fill(textNOutlines);
	text("LEVEL", offsetX + (playAriaWidth+2)*scale - textWidth("LEVEL")/2, offsetY + scale*4 + 12);
	str = Integer.toString(level);
	text(str, offsetX + (playAriaWidth+2)*scale - textWidth(str)/2, offsetY + scale*4 + 24);

	//level blocks rendering
	for (int i = 0; i < playAria.length; ++i) {
		if (playAria[i] != 0){
			fill(playAria[i]);
			rect(offsetX+(i%playAriaWidth)*scale, offsetY+(i/playAriaWidth)*scale, scale, scale);
			
		}
	}

	//outline
	line(offsetX, offsetY, offsetX, offsetY+playAriaHeight*scale);
	line(offsetX, offsetY, offsetX+playAriaWidth*scale, offsetY);

	line(offsetX+playAriaWidth*scale, offsetY+playAriaHeight*scale, offsetX, offsetY+playAriaHeight*scale);
	line(offsetX+playAriaWidth*scale, offsetY+playAriaHeight*scale, offsetX+playAriaWidth*scale, offsetY);

	//faling object
	fallingObj.drawIn(offsetX+scale*fallWidth,offsetY+scale*fallHeight);


	if (gameover){
		textSize(24);
		fill(textNOutlines);
		text("GAME OVER", width/2 - textWidth("GAME OVER")/2, height/2);
	}
}