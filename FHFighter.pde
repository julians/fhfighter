import processing.opengl.*;

final static int WIDTH = 800;
final static int HEIGHT = 600;
final static int ENEMYCOUNT = 100;
final static int ENEMYSTARTX=0;
final static int ENEMYSTARTY=0;

ArrayList bullets = new ArrayList();
ArrayList enemies = new ArrayList();

boolean fuckOff = false;

Rectangle bg = new Rectangle(0, 0, WIDTH, HEIGHT);

Starfighter sf = new Starfighter(200,500);

void createEnemies(int startX,  int startY){
  for(int i=0; i< ENEMYCOUNT; i++){
    enemies.add(new Enemy(startX+i*15, startY, 100));
  }
}

void setup(){

  size(WIDTH, HEIGHT, OPENGL);
  createEnemies(ENEMYSTARTX,ENEMYSTARTY);

}

void draw(){
  noStroke();
  fill(0, 50);
  rect(0,0,width,height);
  background(0);
  fill(255);
  sf.draw();
  fill(255, 0, 0);
  Bullet bullet;
  for (int i = 0; i < bullets.size(); i++) {
    bullet = (Bullet) bullets.get(i);
    if (!bg.intersects(bullet.hitbox)) {
      bullet = null;
      bullets.remove(i);
      continue;
    }
    bullet.draw(); 

    for (int j=0;j<enemies.size(); j++){
      if (((Enemy) enemies.get(j)).blah.intersects(bullet.hitbox)){
       enemies.remove(j);
      }
    }

  }


  fill(0,255,0);println(enemies.size());
  for(int i=0;i<enemies.size();i++){
   ((Enemy) enemies.get(i)).draw();
  }
}

void keyPressed() 
{ 
  sf.keyPressed();

} 

void keyReleased() 
{ 
  sf.keyReleased();
} 









