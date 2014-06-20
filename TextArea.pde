class TextArea {
  // text area property
  int x, y, width, height;
  color textarea_color;
  int all_lines; 
  int all_characters;
  // line/character number of cursor position
  int cursor_line_num;
  int cursor_char_num;

  // input area
  InputArea inputArea;

  // cursor
  Cursor cursor;

  /**
   * return cursor position(
   */
  //int cursor_at(){
  //}

  // inputed text
  Text text;

  /**
   * constractor
   * @param _x text area position-x
   * @param _y text area position-y
   * @param _w text area width
   * @param _h text area height
   */
  TextArea(int _x, int _y, int _w, int _h) {
    this.x      = _x;
    this.y      = _y;
    this.width  = _w;
    this.height = _h;

    // text area backgroud color
    textarea_color = color(255, 0, 0);

    // input area
    inputArea = new InputArea(this.x + 5, this.y + 5, 
                              this.x + this.width  - (5 + 5), this.y + this.height - (5 + 5), 
                              color(0, 255, 0));

    // inputed text
    text = new Text(5, 5, "Hello, World!", color(0, 0, 0));

    // cursor
    cursor = new Cursor(text);

    this.all_characters = text.getTextLength();
    this.all_lines      = text.getAllLines();
  }
  
  void updateText(char key){
    if(key==CODED){
      
    }else{
      if(key == BACKSPACE){
        text.backspace();
      }else{
        text.input(key);
      }
      this.all_characters = text.getTextLength();
      this.all_lines      = text.getAllLines();
    }
  }

  void updateCursor(char key) {
    // update cursor position
    cursor.update(text,key);
  }

  void display() {
    rectMode(CORNER);
    noStroke();
    
    // draw textarea
    fill(textarea_color);
    rect(this.x, this.y, this.width, this.height);

    // draw input area
    inputArea.display();

    // draw text
    text.display();
    
    // draw cursor
    cursor.display();

    // TODO: draw scrollbar
    
    // DEBUG
    print("char:"+this.all_characters+"\n");
    print("line:"+this.all_lines     +"\n");
    
    print("cursor_line:"+cursor_line_num+"\n");
    print("cursor_char:"+cursor_char_num+"\n");
  }
}

