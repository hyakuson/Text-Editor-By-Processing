class Text extends Shape{
  private int size;
  
//  private boolean wrap_mode;
//  private int wrap_width;
  
  private String text;
  
  /**
   * constractor
   * @param _x 
   * @param _y 
   * @param _text 
   * @param _c 
   */
  Text(int _x, int _y, String _text, color _c){
    this.x    = _x;
    this.y    = _y;
    this.text = _text;
    this.c    = _c;
    this.size = 20;
  }
  
  /**
   * change font size
   */
  void sizeTo(int _s){
    this.size = _s;
  }
  
  /**
   * get text height
   * FIXME: strictly, incorrect ...?
   */
  int getTextHeight(){
    return this.size;
  }
  /**
   * get text width
   *
   */
   int getTextWidth(){
     //get textWidth() correctry, must call textSize() before.
     textSize(this.size);
     return (int)textWidth(this.text);
   }
  
  /**
   * add a charcter
   */
  void input(char _c){
    this.text += _c;
  }
  void input(String _s){
    this.text += _s;
  }
  
  /**
   * delete a character
   */
  void backspace(){
    if(getTextLength()>0){
      this.text = this.text.substring(0, getTextLength()-1);
    }
  }
  
  /**
   * get inputed text length (includes line ends)
   */
  int getTextLength(){
    return this.text.length();
  }
  
  /**
   * get aLL line number
   */
  int getAllLines(){
    String[][] lineEnds = matchAll(this.text, "\n");
    return lineEnds != null ? lineEnds.length : 0;
  }
  
  /**
   * get charcter number at line end
   */
  int end(int line_number){
    String text = getTextAtLine()
    return 0;
  }
  
  void display(){
    fill(this.c);
    textSize(this.size);
    // FIXME: 1.2 and 1.08 is adjast scale(unsure...)
    text(this.text, this.x * 1.2,
         (this.y + textAscent()-textDescent()) * 1.08);
  }
}
