class Paddle {
   
  float x, y;
  float speed = 15;
  int direction = 0;
  float heightPaddle, widthPaddle;
  color colour;
  
  Paddle(float xPos, float yPos, float h, float w, color c) {
    /** 
     * Initializes the paddle object.
     *
     * @param {float} xPos - The x position in pixels of the paddle's center. 
     * @param {float} yPos - The y position in pixels of the paddle's center.
     * @param {float} h - The height of the paddle in pixels.
     * @param {float} w - The width of the paddle in pixels.
     * @param {tuple} c - The color of the paddle in RGB format.
     */
    x = xPos;
    y = yPos;
    
    heightPaddle = h;
    widthPaddle = w;
    colour = c;
  }
  
  void display() {
    /**
     * Displays the paddle on the screen.
     */
    if (hitsBall()) {
      delay(5);
      strokeWeight(10);
      stroke(255); 
    } else {
      strokeWeight(2); 
    }
    
    rectMode(CENTER);
    fill(colour);
    rect(x, y, widthPaddle, heightPaddle);
  }
  
  boolean hitsBall() {
    /**
     * Condition to check if the paddle hits the paddle.
     * Check if the ball is within the paddle's height constraints.
     * Check if the ball is directly infront of the paddle.
     *
     * @returns {boolean} True if the paddle hits the ball. False otherwise.
     */
     
     if ((ball.y + ball.radius > y - heightPaddle / 2) && 
         (ball.y - ball.radius < y + heightPaddle / 2)) {
       
       // If the ball is behind the paddle, then ball was not intersected by the paddle.
       if (((x > width / 2) && (ball.x > x)) || ((x < width /2) && (ball.x < x))) {
         return false;
       }
           
       // Calculating the lateral distance to check ball to paddle contact only.
       float distance = dist(x, ball.y, ball.x, ball.y);
       if (distance <= (widthPaddle / 2 + ball.radius)) {
         return true;
       } 
     }
    return false;
  }
}
