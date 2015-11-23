void setup(){
  size(800,800);
  translate(width/2,height/2);
  rotate(radians((int)(Math.random()*180)));
  for(int i=0; i<parts.length; i++){
    parts[i]=new Particle();
    if(i==0){
      parts[i]=new Ball();
    }
  }
}
interface Obj{
  void show();
  void move(); 
}
final int num=500;
Obj [] parts= new Obj [num];
int count;
double speed=(Math.sin(millis()));
class Particle implements Obj{
    float x,y;
    double xSpeed=(Math.random()*2-1);
    double ySpeed=0;
    int col,rad;
    Particle(){
        this.x=width/2+(int)(Math.random()*400-200);
        this.y=(float)((height/2+(Math.random()*2-1)*(float)(Math.sqrt(40000-(Math.abs(width/2-x))*(Math.abs(width/2-x))))));
        this.col=color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
    }
    void show(){
      noStroke();
      fill(col);
      ellipse(x,y,rad,rad);
    }
    void move(){
        x+=xSpeed;
        y+=ySpeed;
        if(dist(x,y,width/2,height/2)>200){
          xSpeed*=-1;
          //ySpeed*=-1;
        }
    }
}
class Ball implements Obj{
    float x,y,xSpeed,ySpeed;
    float holder;
    Ball(){
        this.x=300+(float)(Math.random()*200);
        this.y=300+(float)(Math.random()*200);
        this.xSpeed=(float)(Math.random()*6-3);
        this.ySpeed=(float)(Math.random()*6-3);
    }
    void show(){
        fill(100,100,200);
        ellipse(x,y, 20,20);
    }
    void move(){
      x+=xSpeed+(Math.sin(count)*20);
      y+=ySpeed+(Math.cos(count)*20);
      if(x<10||x>width-10){
        xSpeed*=-1;
      }
      if(y<10||y>height-10){
        ySpeed*=-1;
      }
    }
}
void draw(){
   fill(0,0,0,40);rect(0,0,width,height);
   for(int i =0; i<parts.length; i++){
   /*if(i==1){
    parts[i].rad=50;
    }else{*/
      parts[i].rad=5;
    }
     parts[i].show();
     parts[i].move();
     //cannot acces an "active" variable not defined in the interface
     //line(parts[i].x, parts[i].y, parts[i+1].x, parts[i+1].y); 
   }
   count++;

}
