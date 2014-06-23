/*
/* basic shape policy(must be apply belows at starting draw shapes)
/* rectMode : CORNER
/* stroke   : noStroke
/*/

color bgc = color(204);

Effect effect;
TextArea textArea;

void setup(){
  size(200,200);
  effect   = new Effect(bgc);
  textArea = new TextArea(0,0,height,width);
}

void draw(){
  effect.paint(bgc);
  textArea.display();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode==SHIFT){
      print("SHIFT\n");
    
    }else if(keyCode == CONTROL){
     print("CONTROL\n");
    
    }else if(keyCode == UP){
      //textArea.updateCursor();
      print("UP\n");
    
    }else if(keyCode == DOWN){
      //textArea.updateCursor();
      print("DOWN\n");
    
    }else if(keyCode == LEFT){
      //textArea.updateCursor();
      print("LEFT\n");
      
    }else if(keyCode == RIGHT){
      //textArea.updateCursor();
      print("RIGHT\n");
    }
    
  }else{
    if(key == BACKSPACE){
      textArea.deleteText(0,0);
    }else if(key == ENTER){
      textArea.insertEOL(0,3);
    }else{
      textArea.insertCharAt(0,6,key);
    }
  }
  // update cursor position and etc.
  //textArea.updateCursor(key);
}
