class Lines extends Shape{
  private int size;  //text size
  
  private String text;
  
  /**
   * constractor
   * @param _x 
   * @param _y 
   * @param _text 
   * @param _c 
   */
  Lines(String _text){
    this.x    = 5;
    this.y    = 5;
    this.text = _text;
    this.c    = color(0,0,0);
    this.size = 20;
  }
  
  /**
   * change font size
   */
  void sizeTo(int _s){
    this.size = _s;
  }
  
  /**
   * get text height(pixel)
   */
  int getTextHeight(){
    return this.size;
  }
  
  /**
   * get text width(pixel)
   */
  int getTextWidth(){
    // get text width correctry, must call textSize() before.
    textSize(this.size);
    return (int)textWidth(this.text);
  }
  
  String getText(){
    return this.text;
  }
  
  void setText(String _text){
    this.text = _text;
  }
  
  /**
   * get inputed text length (includes line ends)
   */
  int getTextLength(){
    return this.text.length();
  }

  void display(int offsetX, int offsetY, int lineNo){
    fill(this.c);
    textSize(this.size);
    // 1.2 and 1.08 is adjast scale
    text(this.text, offsetX * 1.2,
         ((offsetY + textAscent() - textDescent()) * 1.08) * (lineNo + 1));
  }
}
