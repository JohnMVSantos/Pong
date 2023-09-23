class Ball {
  
  float xCircle, yCircle;
  float xSpeed, ySpeed;
  float xDirection, yDirection;
  float radius;
  boolean activeBall=false;
  boolean activeSlamBall=true;
  int redPoint, bluePoint;
  int [] RedPoints = new int [11];
  int [] BluePoints = new int [11];
  int in;
  
  Ball() {
    xCircle = width/2;
    yCircle = height/2;
    radius = 31.5;
    xSpeed = 10.8;
    ySpeed = 7.2;
    xDirection = 1;
    yDirection = 1;
    redPoint = 0;
    bluePoint = 0;
    in = 200;
  }
  
  void BallDisplay() {
    fill(255);
    ellipse(xCircle, yCircle, radius, radius);
    imageMode(CENTER);
    image(ballImage, xCircle, yCircle, radius-1.5, radius-1.5);
  }

  void MoveBall() {

    if (activeBall) {
      xCircle = xCircle + (xSpeed * xDirection);
      yCircle = yCircle + (ySpeed * yDirection);
    } 

    //Powerup Information
    if (xDirection > 0 && powerupSlamBall.hitsSlamBall(ball)) {
      xCircle = Paddles[0].xRectangle+Paddles[0].widthRectangle/2;
      yCircle = Paddles[0].yRectangle+Paddles[0].heightRectangle/2;
      xSpeed=40;
      ySpeed=0;
    } else if (xSpeed == 40 && (xCircle>width+in || Paddles[1].overlaps(ball))) {
      xSpeed=10.8;
      ySpeed=7.2;
    }

    if (xDirection<0 && powerupSlamBall.hitsSlamBall(ball)) { 
      xCircle=Paddles[1].xRectangle+Paddles[1].widthRectangle/2;
      yCircle=Paddles[1].yRectangle+Paddles[1].heightRectangle/2;
      xSpeed=-40;
      ySpeed=0;
    } else if (xSpeed==-40 && (xCircle<-in || Paddles[0].overlaps(ball))) {
      xSpeed=10.8;
      ySpeed=7.2;
    }
    //************************************//
  }

  void CheckEdges() {

    //Bouncing Ball
    if (Paddles[0].overlaps(ball) || Paddles[1].overlaps(ball) && (Paddles[0].inside(ball) || Paddles[1].inside(ball))) {
      xDirection=xDirection*-1;
    }

    if (yCircle>height-radius || yCircle<radius) {
      yDirection=yDirection*-1;
    }
    //************************************//

    //Point System//
    for (int i=0; i<BluePoints.length; i++) {
      if (xCircle<-in) {
        xCircle=width/4;
        yCircle=height/2;
        xSpeed=xSpeed*-1;
        ySpeed=ySpeed*-1;
        bluePoint=bluePoint+1;
      } else if (bluePoint==10) {
        text("GAME OVER", 60, 60);
        xCircle=width/2;
        yCircle=height/2;
      }
      text(BluePoints[i], width/2+20, 40);
      BluePoints[i]=bluePoint;
    }

    for (int i=0; i<RedPoints.length; i++) {
      if (xCircle>width+in) {
        xCircle=width-width/4;
        yCircle=height/2;
        xSpeed=xSpeed*-1;
        ySpeed=ySpeed*-1;
        redPoint=redPoint+1;
      } else if (redPoint==10) {
        text("GAME OVER", width-240, 60);
        xCircle=width/2;
        yCircle=height/2;
      }
      text(RedPoints[i], width/2-50, 40);
      RedPoints[i]=redPoint;
    }
    //***********************************//
  }
}
