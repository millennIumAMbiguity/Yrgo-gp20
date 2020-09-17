//settings
int 	scale 			= 16;
boolean autoScale 		= false;

int 	playAriaWidth	= 10;
int 	playAriaHeight	= 20;

boolean fullScreen 		= true;

boolean loadSettingsFile = true;


//for colors, see ColorProfile.pde

//for gamespeed, see Score.pde

//for block shapes and amount, see Blocks.pde

void loadSettingFile(){
	try
	{
		String[] file = loadStrings("settings.config");
		scale 			= Integer.parseInt	  (deFormat(file[0]));
		autoScale 		= Boolean.parseBoolean(deFormat(file[1]));
		playAriaWidth 	= Integer.parseInt	  (deFormat(file[2]));
		playAriaHeight 	= Integer.parseInt	  (deFormat(file[3]));
		loadSettingsFile= Boolean.parseBoolean(deFormat(file[4]));

	}
	catch (NullPointerException error)
	{
  		print("settings.config does not exist.");
	}
}
String deFormat(String s){
	return s.split(":")[1];
}