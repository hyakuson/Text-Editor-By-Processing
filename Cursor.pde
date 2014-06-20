class Cursor extends Shape{

  int cursored_line;  //cursor position of line.
  int cursored_char;  //cursor position of charcter number in a line.
  
  Cursor(Text _text){
    this.x      = _text.x + _text.getTextWidth();  // default position is
    this.y      = _text.y;
    this.width  = 5;
    this.height = _text.getTextHeight();

    cursored_line = 0;
    cursored_char = 0;
  }
  
  /**
   * move cursor to above line
   */
  void up(){
    
  }
  
  /**
   * move cursor to below line
   */
  void down(){
    
  }
  
  /**
   * move cursor to left
   */
  void left(){
    if(this.cursored_char==0){
      this.cursored_line -= 1;
      //this.cursored_char = _text(this.cursored_line).end();
    }else{
    
    }
  }
  
  /**
   * move cursor to right
   */
  void right(){
    this.cursored_char += 1;
  }
  
  /**
   * move cursor if return key pressed
   */
  void return(){
    this.cursored_line += 1;
    this.cursored_char =  0;
  }
  
  /**
   * update cursor position
   */
  void update(Text _text, char key){
    this.x = _text.x + _text.getTextWidth();
    this.y = _text.y;
    if(key == ENTER){
      this.return();
    }
  }
  
  void display(){
    rectMode(CORNER);
    noStroke();
    rect(this.x, this.y, this.width, this.height);
  }
  
}
