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
  textArea.input(key);
  textArea.printInputCharacter(key);
  textArea.printCursorPosition();
}
