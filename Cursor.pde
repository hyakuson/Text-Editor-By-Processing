class Cursor extends Shape{

  // cursor position
  int lineNo;
  int charNo;
  
  Lines currentLine;

  Cursor(Lines line, int _lineNo, int _charNo){
    this.currentLine = new Lines("");

    // cursor width, height.
    this.width  = 2;
    this.height = line.getTextHeight();
    
    this.lineNo = _lineNo;
    this.charNo = _charNo;
  }
  
  public void updateCurrentLine(Lines line, int _lineNo, int _charNo){
    this.currentLine = new Lines(line.getText());
    this.currentLine.setText(line.getText().substring(0,_charNo));
    this.lineNo = _lineNo;
    this.charNo = _charNo;
  }

  public void display(){
    rectMode(CORNER);
    noStroke();
    rect(getCursorX(), getCursorY() , this.width, this.height);
  }
  
  /**
   * get pixel of cursor position-x
   */
  private int getCursorX(){
    return currentLine.getX() + currentLine.getTextWidth();
  }
  
  /**
   * get pixel of cursor position-y
   */  
  private int getCursorY(){
     return currentLine.getY() + (this.height * this.lineNo);
  }
  
  public int getLineNo(){
    return this.lineNo;
  }
  
  public int getCharNo(){
    return this.charNo;
  }
}
