class PowerUp {
  
  float xPowerUp;
  float yPowerUp;
  boolean activeSlamBall=true;
  float radiusSlamBall;

  PowerUp() {
    xPowerUp=random(width);
    yPowerUp=random(height);
    radiusSlamBall=20;
  }
  
  void SlamBall() {
    if (activeSlamBall) {
      imageMode(CENTER);
      image(slamBallImage, xPowerUp, yPowerUp, radiusSlamBall, radiusSlamBall);
    }
  }
  
  boolean hitsSlamBall(Ball thisBall) {
    float distance = dist(xPowerUp, yPowerUp, thisBall.xCircle, thisBall.yCircle);
    if (distance<(thisBall.radius+radiusSlamBall) && distance<(thisBall.radius+radiusSlamBall)) {
      return true;
    } 
    return false;
  }
  
  void FreezePaddle() {
  }
  
}
