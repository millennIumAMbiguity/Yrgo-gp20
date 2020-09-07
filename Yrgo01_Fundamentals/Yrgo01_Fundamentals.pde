// words { letters {x,y, x,y...} }
float[][] letters = {
	{0,2, 2,0.5, 3.5,0, 5,0.5, 6.5,2, 7,4, 6,6, 3,6.5, 0.5,8, 0,9, 0.5,10, 3,11.5, 6,11, 7,10},//S
	{0,0, 2,0, 1,0, 1,11, 2,11, 0,11}, //I
	{0,0, 3,12, 5,6, 7,12, 10,0}, //M
	{3,0, 5,1.5, 6,5.5, 5,9.5, 3,11, 1,9.5, 0,5.5, 1,1.5, 3,0}, //O
	{0,0, 0,12, 4,0, 4,12}};//N

//settings for what letters is curves and what letters is straight
boolean[] smooths = {true, false, false, true, false};

void setup()
{
  size(768, 432);
  background(0, 0, 0);
  fill(0,0,0,30); //clear color
}
void draw()
{
	float ranOffset = 11.0;
	//offset x,y, scale x, scale y
	float[] offset = {1,15.5,21.5,21.5};
	strokeWeight(0);
	//lear screen with "fill" color
	rect(-1,-1,769, 433);
	strokeWeight(1);

	//draw word
	for (int i = 0; i < letters.length; i++) {
		float maxWeight  = 0;
		stroke(random(255), random(255), random(255));
		//draw charaters
		if (!smooths[i]){
			float[] lastRand = {random(-ranOffset, ranOffset),random(-ranOffset, ranOffset)};
			//for each point pair in the letter
			for (int o = 0; o < letters[i].length -3; o+=2) {
				maxWeight = max(maxWeight, letters[i][o+2]);
				 //draw line
				line(
					GetPos(letters[i], offset, o)   + lastRand[0], 
					GetPos(letters[i], offset, o+1) + lastRand[1], 
					GetPos(letters[i], offset, o+2) + (lastRand[0] = random(-ranOffset, ranOffset)), 
					GetPos(letters[i], offset, o+3) + (lastRand[1] = random(-ranOffset, ranOffset)));
			}
		} else {
			noFill();
			beginShape();
			curveVertex(GetPos(letters[i], offset, 0) + random(-ranOffset, ranOffset), GetPos(letters[i], offset, 1) + random(-ranOffset, ranOffset));
			//for each point in the letter
			for (int o = 0; o < letters[i].length; o+=2) { 
				maxWeight = max(maxWeight, letters[i][o]);
				curveVertex(
					GetPos(letters[i], offset, o)   + random(-ranOffset, ranOffset), 
					GetPos(letters[i], offset, o+1) + random(-ranOffset, ranOffset));
			}
			curveVertex(GetPos(letters[i], offset, letters[i].length-2) + random(-ranOffset, ranOffset), GetPos(letters[i], offset, letters[i].length-1) + random(-ranOffset, ranOffset));
			endShape();
			fill(0,0,0,30);
		}
		offset[0] += maxWeight + offset[0]*0.1; //caracter offset
	}
}
float GetPos(float[] letters, float[] offset, int o){
	if (o%2 == 0)
	return letters[o] *  offset[2] + offset[0] * offset[2]; //x
	return letters[o] * -offset[3] + offset[1] * offset[3]; //y
	//letter point pos, offset scale, offset pos
}