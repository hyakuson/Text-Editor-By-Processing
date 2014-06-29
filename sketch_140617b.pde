/*
/* basic shape policy(must be apply belows at starting draw shapes)
/* rectMode : CORNER
/* stroke   : noStroke
/*/

Effect effect;
TextArea textArea;

void setup(){
  size(500,200);
  effect   = new Effect(0,color(204));
  textArea = new TextArea(0,0,width,height);
}

void draw(){
  effect.display();
  textArea.display();
}

void keyPressed(){
  textArea.input(key);
  textArea.printInputCharacter(key);
  textArea.printCursorPosition();
}
