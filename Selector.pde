
SelectionWheel wheel;

void setup() {
  size(800, 500);
  wheel= new SelectionWheel();
  
}

void draw() {
background(100);
 wheel.rotate();
  
}

void mousePressed()
{
      wheel.regenerateWheel();
}
