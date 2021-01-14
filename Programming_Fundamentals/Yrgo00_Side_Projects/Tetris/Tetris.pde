
void settings() {
	if (loadSettingsFile)
		loadSettingFile();
	
	if (fullScreen)
  		fullScreen();
  	else 
  		size(640,480);
}

void setup() {localSetup();}

void draw() {localDraw();}

void keyPressed() {inputKeyPressed();}