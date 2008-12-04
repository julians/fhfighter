class Bullet{
  int radius = 10;
  float speedX = 0;
  float speedY = -20;
  Rectangle hitbox;

  Bullet(float _x, float _y, float _speedX, float _speedY){
    this.hitbox = new Rectangle((int) _x-radius, (int) _y-radius, radius*2, radius*2);
    if (_speedY < 0) this.speedY += _speedY;
    this.speedX += _speedX/50;
  }

  void move(){
    this.hitbox.setLocation((int) (this.hitbox.getX() + this.speedX), (int) (this.hitbox.getY() + this.speedY));
    
  }

  void draw() {
    this.move();
    ellipse((int) (this.hitbox.getX() + this.radius), (int) (this.hitbox.getY() + this.radius), this.radius * 2, this.radius * 2);
  }


}

