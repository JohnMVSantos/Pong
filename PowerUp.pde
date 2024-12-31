class PowerUp {
  
  float x, y, radius;
  boolean active = false;

  PowerUp(float radiusPowerUp) {
    /** 
     * Initializes the power up object.
     *
     * @param {float} radiusPowerUp - The radius to display the power up in pixels. 
     *                                This also represents the hitbox.
     */
    x = random(width);
    y = random(height);
    radius = radiusPowerUp;
  }
  
  boolean hit() {
    /** 
     * Check if the power up was hit by the ball.
     * 
     * @returns {boolean} True if the ball hits the powerup, False otherwise. 
     */
    if (dist(x, y, ball.x, ball.y) < (ball.radius + radius)) {
      x = random(width);
      y = random(height);
      
      return true;
    } 
    return false;
  }
  
}
