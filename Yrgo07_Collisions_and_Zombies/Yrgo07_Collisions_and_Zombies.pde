void setup()
{
  size  (640,480);
  stroke(0);
  fill  (0);
  textSize(64);

  //caculate caracterGrid size
  gridX = width/gridSize;
  if (width%gridSize != 0)
    gridX++;
  gridY = height/gridSize;
  if (height%gridSize != 0)
    gridY++;

  //creates the grid
  caracterGrid = new ArrayList[gridX*gridY+gridX];
  for (int i = 0; i < caracterGrid.length; ++i) {
    caracterGrid[i] = new ArrayList<CharacterManager>();
  }

  //spawns 1 Zombie and the rest Human
  caracters[0] = new Zombie();
  for (int i = 1; i < caracters.length; ++i) {
    caracters[i] = new Human();
    caracters[i].id = i;
  }

}

