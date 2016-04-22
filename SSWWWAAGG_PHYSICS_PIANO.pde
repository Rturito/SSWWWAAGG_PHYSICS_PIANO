import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

int y;
int x;

Minim minim;
AudioOutput out;

void setup()
{
  fullScreen(P3D);
  
  x=width/2;
  y=height/2;
  
  rectMode(CENTER);
  rect(x,y,100,100);
  
  minim = new Minim(this);
  
  out = minim.getLineOut();
}

void draw()
{
  if(( mouseX > x-50 && mouseX < x+50) 
   && ( mouseY > y-50 && mouseY < y+50))
   {
     out.setTempo(40);
     out.playNote("G3");
     
     fill(204, 102, 0);
     rect(x,y,100,100);
   }
   else
   {
     fill(0);
     rect(x,y,100,100);
   }
}

/*
if(( mouseX > x && mouseX < x+50) 
   && ( mouseY > y && mouseY < y+50))
{
}
*/