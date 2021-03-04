
SelectionWheel wheel;

void setup() {
  size(1024, 512);
  wheel= new SelectionWheel();
  
}

void draw() {
background(100);
 wheel.rotate();
  
}

void mousePressed()
{
      //wheel.stopRotation();
      wheel.regenerateWheel();
}
