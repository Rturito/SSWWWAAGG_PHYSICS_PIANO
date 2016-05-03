import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// The Nature of Code
// <http://www.shiffman.net/teaching/nature>
// Spring 2011
// Box2DProcessing example

// An uneven surface

import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*;
import org.jbox2d.dynamics.*;
import org.jbox2d.dynamics.joints.*;

Minim minim;
AudioOutput out;

// A reference to our box2d world
Box2DProcessing box2d;

ArrayList<Particle> particles;


//Particle[] particles;

// An ArrayList of particles that will fall on the surface
Box box;
// An object to store information about the uneven surface
Surface surface;
Spring spring;
void setup() 
{
  fullScreen(P3D);
  smooth();
  
  minim = new Minim(this);
  
  out = minim.getLineOut();
 
  // Initialize box2d physics and create the world
  box2d = new Box2DProcessing(this);
  box2d.createWorld();
  box = new Box(width/2, height/2);
  spring = new Spring();
  particles = new ArrayList<Particle>();

  // We are setting a custom gravity
  box2d.setGravity(0, -10);

  // Create the empty list

  // Create the surface
  surface = new Surface();
}
void mouseReleased() 
{
  spring.destroy();
}

void mousePressed() {
  // Check to see if the mouse was clicked on the box
  if (box.contains(mouseX, mouseY)) 
  {
    // And if so, bind the mouse location to the box with a spring
    spring.bind(mouseX,mouseY,box);
  }
}

void draw() 
{
  background(150, 150, 255);
  // We must always step through time!
  box2d.step();
  
  if (random(1) < 0.20) 
  {
    float sz = random(1,5);
    
    
    particles.add(new Particle(width/2,10,sz));
  }
  
  spring.update(mouseX,mouseY);
  
  for (Particle p: particles) 
  {
    p.display();
    p.done(); 
  }
  // Draw the surface
  //surface.display();
  box.display();
  spring.display();
  // Draw all particles
  
}