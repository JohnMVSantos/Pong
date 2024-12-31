 class Ball {
  
  float x, y;
  float radius;
  float xSpeed = 10.80;
  float ySpeed = 10.80;
  float xDirection = 1;
  float yDirection = 1;
  
  boolean active = false;
  
  Ball(float xPos, float yPos, float r) {
    /** 
     * Initializes the ball object.
     *
     * @param {float} xPos - The x position in pixels of the ball's center. 
     * @param {float} yPos - The y position in pixels of the ball's center.
     * @param {float} radius - The radius of the ball in pixels.
     */
    x = xPos;
    y = yPos;
    radius = r;
  }
  
  void display() {
    /**
     * Display the ball.
     */
    fill(255);
    ellipse(x, y, radius, radius);
    imageMode(CENTER);
    image(ballImage, x, y, radius, radius);
  }

  void move() {
    /**
     * Continuously update the location of the ball
     * based on the speed and direction defined to
     * see the ball move across the screen. 
     */
    x += xSpeed * xDirection;
    y += ySpeed * yDirection;
    
    bounce();
  }
  
  void bounce() {
    /**
     * Modify x and y directions of the ball if it hits either
     * the edges of the screen or the paddles indicating
     * a bounce.
     */
    if (paddles[0].hitsBall() || paddles[1].hitsBall()) {
      xDirection *= -1;
    }
    else if (y > height - radius || y < radius) {
      yDirection *= -1;
    }
  }
  
}
