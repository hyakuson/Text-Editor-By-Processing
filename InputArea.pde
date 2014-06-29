class InputArea extends Shape{
  
  /**
   * constractor
   * @param _x component position-x
   * @param _y component position-y
   * @param _width component width
   * @param _height component height
   * @param _c component background color
   */
  InputArea(int _x, int _y, int _width, int _height, color _c){
    this.x      = _x;
    this.y      = _y;
    this.width  = _width;
    this.height = _height;
    this.c      = _c;
  }
  
  public void display(){
    rectMode(CORNER);
    noStroke();
    fill(c);
    rect(this.x, this.y, this.width, this.height);
  }
}
