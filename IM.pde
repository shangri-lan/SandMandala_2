class IM { 
  float x, y;
  int number;
  int transparency = 255;

  int life = 180;
  IM(float x_, float y_, int number_) {
    x = x_;
    y = y_;
    number = number_;
  }
  void show() {
    if(transparency > 0){
    transparency = transparency-3;
  } 
    tint(255,255,255, 255-transparency);
    image(img[number], x, y);
  }
  //boolean finished() {
  //  if (keyPressed){
  //    //for(int n = 0; n<8; n+=1){
  //    //life--;
  //    //if (life < 0) {
  //    create();
  //    return true;

  //  }else {
  //    return false;
  //  }
  //}
  void ppd() {
    create();
  }

  void create() {
    for (int i = 0; i<35000; i+=1) {
      int xx = int(random(img[number].width));
      int yy = int(random(img[number].height));
      if (((img[number].get(xx, yy) >> 24) & 0xff)>100)
        balls.add(new Ball(x, y, img[number].get(xx, yy), number, xx, yy));
    }
  }
}
