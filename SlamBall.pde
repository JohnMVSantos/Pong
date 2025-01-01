class SlamBall extends PowerUp {
  
  int direction = 0;
  float slamSpeed = 40;
  
  SlamBall(float radius) {
    /**
     * Initializes the SlamBall powerup.
     *
     * @param {float} radius - The radius to display the power up in pixels. 
     *                         This also represents the hitbox.
     */
    super(radius);
  }
  
  void display() {
    /**
     * Displays the powerup on the screen.
     * 
     */
    imageMode(CENTER);
    image(slamBallImage, x, y, radius, radius);
  }
  
  void deploy() {
    /**
     * Activate the powerup by positioning the ball
     * at the paddle that hits the powerup and then the ball
     * rapidly traverses towards the opposite side.
     */
     
    active = true;
    // Have the ball start at the paddle that hits the powerup.
    if (ball.xDirection > 0) {
      ball.x = paddles[0].x + paddles[0].widthPaddle / 2;
      ball.y = paddles[0].y + paddles[0].heightPaddle / 2;
      ball.xSpeed = slamSpeed;
      ball.ySpeed = 0;
      // Powerup moves towards positive direction.
      direction = 1;
    }  
    else { 
      ball.x = paddles[1].x + paddles[1].widthPaddle / 2;
      ball.y = paddles[1].y + paddles[1].heightPaddle / 2;
      ball.xSpeed = -slamSpeed;
      ball.ySpeed = 0;
      // Powerup moves in the negative direction.
      direction = -1;
    }
  }
  
  void endState() {
    /**
     * End the powerup if deflected or the ball is scored.
     */
     
     // Resetting the ball state after SlamBall powerup deployed.
    if (active) {
      if (direction > 0 && (ball.x - ball.radius > width  || paddles[1].hitsBall())) {
        ball.xSpeed = ballSpeed;
        ball.ySpeed = ballSpeed;
        active = false;
        //ball.x = width / 2;
        //ball.y = height / 2;
      }
      else if (direction < 0 && (ball.x + ball.radius < 0 || paddles[0].hitsBall())) {
        ball.xSpeed = ballSpeed;
        ball.ySpeed = ballSpeed;
        active = false;
        //ball.x = width / 2;
        //ball.y = height / 2;
      }    
    }
  }
   
}
