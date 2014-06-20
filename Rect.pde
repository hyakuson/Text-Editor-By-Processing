class Rect extends Shape{
  int s;
  
  Rect(int _x, int _y, int _s, color _c){
    this.x = _x;
    this.y = _y;
    this.s = _s;
    this.c = _c;
  }
  
  void sizeTo(int _s){
    this.s = _s;
  }

  void display(){
    rectMode(CORNER);
    noStroke();
    fill(this.c);
    rect(this.x,this.y,this.s,this.s);
  }
}
