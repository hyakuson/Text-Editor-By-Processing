class Shape{
  protected int x,y;
  protected int width,height;
  protected color c;

  int getPositionX(){
    return this.x;
  }

  int getPositionY(){
    return this.y;
  }
  
  /**
   * move to point(x,y)
   * @param _x point-x
   * @param _y point-y
   */
  void moveTo(int _x, int _y){
    this.x = _x;
    this.y = _y;
  }

  void fillTo(color _c){
    this.c = _c;
  }

  void display(){
    
  }
}
