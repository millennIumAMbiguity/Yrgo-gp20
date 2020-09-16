
//todo: sort

int[] 	playAria 			= new int[210]; //10x20  todo: make it so that you can change play aria
long 	gameSpeed 			= 800; 			//milliseconds to next drop. To change this see Score.pde
int 	score;
int 	level;
int 	linesCleared;
int 	linesForNextLevel 	= 10;
TObject fallingObj 			= new TObject();
TObject hold;
TObject next 				= new TObject();
boolean holdV;
long 	time;
int 	fallHeight;
int 	fallWidth 			= 5;
boolean gameover;
int 	offsetX, offsetY;