Paddle [] Paddles = new Paddle[2];
PowerUp powerupSlamBall;
Ball ball;

PImage ballImage;
PImage slamBallImage;

void setup() { 
  size(1500, 800);
  
  // Powerup Slam Ball Image
  powerupSlamBall=new PowerUp();
  slamBallImage=loadImage("SlamBall.png");

  // Ball Image
  ball=new Ball();
  ballImage=loadImage("football.png");

  //Paddle Information (X-coord Paddle, Y-coord Paddle, Height of Paddle, Width of Paddle, Speed of Paddle)
  Paddles[0] = new Paddle(30, height/2, 80, 25, 10);
  Paddles[1] = new Paddle(width-Paddles[0].xRectangle, height/2, 80, 25, 15);
  Paddles[0].colour=color(255, 0, 0);
  Paddles[1].colour=color(0, 0, 255);
}

void keyPressed() {
  if (key=='w') {
    Paddles[0].rect1Direction=-1;
  }
  if (key=='s') {
    Paddles[0].rect1Direction=1;
  } 
  if (key=='g') {
    ball.activeBall=true;
  }
  if (key==CODED) {
    if (keyCode==UP) {
      Paddles[1].rect2Direction=-1;
    }
    if (keyCode==DOWN) {
      Paddles[1].rect2Direction=1;
    }
  }
}    

void draw() {
  background(0);
  //PowerUp Information
  powerupSlamBall.SlamBall();
  //Ball Information
  ball.BallDisplay();
  ball.MoveBall();
  ball.CheckEdges();
  //Paddle Information
  Paddles[0].PongControls();
  Paddles[1].PongControls();
  Paddles[0].PongPaddles();
  Paddles[1].PongPaddles();

  if (ball.xCircle<0 || ball.xCircle>width) {
    strokeWeight(10);
    stroke(255);
    line(width/2, 0, width/2, height);
  }
  strokeWeight(2);
  stroke(255);
  line(width/2, 0, width/2, height);

  textSize(35);
  fill(255, 0, 0);
  text("RED", width/2-150, 40);
  fill(0, 0, 255);
  text("BLUE", width/2+80, 40);
}
