class Paddle {
  
  float xRectangle, yRectangle;
  float rectSpeed;
  float rect1Direction, rect2Direction;
  float heightRectangle, widthRectangle;
  color colour;
  
  Paddle(float xRect, float yRect, float heightRect, float widthRect, float rectspeed) {
    xRectangle=xRect;
    yRectangle=yRect;
    heightRectangle=heightRect;
    widthRectangle=widthRect;
    rectSpeed=rectspeed;
    rect1Direction=0;
    rect2Direction=rect1Direction;
  }

  void PongControls() {
    if (keyPressed && (key=='w'||key=='s')) {
      yRectangle = yRectangle + (rectSpeed * rect1Direction);
    } 

    if (keyPressed && (keyCode==UP||keyCode==DOWN)) {
      yRectangle = yRectangle + (rectSpeed * rect2Direction);
    }
  }

  void PongPaddles() {
    if (Paddles[0].overlaps(ball) || Paddles[1].overlaps(ball)) {
      delay(5);
      strokeWeight(10);
      stroke(255);
    } else {
      strokeWeight(2);
    }
    rectMode(CENTER);
    fill(colour);
    rect(xRectangle, yRectangle, widthRectangle, heightRectangle);
  }
  
  boolean overlaps (Ball thisBall) {
    float distance = dist(xRectangle, yRectangle, thisBall.xCircle, thisBall.yCircle);
    if ((distance<((widthRectangle/2)+thisBall.radius))) {
      return true;
    } 
    return false;
  }
  
  boolean inside (Ball thisBall) {
    if (((thisBall.yCircle-thisBall.radius)>(yRectangle-(heightRectangle/2))) && ((thisBall.yCircle+thisBall.radius)<(yRectangle+(heightRectangle/2)))) {
      return true;
    } 
    return false;
  }
}
