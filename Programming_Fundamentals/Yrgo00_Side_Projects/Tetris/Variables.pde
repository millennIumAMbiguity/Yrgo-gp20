boolean holdV;
boolean gameover;
boolean updateScreen 		= true;
int 	fallHeight;
int 	fallWidth;
int 	level;
int 	linesCleared;
int 	linesForNextLevel 	= 10;
int 	offsetX, offsetY;
int 	score;
int[] 	playAria;
long 	gameSpeed 			= 800; 			//milliseconds to next drop. To change this see Score.pde
long 	time;
TObject fallingObj;
TObject hold;
TObject next 				= new TObject();