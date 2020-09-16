void localSetup()
{
  stroke(textNOutlines);
  resetFall();

  if (autoScale)
  	scale = (height-38)/playAriaHeight;

  playAria = new int[playAriaHeight*playAriaWidth+playAriaWidth];

  offsetX = width /2 - playAriaWidth /2 *scale;
  offsetY = height/2 - playAriaHeight/2 *scale;

  time = millis()+gameSpeed;
}