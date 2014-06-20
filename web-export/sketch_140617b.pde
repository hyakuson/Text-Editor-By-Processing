int x,y,s;
color c;
color bgc;

Rect shape = new Rect(10,10,10,color(255,0,0));
Effect effect = new Effect();

void setup(){
  size(200,200);
  bgc = color(204);
  background(bgc);
  x = y = 0;
  s = 10;
  c = color(0,0,0);
  
}

void draw(){
  effect.fade(bgc);
  shape.moveTo(x,y);
  shape.sizeTo(s);
  shape.fillTo(c);
  shape.display();
}

void mousePressed(){
  if(mouseButton == LEFT) {
    // change rect position if left mouse button clicked.
    x = mouseX;
    y = mouseY;
  } else if (mouseButton == RIGHT) {
    // change rect color if right mouse button clicked.
    c = color(random(255),random(255),random(255));
  } else if (mouseButton == CENTER) {
    // change rect size if mouse center button clicked.
    s = (int)random(5,30);
  }
}
class Effect{
  
  void fade(color _c){
    fill(red(_c),green(_c),blue(_c),10);
    rect(0,0,width,height);
  }
}
class Rect {
  int x,y;
  int s;
  color c;
  
  Rect(int _x, int _y, int _s, color _c){
    x = _x;
    y = _y;
    s = _s;
    c = _c;
  }
  
  void moveTo(int _x, int _y){
    x = _x;
    y = _y;
  }
  
  void fillTo(color _c){
    c = _c;
  }
  
  void sizeTo(int _s){
    s = _s;
  }
  
  void display(){
    fill(c);
    rectMode(CORNER);
    rect(x,y,s,s);
  }
}

