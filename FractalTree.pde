private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
public void setup() 
{   
  size(640,550);    
  noLoop(); 
} 
public void draw() 
{   
  background(0);   
  stroke(0,255,0);   
  line(320,480,320,380); 
  drawBranches(320, 380, 100, 3*(Math.PI/2), 320, 550);
} 
public void drawBranches(int x,int y, double branchLength, double angle, int a, int b) 
{   
  double angle1 = angle;
  double angle2 = angle;
  double angle3 = 0;
  double angle4 = 0;
  angle1 = angle1 + branchAngle;  
  angle2 = angle2 - branchAngle;
  angle3 = angle3 + branchAngle;  
  angle4 = angle4 - branchAngle;
  branchLength = branchLength*fractionLength;
  int endX1 = (int)(branchLength*Math.cos(angle1) + x);
  int endY1 = (int)(branchLength*Math.sin(angle1) + y);
  int endX2 = (int)(branchLength*Math.cos(angle2) + x);
  int endY2 = (int)(branchLength*Math.sin(angle2) + y);
  int endX3 = (int)(branchLength*Math.cos(angle3) + a);
  int endY3 = (int)(b -branchLength*Math.sin(angle3));
  int endX4 = (int)(a - branchLength*Math.cos(angle3));
  int endY4 = (int)(b - branchLength*Math.sin(angle3));
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  line(a, b, endX3, endY3);
  line(a, b, endX4, endY4);
  if(branchLength > smallestBranch){
    drawBranches(endX1, endY1, branchLength, angle1, endX3, endY3);
    drawBranches(endX2, endY2, branchLength, angle2, endX4, endY4);
  }
} 
