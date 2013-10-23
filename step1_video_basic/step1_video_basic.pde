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
  
  //image(video, 0, 0, width, height);
  for(int i=0; i<numPixels; i++) {
    pixels[i] = video.pixels[i];
  }
  updatePixels();
}
