ArrayList<Ball> balls;
ArrayList<IM> im;
PImage []img = new PImage[22];
float s = 0.4;
float s1 = 0.35;
boolean cheak = false;
int now = -1;
float noiseScale = 600.0;
void setup() {
  fullScreen();
  //size(1440,900);
  imageMode(CENTER);
  smooth();
  noStroke();
  fill(0);
  balls = new ArrayList<Ball>();
  im = new ArrayList<IM>();
  for (int i = 0; i<22; i++)
  {
    img[i] = loadImage("pic_"+i+".png");
    //img[i+1].resize((int)(img[i+1].width*s), (int)(img[i+1].height*s));
  }
}

void draw() {
  background(0); 
  //image(bg, width/2, height/2);
  //---------------------------------------------------
  for (int i = 0; i<=im.size()-1; i++) { 
    IM ims = im.get(i);
    ims.show();
    //if (ims.finished()) {
    //  im.remove(i);
    //}
  }
  //----------------------------------------------------------
  for (int i = 0; i<=balls.size()-1; i++) { 
    Ball ball = balls.get(i);
    ball.move();
    ball.display();
    if (ball.finished()) {
      balls.remove(i);
    }
  }
}

void mouseReleased() {
  now++;
  if (now>21)
    now = 0;
  im.add(new IM(width/2, height/2, now));
}
void keyReleased() {
  if (im.size()!=0)
  {
    IM ims = im.get(0);
    ims.ppd();
    im.remove(0);
  }
}
