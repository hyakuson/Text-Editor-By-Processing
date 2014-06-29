class Effect{
  color backgroundColor;
  int mode;
  final int PAINT = 0;
  final int FADE  = 1;
 
  Effect(int _mode, color _c){
    this.mode = _mode;
    backgroundColor = _c;    
  }
  
  public void fade(){
    int r = (int)red(backgroundColor);
    int g = (int)green(backgroundColor);
    int b = (int)blue(backgroundColor);
    
    fill(r,g,b,10);
    noStroke();
    rect(0,0,width,height);
  }
  
  public void paint(){
    fill(backgroundColor);
    noStroke();
    rect(0,0,width,height);
  }
  
  public void display(){
    switch(this.mode){
      case PAINT :
        this.paint();
        break;
      case FADE :
        this.fade();
        break;
    }
  }
}
