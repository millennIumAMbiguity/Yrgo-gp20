void setup()
{
  size  (640,480);
  stroke(0);
  fill  (0);
  textSize(64);

  gridX = width/gridSize;
  if (width%gridSize != 0)
    gridX++;
  gridY = height/gridSize;
  if (height%gridSize != 0)
    gridY++;

  caracterGrid = new ArrayList[gridX*gridY+gridX];
  for (int i = 0; i < caracterGrid.length; ++i) {
    caracterGrid[i] = new ArrayList<CharacterManager>();
  }

  caracters[0] = new Zombie();
  for (int i = 1; i < caracters.length; ++i) {
    caracters[i] = new Human();
    caracters[i].id = i;
  }

}

void draw()
{
  background(255);
  fill(255);
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

  if (totalZ >= 100){
    if(score == 0)
      score = millis();

    String format = String.format("%%0%dd", 2);
    long elapsedTime = score / 1000;
    String seconds = String.format(format, elapsedTime % 60);
    String minutes = String.format(format, (elapsedTime % 3600) / 60);
    String hours = String.format(format, elapsedTime / 3600);
    String timeString =  hours + ":" + minutes + ":" + seconds;

    fill(0);
    textSize(64);
    text("Game Over", width/2 - textWidth("Game Over")/2, height/2);
    textSize(32);
    text(timeString, width/2 - textWidth(timeString)/2, height/2 + 32);
  }
}