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
	text("NEXT", offsetX + 12*scale - textWidth("NEXT")/2, offsetY + 12);
	next.draw(offsetX + 12*scale, offsetY + scale + 14, scale/2);

	//LEVEL text
	fill(textNOutlines);
	text("LEVEL", offsetX + 12*scale - textWidth("LEVEL")/2, offsetY + scale*4 + 12);
	str = Integer.toString(level);
	text(str, offsetX + 12*scale - textWidth(str)/2, offsetY + scale*4 + 24);

	//level blocks rendering
	for (int i = 0; i < playAria.length; ++i) {
		if (playAria[i] != 0){
			fill(playAria[i]);
			rect(offsetX+(i%10)*scale, offsetY+(i/10)*scale, scale, scale);
			
		}
	}

	//outline
	line(offsetX, offsetY, offsetX, offsetY+20*scale);
	line(offsetX, offsetY, offsetX+10*scale, offsetY);

	line(offsetX+10*scale, offsetY+20*scale, offsetX, offsetY+20*scale);
	line(offsetX+10*scale, offsetY+20*scale, offsetX+10*scale, offsetY);

	//faling object
	fallingObj.drawIn(offsetX+scale*fallWidth,offsetY+scale*fallHeight);


	if (gameover){
		textSize(24);
		fill(textNOutlines);
		text("GAME OVER", width/2 - textWidth("GAME OVER")/2, height/2);
	}
}