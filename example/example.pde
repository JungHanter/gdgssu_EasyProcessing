size(500, 500);

point(100, 100);

background(0);

loadPixels();

for(int i=0; i<width*height/2; i++) {
  pixels[i] = 0xFFFF00;
}

updatePixels();


PImage img = loadImage("ssu_gdg.png");

image(img, width/4, height/4, width/2, height/2);
