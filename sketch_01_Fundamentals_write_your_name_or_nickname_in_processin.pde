
// words { letters {x,y...} }
float[][] letters = {
	{0,2, 2,0.5, 3.5,0, 5,0.5, 6.5,2, 7,4, 6,6, 3,6.5, 0.5,8, 0,9, 0.5,10, 3,11.5, 6,11, 7,10},//S
	{0,0, 2,0, 1,0, 1,11, 2,11, 0,11}, //I
	{0,0, 3,12, 5,6, 7,12, 10,0}, //M
	{3,0, 5,1.5, 6,5.5, 5,9.5, 3,11, 1,9.5, 0,5.5, 1,1.5, 3,0}, //O
	{0,0, 0,12, 4,0, 4,12}};//N

boolean[] smooths = {true, false, false, true, false};

void setup()
{
  size(768, 432);
  background(0, 0, 0);
  fill(0,0,0,30); //clear color
}

void draw()
{
	//clear screen with "fill" color
	float ranOffset = 11.0;
	float[] offset = {1,15.5,21.5,21.5};
	strokeWeight(0);
	rect(-1,-1,769, 433);
	strokeWeight(1);
	
	

	//draw word
	for (int i = 0; i < letters.length; i++) {
		float maxWight = 0;
		
		stroke(random(255), random(255), random(255));
		//draw charaters
		if (!smooths[i]){
			float[] lastRand = {random(-ranOffset, ranOffset),random(-ranOffset, ranOffset)};

			for (int o = 0; o < letters[i].length -3; o+=2) {
				maxWight = max(maxWight, letters[i][o+2]);
				 //draw line
				line(
					letters[i][o]  *  offset[2] + offset[0] * offset[2] + lastRand[0], 
					letters[i][o+1]* -offset[3] + offset[1] * offset[3] + lastRand[1], 
					letters[i][o+2]*  offset[2] + offset[0] * offset[2] + (lastRand[0] = random(-ranOffset, ranOffset)), 
					letters[i][o+3]* -offset[3] + offset[1] * offset[3] + (lastRand[1] = random(-ranOffset, ranOffset)));
			}
		} else {
			noFill();
			beginShape();
			curveVertex(letters[i][0] * offset[2] + offset[0] * offset[2] + random(-ranOffset, ranOffset), letters[i][1]* -offset[3] + offset[1] * offset[3] + random(-ranOffset, ranOffset));
			for (int o = 0; o < letters[i].length; o+=2) {
				maxWight = max(maxWight, letters[i][o]);
				curveVertex(
					letters[i][o]  *  offset[2] + offset[0] * offset[2] + random(-ranOffset, ranOffset), 
					letters[i][o+1]* -offset[3] + offset[1] * offset[3] + random(-ranOffset, ranOffset));
			}
			curveVertex(letters[i][letters[i].length-2] * offset[2] + offset[0] * offset[2] + random(-ranOffset, ranOffset), letters[i][letters[i].length-1]* -offset[3] + offset[1] * offset[3] + random(-ranOffset, ranOffset));
			endShape();
			fill(0,0,0,30);
		}
		offset[0] += maxWight + offset[0]*0.1; //caracter offset
	}
  
}
