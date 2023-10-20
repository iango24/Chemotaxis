Guy purple;
Children [] kids;
boolean dead;
int a;
int b;

//bear eat children, children run away, leave red stains when children eaten
class Guy {
  int myX, myY;
  Guy(){
    myX=myY=500;
  }
  void walk(){
   myX = mouseX;
   myY = mouseY;
  }
  void show(){
    fill(102, 0, 204);
    noStroke();
    rect(myX-40,myY-40, 80,120);
    rect(myX-48,myY-30, 100, 90);
    fill(0);
    rect(myX-36, myY+40, 70, 30);
    rect(myX-41, myY+36, 80, 5);
    rect(myX-40, myY,30,15);
    rect(myX+10, myY,30,15);
    fill(255);
    rect(myX-42, myY-4,10,18);
    rect(myX+12, myY-4,10,18);
    stroke(0);
    
  }
}
class Children {
  int myX, myY;
  int myColor = color(255,229,204);
  Children(int x, int y){
    myX = x;
    myY = y;
  }
  void run(){
    if (mouseX > myX){
      myX = myX + (int)(Math.random()*5)-4;
    } else if (mouseX < myX) {
      myX = myX + (int)(Math.random()*5)+1;
    } 
    if (mouseY > myY){
      myY = myY + (int)(Math.random()*5)-4;
    } else if (mouseY < myY) {
      myY = myY + (int)(Math.random()*5)+1;
    } 
   if (myX < 20){
     myX = 20;
   } else if (myX > 980){
     myX = 980;
   }
   if (myY < 20){
     myY = 20;
   } else if (myY > 880){
     myY = 880;
   }
   //death animation
   if ( (((myX-20)< mouseX) && ((myX+20)>mouseX)) && ( (((myY-20)< mouseY) && ((myY+20)>mouseY)) )){
     myColor = color(255,0,0);
     ellipse(myX,myY,50,50);
     dead = true;
   }
   a = myX;
   b = myY;
  }
   void show(){
     fill(myColor);
     ellipse (myX, myY, 50, 50);
     fill(0);
     ellipse(myX-10, myY-10, 10, 10);
     ellipse(myX+10, myY-10, 10, 10);
     fill(255);
   }
   void hide(){
     fill(150,150,150);
     noStroke();
     ellipse(myX, myY, 50,50);
   }
}
void setup(){
  size(1000,900);
  purple = new Guy();
  kids = new Children[5];
  for (int i=0; i<kids.length; i++){
    int x = 0;
    int y = 0;
    x = (int)(Math.random()*600)+50;
    y = (int)(Math.random()*600)+50;
    kids[i] = new Children(x,y);
  }
}
void draw(){
  background(150,150,150);
  purple.walk();
  purple.show();
  for (int i=0; i<kids.length; i++){
    kids[i].run();
    if (dead == true){
      dead = false;
      fill(255,0,0);
      ellipse (a,b, 50, 50);
      line(a-10, b-5, a-5, b-10);
      line(a-5, b-5, a-10, b-10);
      line(a+10, b-5, a+5, b-10);
      line(a+5, b-5, a+10, b-10);
      fill(255);
    } else { 
    kids[i].show();
    }
  }
}


