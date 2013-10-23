class TransScreen {
  final color[] colors;
  final PImage img;
  
  TransScreen(int width, int height, color[] colors) {
    this.colors = colors;
    
    img = createImage(width, height, RGB);
  }
  
  void changeColor(color[] oriPixels) {
    img.loadPixels();
    for(int i=0; i<oriPixels.length; i++) {
      color currColor = oriPixels[i];
    
      //RGB 값 추출
      int currR = (currColor >> 16) & 0xFF;  //red(currColor);
      int currG = (currColor >> 8) & 0xFF;
      int currB = currColor & 0xFF;
      
      int currAvg = (currR + currG + currB)/3;
      if(currAvg < 64) {
        img.pixels[i] = colors[0];
      } else if(currAvg < 128) {
        img.pixels[i] = colors[1];
      } else if(currAvg < 192) {
        img.pixels[i] = colors[2];
      } else {
        img.pixels[i] = colors[3];
      }
    }
    img.updatePixels();
  }
  
  PImage getImage() {
    return img;
  }
}
