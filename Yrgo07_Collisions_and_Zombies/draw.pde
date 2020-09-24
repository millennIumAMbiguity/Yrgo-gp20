void draw()
{
  background(255);

  //draw grid
  noStroke();
  int totalZ = 0;
  for (int x = 0; x < gridX; ++x) {
    for (int y = 0; y < gridY; ++y) {

      int amount = caracterGrid[y*gridX+x].size();
      int zAmount = 0;
      for (CharacterManager c : caracterGrid[y*gridX+x]) {
        if (c.objType == 2)
          zAmount++;
      }
      amount -= zAmount;
      totalZ += zAmount;

      //get grid color
      fill(255 - (amount<<5), 255 - (zAmount<<5), 255 - (zAmount<<5));

      rect(x*gridSize, y*gridSize, gridSize, gridSize);
    }
  }
  stroke(0);

  for (int i = 0; i < caracters.length; ++i) {
    caracters[i].move();
  }

  for (int i = 0; i < caracters.length; ++i) {
    caracters[i].collision();
  }

  for (int i = 0; i < caracters.length; ++i) {
    caracters[i].draw();
  }


  //show game over text
  if (totalZ >= 100){
    //caculate score
    if(timeString == null){
      //time format time
      String format = String.format("%%0%dd", 2);
      long elapsedTime = millis() / 1000;
      String seconds = String.format(format, elapsedTime % 60);
      String minutes = String.format(format, (elapsedTime % 3600) / 60);
      String hours = String.format(format, elapsedTime / 3600);
      timeString = hours + ":" + minutes + ":" + seconds;
    }

    //draw text
    fill(0);
    textSize(64);
    text("Game Over", width/2 - textWidth("Game Over")/2, height/2);
    textSize(32);
    text(timeString, width/2 - textWidth(timeString)/2, height/2 + 32);
  }
}