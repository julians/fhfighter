class Enemy{
  int hitpoints;
  int dir;
  Rectangle blah;
  Enemy(int _x, int _y, int _hp){
    println("enemy alive");
    this.hitpoints=_hp;
    this.blah = new Rectangle(_x, _y, 10, 10);
    this.dir = 1;

  }
  void move(){


    if(this.blah.getX()>width-this.blah.getWidth() || this.blah.getX() - this.blah.getWidth() < 0) {
      dir *= -1;
      this.blah.setLocation((int) this.blah.getX(), (int) this.blah.getY() + 10);
    }
    this.blah.setLocation((int) this.blah.getX() + 3*this.dir, (int) this.blah.getY());


  }

  void draw(){

    this.move();
    //ellipse(this.x, this.y, this.enemyHeight, this.enemyWidth);
    rect((float) this.blah.getX(), (float) this.blah.getY(), (float) this.blah.getWidth(), (float) this.blah.getHeight());
  }
}
