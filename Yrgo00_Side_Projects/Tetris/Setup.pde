void localSetup()
{
  stroke(textNOutlines);
  resetFall();

  if (autoScale)
  	scale = (height-38)/20;

  offsetX = width/2-5*scale;
  offsetY = height/2 -10*scale;

  time = millis()+gameSpeed;
}