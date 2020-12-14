class Ball { 
  float x;
  float y;
  float size = random(1, 4);
  float life = 455;
  color c;
  float x0 = random(-1, 1);
  float y0 = random(-1, 1);
  //--------------------------------
  PVector dir= new PVector(0, 0);
  PVector vel= new PVector(0, 0);
  PVector pos = new PVector(0, 0);
  float speed = 1.7;
  Ball(float tempX, float tempY, color _c, int my_, float px, float py) {
    x = tempX-img[my_].width/2+px;
    y = tempY-img[my_].height/2+py;
    c = _c;
    pos.x = x;
    pos.y = y;
  }

  void move() {
    x+=x0;
    y+=y0;
    float angle = noise(this.pos.x/noiseScale, this.pos.y/noiseScale)*TWO_PI*noiseScale/5.0;
    this.dir.x = cos(angle);
    this.dir.y = sin(angle);
    this.vel = this.dir.copy();
    this.vel.mult(this.speed);
    this.pos.add(this.vel);
  }

  boolean finished() {
    // if (!cheak)
    life--;
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    fill(c, life);
    ellipse(pos.x, pos.y, size, size);
  }
}  
