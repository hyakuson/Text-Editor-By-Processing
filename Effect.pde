class Effect{
  color background_color;
  
  Effect(){
    
  }
  
  Effect(color _c){
    background_color = _c;
  }
  
  void fade(color _c){
    fill(red(_c),green(_c),blue(_c),10);
    rect(0,0,width,height);
  }
  
  void paint(color _c){
    fill(_c);
    noStroke();
    rect(0,0,width,height);
  }
}
