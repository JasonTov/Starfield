float skew = 2;
boolean oddballDir = false;
float speedMod = 10;
int centerX = 250;
int centerY = 250;
int maxR = 150;
int minR = 50;
int num = 50;
int sizeI = 7;
//your code here
Particle[] array = new Particle[num];
void setup()
{
  size(500,500);
  for(int i=0;i<array.length;i++)
  {
    array[i] = new Particle();
    if(i%12==0)
    {
      array[i] = new OddballParticle();
    }
  }
}
void draw()
{
  background(0,0,0);
  
  fill(255,255,255);
  ellipse(centerX,centerY,20,20);
  
  
  for(int i=0;i<array.length;i++)
  {
    array[i].Show();
  }
  
}



class Particle
{
  //your code here
  float x,y,ang,speed,r,size;
  color c;
  Particle()
  {
    size = sizeI;
    ang =(float)(Math.random()*2*Math.PI);
    r = minR+(float)(Math.random()*maxR);
    speed=(speedMod*0.001)*(r/100);
    x=0;
    y=0;
    c = color((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
  void Move()
  {
    ang+=speed;
    x=centerX+(int)(Math.sin(ang)*r);
    y=centerY+(int)(Math.cos(ang)*r);
  }
  void Show()
  {
    fill(c);
    ellipse(x,y,size,size);
    Move();  
  }
}

class OddballParticle extends Particle//inherits from Particle
{
  OddballParticle()
  {
    size = 5;
    speed=(speedMod*0.001)*(r/50);
  }
  void Move()
  {
    if(oddballDir)
    {
      ang+=speed;
    }
    else
    {
      ang-=speed;
    }
    x=centerX+(int)(Math.sin(ang)*r/skew);
    y=centerY+(int)(Math.cos(ang)*r);
  }
}
