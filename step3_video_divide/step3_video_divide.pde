import processing.video.*;

color colors[][] = {
  { 0x58461F, 0xFAF1A5, 0xE98E2F, 0x8A6B8C },
  { 0xDD4A1F, 0xA9CF37, 0x72B5E3, 0xE6E7E8 },
  { 0x6D4B5D, 0xBD747b, 0x727C66, 0x546A91 },
  { 0xEF847B, 0x8CBEB2, 0x5C4B51, 0xA5C88F },
  { 0x31537F, 0xDAC7B9, 0xC29460, 0x426EA3 },
  { 0x82C2FF, 0xE3E18C, 0xFF6862, 0x4FE8D0 },
  { 0x3F3B38, 0x8D3735, 0xA1A6A4, 0x5CFF92 },
  { 0xBD034A, 0xF1CB80, 0xDA7597, 0x0186A7 },
  { 0x1A1426, 0xD9ADC5, 0x731212, 0xD9B36C }
};

int numPixels;
Capture video;

TransScreen[][] screens;
int nodeWidth, nodeHeight;

int i, j;

void setup() {
  size(1280,720);
  frameRate(30);
  
  video = new Capture(this, width, height, 30);
  video.start();
  
  numPixels = video.width * video.height;
  
  nodeWidth = video.width/3;
  nodeHeight = video.height/3;
  
  screens = new TransScreen[3][3];
  for(i=0; i<3; i++) {
    for(j=0; j<3; j++) {
      screens[i][j] = new TransScreen(video.width, video.height,
                                      colors[i*3+j]);
    }
  }
}


void draw() {
  if(video.available()) {
    video.read();
    video.loadPixels();
  }
  
  for(i=0; i<3; i++) {
    for(j=0; j<3; j++) {
      screens[i][j].changeColor(video.pixels);
      image(screens[i][j].getImage(), nodeWidth*i, nodeHeight*j,
            nodeWidth, nodeHeight);
    }
  }
}


