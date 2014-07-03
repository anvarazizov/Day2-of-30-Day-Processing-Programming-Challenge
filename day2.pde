import gifAnimation.*;

GifMaker gifExport;
float index, x, y, size, ellipseX, ellipseY;

void setup()
{
  size(612, 612);
  background(0);
  noStroke();
  smooth();
  
  frameRate(12);
  gifExport = new GifMaker(this, "spin rect sine growth.gif");
  gifExport.setRepeat(0); // make it an "endless" animation
  gifExport.setDelay(1000/12);  //12fps in ms
  
  x = 0;
  y = 0;
  size = 1;
  index = 8; 
  ellipseX = x + size;
  ellipseY = y + size;
  rect(0, 0, width, height);
}

void draw()
{
   rect(0, 0, width, height);
   background(0);
   x = 0;
   y = 0;
   size = 15;
   index = 8; 
   ellipseX = x + size;
   ellipseY = y + size;
   drawPattern(); 
   
   gifExport.addFrame();

  if (frameCount == 120) gifExport.finish(); 
  println(frameCount);
}

void drawPattern()
{
  translate(width / 2, height / 2);
 for(int i = 0; i <= 1000; i++)
  {
    fill(50 + index, 0 + cos(index / 2), 100 + sin(index));
    rect(ellipseX, ellipseY, size, size);
    
    x += 0.1;
    ellipseX += 1;
    index += 1;
    size += -0.01;
    
    if(x >= width)
    {
      x = 0;
      y += 40;
      ellipseX = x + size;
      ellipseY += 10;
      size -= noise(frameCount);
    }
      rotate(cos(frameCount));
      index -= 0.03;
  } 
}

void mousePressed()
{
   
}

void keyPressed() {
  if (key == 's') {
    saveFrame("data/frame-#####.png");
    println("image saved");
  } 
  else {
    println("key " + key + " pressed.");
  }
}
