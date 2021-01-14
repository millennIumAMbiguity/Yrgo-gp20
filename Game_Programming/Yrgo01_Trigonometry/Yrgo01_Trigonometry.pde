//settings
//waves
int points = 100;
int cruveSize = 32;
int pointSize = 4;
float cruveWaves = 0.1f;
float timeSpeed = 0.02f;
//spiral
int pointsPerCircle = 16;
int spiralLenght = 12;
int spiralMinSize = 4;
float spiralSizeMult = 4;
float spiralwiggleSpeed = 0.5f;
float spiralwiggleSize = 0.2f;
float spiralrotateSpeed = 0.25f;

//colors
int backgroundColor = color(72, 12, 168);

int color1 = color(247, 37, 133);
int color2 = color(114, 9, 183);

int color3 = color(67, 97, 238);
int color4 = color(76, 201, 240);

//var
float time = 0;

void setup()
{
	size(512, 512);
	surface.setTitle("Trigonometry");
	surface.setResizable(true);
	background(backgroundColor);
}
void draw()
{
	background(backgroundColor);
	update();
	lateUpdate();
}

void update() {
	
	translate(width / 2, height / 2);
	spiral();
	translate(- width / 2, - height / 2);
	
	
	translate(0, cruveSize + pointSize);
	stroke(color2);
	line(0, 0, width, 0);
	stroke(color1);
	fill(color1);
	sinWave();
	
	translate(0, height - (cruveSize + pointSize) * 2);
	stroke(color3);
	line(0, 0, width, 0);
	stroke(color4);
	fill(color4);
	cosWave();
	
}

void lateUpdate() {
	time += timeSpeed;
}

void spiral() {
	float x1, y1, 
	x2 = sin(- time * spiralrotateSpeed) * spiralMinSize + sin(time * spiralwiggleSpeed) * spiralMinSize * spiralwiggleSize, 
		y2 = cos(- time * spiralrotateSpeed) * spiralMinSize + cos(time * spiralwiggleSpeed) * spiralMinSize * spiralwiggleSize;
	
	for (int layer = 0; layer < spiralLenght; ++layer) {
		for (int point = 0; point < pointsPerCircle; ++point) {
			float v = (float)(point) / pointsPerCircle;
			float i = layer + v;
			float size = spiralMinSize + i * i * spiralSizeMult;
			float c = i / spiralLenght * 255;
			fill(c);
			stroke(c);
			v = PI * v * 2f - time * spiralrotateSpeed + i * 0.1f;
			x1 = x2;
			y1 = y2;
			x2 = sin(v) * size + sin(i + time * spiralwiggleSpeed) * size * spiralwiggleSize;
			y2 = cos(v) * size + cos(i + time * spiralwiggleSpeed) * size * spiralwiggleSize;
			size = size / 4f;
			ellipse(x2, y2, size, size);
			strokeWeight(size / 8f);
			line(x1, y1, x2, y2);
		}
	}
	strokeWeight(1);
}

void sinWave() {
	int x1, y1, x2, y2;
	x2 = 0;
	y2 = (int)(sin(time) * cruveSize);
	ellipse(x2, y2, pointSize, pointSize);
	for (int i = 1; i <= points; ++i) {
		x1 = x2;
		y1 = y2;
		x2 = (int)(width * ((float)i / points));
		y2 = (int)(sin(i * cruveWaves + time) * cruveSize);
		ellipse(x2, y2, pointSize, pointSize);
		line(x1, y1, x2, y2);
	}
}

void cosWave() {
	int x1, y1, x2, y2;
	x2 = 0;
	y2 = (int)(cos(time) * cruveSize);
	ellipse(x2, y2, pointSize, pointSize);
	for (int i = 1; i <= points; ++i) {
		x1 = x2;
		y1 = y2;
		x2 = (int)(width * ((float)i / points));
		y2 = (int)(cos(i * cruveWaves + time) * cruveSize);
		ellipse(x2, y2, pointSize, pointSize);
		line(x1, y1, x2, y2);
	}
}