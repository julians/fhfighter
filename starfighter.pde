class Starfighter{
  float x;
  float y;
  float targetX;
  float targetY;
  boolean keyUp;
  boolean keyDown;
  boolean keyRight;
  boolean keyLeft;
  float lionel=10;
  float acceleration=20;
  float shipWidth = 30;
  float shipHeight = 30;


  Starfighter(float _x, float _y){
    this.x = _x;
    this.y = _y;
    this.targetX=this.x;
    this.targetY=this.y;


  }

  void keyPressed(){

    if(keyCode==UP)
      this.keyUp=true;
    else if(keyCode==DOWN)
      this.keyDown=true;

    if(keyCode==LEFT)
      this.keyLeft=true;
    else if(keyCode==RIGHT)
      this.keyRight=true;
  }

  void keyReleased(){
    if(keyCode==UP)
      this.keyUp=false;
    else if(keyCode==DOWN)
      this.keyDown=false;
    if(keyCode==LEFT)
      this.keyLeft=false;
    else if(keyCode==RIGHT)
      this.keyRight=false;
    if (key == ' ') this.shoot();
  }


  void move(){
    if(this.keyUp){
      this.targetY-=this.lionel;
    }
    if(this.keyDown){
      this.targetY+=this.lionel;
    }
    if(this.keyRight){
      this.targetX+=this.lionel;
    }
    if(this.keyLeft){
      this.targetX-=this.lionel;
    }


    if (this.x - this.shipWidth/2 < 0 && this.targetX < 0) {
      this.targetX *= -1;
    }
    else if (this.x + this.shipWidth/2 > width && this.targetX > width) {
      this.targetX = width - (this.targetX - width);
    }
    if (this.y < 0 && this.targetY < 0) {
      this.targetY *= -1;
    }
    else if (this.y + this.shipHeight > height && this.targetY + this.shipHeight > height) {
      this.targetY = height - (this.targetY - height) - this.shipHeight;
    }


    this.x+=(this.targetX-this.x)/this.acceleration;
    this.y+=(this.targetY-this.y)/this.acceleration;




  }

  void shoot(){
    bullets.add(new Bullet(this.x, this.y, this.targetX - this.x, this.targetY - this.y));
  }


  void draw(){
    this.move();
    triangle(this.x - this.shipWidth/2, this.y + this.shipHeight, this.x, this.y, this.x + this.shipWidth/2, this.y + this.shipHeight);
  }
}  
