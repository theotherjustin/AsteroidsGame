SpaceShip rocket;
Asteroid[] rock;
Star[] nightSky = new Star[400];//your variable declarations here
float gravity = 1.01;
boolean LEFTIsPressed = false;
boolean RIGHTIsPressed = false;
boolean UPIsPressed = false;
public void setup() 
{     
  //your code here
  rock = new Asteroid[20];
  rocket = new SpaceShip();
  size(1000,650);
  for (int i = 0; i < nightSky.length; i++)
  {
    nightSky[i] = new Star();
  }
   for(int i = 0; i< rock.length; i++)
  {
    rock[i] = new Asteroid();
  }
}
public void draw() 
{
  //your code here
  background(0);
  for (int i = 0; i < nightSky.length; i++)
  {
    stroke(1);
    nightSky[i].show();
  }
  if(UPIsPressed == true)
  {
    rocket.accelerate(0.2);
  }
  if(LEFTIsPressed == true)
  {
    rocket.rotate(-10);
  }
  if(RIGHTIsPressed == true)
  {
    rocket.rotate(10);
  }
  rocket.show();
  rocket.move();
  for(int i = 0; i <rock.length; i++)
  {
  rock[i].show();
  rock[i].move();
}
}
public void keyPressed(){
    if (keyCode == UP) {
      UPIsPressed = true;
     
    }
    else if (keyCode == LEFT){
      LEFTIsPressed = true;
      
    }
    else if (keyCode == RIGHT){
      RIGHTIsPressed = true;
      
    }
      if (keyCode == DOWN){
      rocket.setX((int)(Math.random()*1000));
      rocket.setY((int)(Math.random()*650));
      rocket.setDirectionX(0);
      rocket.setDirectionY(0);
      rocket.setPointDirection((int)(Math.random()*360));
    }

  
}
public void keyReleased(){
  if(keyCode == UP )
  {
    UPIsPressed = false;
  }
  else if(keyCode == LEFT)
  {
    LEFTIsPressed = false;
  }
  else if(keyCode == RIGHT)
  {
    RIGHTIsPressed = false;
  }
}
class SpaceShip extends Floater  
{   
 
    public SpaceShip()
    {
      myColor = 255;
      r = 255;
      g = 255;
      b = 255;
      corners = 8;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] = 16;
      yCorners[0] = 0;
      xCorners[1] = 0;
      yCorners[1] = -13;
      xCorners[2] = -5;
      yCorners[2] = -9;
      xCorners[3] = 0;
      yCorners[3] = -6;
      xCorners[4] = -16;
      yCorners[4] = 0;
      xCorners[5] = 0;
      yCorners[5] = 6;
      xCorners[6] = -5;
      yCorners[6] = 9;
      xCorners[7] = 0;
      yCorners[7] = 13;
      myCenterX = 400;
      myCenterY= 250;
      myPointDirection = 0;
      myDirectionX = 0;
      myDirectionY = 0;
    }
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myDirectionX = myDirectionX/gravity;
    myDirectionY = myDirectionY/gravity;
    

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}

}
class Asteroid extends Floater 
    {
      private double rotation;
        public Asteroid()
        {
        r = 255;
        g = 150;
        b = 150;
          corners = 4;
      xCorners = new int[corners];
      yCorners = new int[corners];
      xCorners[0] =-10;  //(int)(Math.random()*6)+ 8;
      yCorners[0] = 10;//(int)(Math.random()*6) + 3;
      xCorners[1] = -10;//(int)(Math.random()*6) + 1;
      yCorners[1] = -10;//-(int)(Math.random()*6) + 7;
      xCorners[2] = 10;//-(int)(Math.random()*6) + 5;
      yCorners[2] = -10;//-(int)(Math.random()*6) + 2;
      xCorners[3] = 10;//(int)(Math.random()*6) + 4;
      yCorners[3] = 10;//-(int)(Math.random()*6) + 6;
      myCenterX = (int)(Math.random()*1000);
      myCenterY= (int)(Math.random()*650);
      myPointDirection = 0;
      myDirectionX = (int)(Math.random()*6)-3;
      myDirectionY = (int)(Math.random()*6)-3;
      rotation = Math.random();

        }
  public void setX(int x){myCenterX = x;}
  public int getX(){return (int)myCenterX;}
  public void setY(int y){myCenterY = y;}
  public int getY(){return (int)myCenterY;}
  public void setDirectionX(double x){myDirectionX = x;}
  public double getDirectionX(){return (double)myDirectionX;}
  public void setDirectionY(double y){myDirectionY = y;}
  public double getDirectionY(){return (double)myDirectionY;}
  public void setPointDirection(int degrees){myPointDirection = degrees;}
  public double getPointDirection(){return myPointDirection;}
    public void move()
  {
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     
    myPointDirection += rotation;

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }  
    } 
    }
abstract class Floater //Do NOT modify the Floater class! Make changes in the SpaceShip class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor; 
  protected int r;
  protected int g;
  protected int b;
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myDirectionX, myDirectionY; //holds x and y coordinates of the vector for direction of travel   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    
  abstract public void setX(int x);  
  abstract public int getX();   
  abstract public void setY(int y);   
  abstract public int getY();   
  abstract public void setDirectionX(double x);   
  abstract public double getDirectionX();   
  abstract public void setDirectionY(double y);   
  abstract public double getDirectionY();   
  abstract public void setPointDirection(int degrees);   
  abstract public double getPointDirection(); 

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myDirectionX += ((dAmount) * Math.cos(dRadians));    
    myDirectionY += ((dAmount) * Math.sin(dRadians));       
  }   
  public void rotate (int nDegreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=nDegreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myDirectionX and myDirectionY       
    myCenterX += myDirectionX;    
    myCenterY += myDirectionY;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    }   
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(r,g,b);   
    stroke(myColor);    
    //convert degrees to radians for sin and cos         
    double dRadians = myPointDirection*(Math.PI/180);                 
    int xRotatedTranslated, yRotatedTranslated;    
    beginShape();         
    for(int nI = 0; nI < corners; nI++)    
    {     
      //rotate and translate the coordinates of the floater using current direction 
      xRotatedTranslated = (int)((xCorners[nI]* Math.cos(dRadians)) - (yCorners[nI] * Math.sin(dRadians))+myCenterX);     
      yRotatedTranslated = (int)((xCorners[nI]* Math.sin(dRadians)) + (yCorners[nI] * Math.cos(dRadians))+myCenterY);      
      vertex(xRotatedTranslated,yRotatedTranslated);    
    }   
    endShape(CLOSE);  
  }   
} 
class Star
{
  private int myX, myY;
  public Star()
  {

    myX = (int)(Math.random()*1000);
    myY = (int)(Math.random()*700);
  }
  public void show()
  {
    fill(255);
    ellipse(myX, myY, 3, 3);
  }
}