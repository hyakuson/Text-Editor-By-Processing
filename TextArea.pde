import java.util.LinkedList;

class TextArea {
  // text area property
  int x, y, width, height;
  color textarea_color;
  int all_lines; 
  int all_characters;
  // line/character number of cursor position
  int cursor_line_num;
  int cursor_char_num;
  
  int INIT_LINE_COUNT=6;

  // input area
  InputArea inputArea;

  // cursor
  //Cursor cursor;

  /**
   * return cursor position(
   */
  //int cursor_at(){
  //}

  // inputed text lines
  //ArrayList<Lines> lines = new ArrayList<Lines>();
    LinkedList<Lines> lines = new LinkedList<Lines>();
  
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

    // text
    for(int i=0; i<INIT_LINE_COUNT; i++){
      if(i==3){
        lines.add(new Lines(""));
      }else{
        lines.add(new Lines("LINE:"+i));
      }
    }
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
    for(int i=0; i < lines.size(); i++){
      lines.get(i).display(inputArea.x, inputArea.y, i);
    }

    // draw cursor
    //cursor.display();

    // TODO: draw scrollbar
  }
  
  void moveCursorTo(int lineNo, int charNo){
  }
  void moveCursorRight(int cursorPos){
  }
  void moveCursorLeft(int cursorPos){
  }
  void moveCursorUp(int cursorPos){
  }
  void moveCursorDown(int cursorPos){
  }
  
  /**
   * insert text into line:lineNo, char:charNo. <br/>
   * ex) insertText(N,3,ABCDEFG) => ABCEFG<br/>
   * lineText = ABCDEFG<br/>
   * frontStr = AB<br/>
   * backStr  = DEFG<br/>
   * 
   * @param lineNo line number
   * @param charNo charcter number in line
   * @param _c insert character
   */
  void insertCharAt(int lineNo, int charNo, char _c){
    String lineText = lines.get(lineNo).getText();
    String frontStr = lineText.substring(0, charNo);
    String backStr  = charNo == lineText.length() ? "" : lineText.substring(charNo, lineText.length());
    lines.get(lineNo).setText(frontStr + _c + backStr);
  }
  
  /**
   * delete text at line:lineNo, char:charNo
   */
  void deleteText(int lineNo, int charNo){
    String lineText = lines.get(lineNo).getText();
    String frontStr,backStr;

    if(lineText == ""){
      if(lineNo>0){
        // blank text
        lines.remove(lineNo);
        print("BLANK TEXT");
      }
    }else{
      if(charNo==0){
        if(lineNo>0){
          lines.remove(lineNo);
          
          // first character of line
          frontStr = "";
          backStr  = lineText.substring(0, lineText.length());
          lines.get(lineNo-1).setText(lines.get(lineNo-1).getText() + backStr);
        }
      }else if(charNo == lineText.length()){
        // end character of line
        frontStr = lineText.substring(0, charNo-1);
        backStr  = "";
        lines.get(lineNo).setText(frontStr + backStr);
      
      }else{
        frontStr = lineText.substring(0, charNo-1);
        backStr  = lineText.substring(charNo, lineText.length());
        lines.get(lineNo).setText(frontStr + backStr);
      }
      // TODO: cursor position of charcter -1
      // cursorPos-1
    }
  }
  
  /**
   * insert End Of Line at line:lineNo, char:charNo.
   */
  void insertEOL(int lineNo, int charNo){
    String lineText = lines.get(lineNo).getText();
    String frontStr,backStr;
    
    frontStr = lineText.substring(0,charNo);
    backStr  = lineText.substring(charNo, lineText.length());
    
    lines.get(lineNo).setText(frontStr);
    lines.add(lineNo+1, new Lines(backStr));
  }
}
