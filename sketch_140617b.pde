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
    
    } else if(keyCode == CONTROL){
     print("CONTROL\n");
    
    } else {
      // moving cursor
      textArea.moveCursor(key);
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

 textArea.printCursorPosition();
}
