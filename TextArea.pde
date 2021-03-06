import java.util.LinkedList;

class TextArea {
  // text area property
  int x, y;
  int width, height;
  color textarea_color;

  // cursor position
  int cursorLineNo;
  int cursorCharNo;
  
  // FIXME: keeping backspace
  int backspaceNum=0;
  
  int INIT_LINE_COUNT=6;
  
  int INPUTAREA_MARGIN = 5;

  // input area
  InputArea inputArea;

  // cursor
  Cursor cursor;

  // inputed text lines
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
    this.textarea_color = color(204);

    // input area
    inputArea = new InputArea(this.x + INPUTAREA_MARGIN,
                              this.y + INPUTAREA_MARGIN, 
                              _w - 2*INPUTAREA_MARGIN,
                              _h - 2*INPUTAREA_MARGIN, 
                              color(255));

    // initialize text
    lines.add(new Lines(""));
    
    // cursor
    cursor = new Cursor(lines.get(0),0,0);
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
    cursor.display();
  }
  
  public void moveCursorTo(int lineNo, int charNo){
    // if lineNo or charNo is in not exist position, throw exception. 
    //try{
      cursor.updateCurrentLine(lines.get(lineNo), lineNo, charNo);
    //} catch(Exception e){

    //}
  }
  
  public void moveCursor(char _key){
    if(_key == CODED){
      if(keyCode == UP){
        moveCursorUp();
      }else if(keyCode == DOWN){
        moveCusorDown();
      }else if(keyCode == LEFT){
        moveCursorLeft();
      }else if(keyCode == RIGHT){
        moveCursorRight();
      }
    }else{
      if(_key == ENTER){
        moveCursorStartOfLine();
        moveCusorDown();
      } else if(key == BACKSPACE){
        moveCursorLeft();
        moveCursorTo(cursor.getLineNo(),cursor.getCharNo()-backspaceNum);
        backspaceNum=0;
      } else if((int)_key >= 32 && (int)_key < 127){
        // input normal charcter
        moveCursorRight();
      } else {
        
      }
    }
  }
  
  public void moveCursorUp(){
    if(hasBeforeLine()){
      if(isExistsCharcterAtBeforeLine()){
        moveCursorStartOfLine();
        moveCursorTo(cursor.getLineNo()-1, cursor.getCharNo());
        moveCursorEndOfLine();
      }else{
        moveCursorTo(cursor.getLineNo()-1,cursor.getCharNo());
      }
    }
  }
  
  public void moveCusorDown(){
    if(hasNextLine()){
      if(isExistsCharcterAtNextLine()){
        moveCursorStartOfLine();
        moveCursorTo(cursor.getLineNo()+1, cursor.getCharNo());
        moveCursorEndOfLine();
      }else{
        moveCursorTo(cursor.getLineNo()+1, cursor.getCharNo());
      }
    }
  }
  
  public void moveCursorRight(){
    if(isLineEnd()){
      if(hasNextLine()){
        // move to next line
        moveCursorTo(cursor.getLineNo()+1,0);
      }
    }else{
      moveCursorTo(cursor.getLineNo(), cursor.getCharNo()+1);
    }
  }
  
  public void moveCursorLeft(){
    if(cursor.getCharNo()-1 < 0){
      if(cursor.getLineNo() > 0){
        moveCursorTo(cursor.getLineNo()-1, lines.get(cursor.getLineNo()-1).getTextLength());
      }
      
    }else{
      moveCursorTo(cursor.getLineNo(),cursor.getCharNo()-1);
    }
  }
  
  /**
   * move cursor to start of line
   */
  public void moveCursorStartOfLine(){
    moveCursorTo(cursor.getLineNo(),0);
  }

  /**
   * move cursor to end of line
   */
  public void moveCursorEndOfLine(){
    moveCursorTo(cursor.getLineNo(),lines.get(cursor.getLineNo()).getTextLength());
  }
  
  private boolean isLineEnd(){
    return cursor.getCharNo() >= lines.get(cursor.getLineNo()).getTextLength();
  }
  
  private boolean isExistsCharcterAtBeforeLine(){
    return lines.get(cursor.getLineNo()-1).getTextLength() < cursor.getCharNo();
  }
  private boolean isExistsCharcterAtNextLine(){
    return lines.get(cursor.getLineNo()+1).getTextLength() < cursor.getCharNo();
  }
  
  private boolean hasBeforeLine(){
    return cursor.getLineNo()-1 >= 0;
  }
  private boolean hasNextLine(){
    return cursor.getLineNo()+1 < lines.size();
  }
  
  public void input(char _key){
    if(_key == CODED){
      if(keyCode==SHIFT){
        
      } else if(keyCode == CONTROL){
      
      } else {
        // cursor
        textArea.moveCursor(_key);
      }    
    } else if((int)_key >= 32 && (int)_key < 127
              || _key == BACKSPACE
              || _key == ENTER){
      insertCharAt(cursor, _key);
      moveCursor(_key);
    } else if(_key == TAB){
    
    }
  }
  
  /**
   * insert a charcter at cursor position.
   */
  void insertCharAt(Cursor cursor, char _c){
    if(!(_c == CODED)){
      if(_c == ENTER){
        insertEOL(cursor.getLineNo(), cursor.getCharNo());
      }else if(_c == BACKSPACE){
        deleteTextAt(cursor.getLineNo(), cursor.getCharNo());
      }else if(_c == TAB){
        
      }else{
        String lineText = lines.get(cursor.getLineNo()).getText();
        String frontStr = lineText.substring(0, cursor.getCharNo());
        String backStr  = cursor.getCharNo() == lineText.length() ? "" : lineText.substring(cursor.getCharNo(), lineText.length());
        lines.get(cursor.getLineNo()).setText(frontStr + _c + backStr);
      }
    }
  }
  
  /**
   * delete character at line:lineNo, char:charNo
   */
  void deleteTextAt(int lineNo, int charNo){
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
          backspaceNum = backStr.length();
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

  // DEBUG METHOD
  void printCursorPosition(){
    print("LINE:" + this.cursor.getLineNo() + "\n");
    print("CHAR:" + this.cursor.getCharNo() + "\n");
  }
  // DEBUG METHOD
  void printInputCharacter(char _key){
    String inputed = "";
    if(_key == CODED){
      if(keyCode==SHIFT){
        inputed = "SHIFT";
      } else if(keyCode == CONTROL){
        inputed = "CONTROL";
      } else if(keyCode == ALT){
        inputed = "ALT";
      } else if(keyCode == RIGHT){
        inputed = "RIGHT";
      } else if(keyCode == LEFT){
        inputed = "LEFT";
      } else if(keyCode == UP){
        inputed = "UP";
      } else if(keyCode == DOWN){
        inputed = "DOWN";
      }
    }else{
      if(_key==ENTER) inputed = "ENTER";
      else if(_key==BACKSPACE) inputed = "BACKSPACE";
      else if(_key==TAB) inputed = "TAB";
      else inputed = ""+_key;
    }
    print("INPUT:" + inputed + "\n");
  }
}
