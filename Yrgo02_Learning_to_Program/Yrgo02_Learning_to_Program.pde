
//settings
boolean exportImageSequence = false;
int numberOfLines = 60;

int linesEveryXPixel;
int drawSize;
int offset;

void setup()
{
  //caculate draw aria and offsets
  size(640, 640);
  drawSize = min(height, width);
  linesEveryXPixel = drawSize/(numberOfLines-4);
  offset = (int)(drawSize * 0.2)+ linesEveryXPixel;
  drawSize = (int)(drawSize*0.7);
  drawSize -= drawSize%linesEveryXPixel + linesEveryXPixel*2;
}

//animation variables
float[] animation = {-1, 1};
boolean[] aniState = {true, false};

void draw()
{
  background(255);
  float[] oldPos = {0,0,0,0};
  for (int y = 0; y <= drawSize; y+=linesEveryXPixel) {

    float sin = sin((float)y/drawSize*PI);
    float sinV = sin*animation[0]*drawSize*0.2; //sinwave offset
    float cosV = cos((float)y/drawSize*PI)*drawSize*0.09*abs(sin)*(animation[1]*2-1); //pointiness
    

    if (y != 0) { //draw outline and calculate all positions
      stroke(0); // draw form last to new pos
      line(oldPos[2],   oldPos[3],   oldPos[2] = offset + sinV,                   oldPos[3] = y + offset - cosV);
      line(oldPos[0],   oldPos[1],   oldPos[0] = drawSize - y + offset + cosV,    oldPos[1] = offset + sinV);
    } else { //calculate all positions
      oldPos = new float[] {drawSize - y + offset + cosV, offset + sinV, offset + sinV, y + offset - cosV};
    }
    
    if (((y/linesEveryXPixel) % 3) == 0)
      stroke(0); //black
    else 
      stroke(127); //gray

    line(oldPos[0], oldPos[1], oldPos[2], oldPos[3]); // draw line

  }

  if (exportImageSequence == true)
    saveFrame("###.png"); 

  smoothAnimation(0, 10);
  if (smoothAnimation(1, 20))
    exportImageSequence = false;

}

boolean smoothAnimation(int animationID, float speedDivider){ // animate from -1 to 1
  if (aniState[animationID]){
    animation[animationID] += 0.01/speedDivider + sin((animation[animationID]+1f)/2*PI)/speedDivider; //use a sin curve for a smooth animation sin(0-1 * PI) 
    if (animation[animationID] >= 1){
      animation[animationID] = 1;
      aniState[animationID] = !aniState[animationID];
      return true; //returns true when animation have repeated
    }
  } else {
    animation[animationID] -= 0.01/speedDivider + sin((animation[animationID]+1f)/2*PI)/speedDivider;
    if (animation[animationID] <= -1){
      animation[animationID] = -1;
      aniState[animationID] = !aniState[animationID];
    }
  }
  return false;
}
