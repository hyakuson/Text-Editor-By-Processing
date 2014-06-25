import java.util.LinkedList;

class TextArea {
  // text area property
  int x, y;
  int width, height;
  color textarea_color;

  // cursor position
  int cursorLineNo;
  int cursorCharNo;
  
  int INIT_LINE_COUNT=6;

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
    inputArea = new InputArea(this.x + 5,
                              this.y + 5, 
                              this.x + this.width  - (5 + 5),
                              this.y + this.height - (5 + 5), 
                              color(255));

    // text
    for(int i=0; i<INIT_LINE_COUNT; i++){
      lines.add(new Lines("LINE:"+i));
    }
    
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
  
  public void moveCursor(char key){
    if(key == CODED){
      if(keyCode == UP){
        print("PRESS:UP\n");
        
      }else if(keyCode == DOWN){
        print("PRESS:DOWN\n");
        
      }else if(keyCode == LEFT){
        print("PRESS:LEFT\n");
        
      }else if(keyCode == RIGHT){
        // move cursor to right
        print("PRESS:RIGHT\n");
        moveCursorRight();
      }    
    }
  }
  
  private void moveCursorRight(){
    if(isOverLineEnd()){
      if(hasNextLine()){
        // move to next line
        moveCursorTo(cursor.getLineNo()+1,0);
      }
    }else{
      moveCursorTo(cursor.getLineNo(),cursor.getCharNo()+1);
    }
  }
  
  private boolean isOverLineEnd(){
    return cursor.getCharNo() >= lines.get(cursor.getLineNo()).getTextLength();
  }
  
  private boolean hasNextLine(){
    return cursor.getLineNo()+1 < lines.size();
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

  // DEBUG METHOD
  void printCursorPosition(){
    print("LINE:" + this.cursor.getLineNo() + "\n");
    print("CHAR:" + this.cursor.getCharNo() + "\n");
  }
}
