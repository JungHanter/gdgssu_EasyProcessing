import processing.video.*;

int numPixels;
Capture video;

void setup() {
  size(1280,720);
  frameRate(30);
  
  video = new Capture(this, width, height, 30);
  video.start();
  
  numPixels = video.width * video.height;
  
  loadPixels();
}

void draw() {
  if(video.available()) {
    video.read();
    video.loadPixels();
  }
  
  for(int i=0; i<numPixels; i++) {
    color currColor = video.pixels[i];
    
    //RGB 값 추출
    int currR = (currColor >> 16) & 0xFF;  //red(currColor);
    int currG = (currColor >> 8) & 0xFF;
    int currB = currColor & 0xFF;
    
    int currAvg = (currR + currG + currB)/3;
    if(currAvg < 64) {
      pixels[i] = color(0,0,255);
      //pixels[i] = color(64, 64, 64);
    } else if(currAvg < 128) {
      pixels[i] = color(255,255,0);
      //pixels[i] = color(128, 128, 128);
    } else if(currAvg < 192) {
      pixels[i] = color(0,255,255);
      //pixels[i] = color(192, 192, 192);
    } else {
      pixels[i] = color(255,0,255);
      //pixels[i] = color(255, 255, 255);
    }
  }
  
  updatePixels();
}

