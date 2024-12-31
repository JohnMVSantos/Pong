class Control {
  
  Control() {
    /**
     * Initializes the control object.
     */
  }
  
  void movePaddles() {
    /**
     * Moves the paddles based on the key presses.
     */
    if (keyPressed) {
      if (key == 'w' || key == 's') {
        paddles[0].y += paddles[0].speed * paddles[0].direction;
      }
      
      if (keyCode==UP||keyCode==DOWN) {
        paddles[1].y += paddles[1].speed * paddles[1].direction;
      }
    }
  }
  
  void boundPaddles() {
    /**
     * Limit paddles within the bounds of the screen.
     */
    if (paddles[0].y + paddles[0].heightPaddle / 2 > height) {
      paddles[0].y = height - paddles[0].heightPaddle / 2; 
    } 
    else if (paddles[0].y - paddles[0].heightPaddle / 2 < 0) {
      paddles[0].y = paddles[0].heightPaddle / 2;  
    }
    
    if (paddles[1].y + paddles[1].heightPaddle / 2 > height) {
      paddles[1].y = height - paddles[1].heightPaddle / 2; 
    } 
    else if (paddles[1].y - paddles[1].heightPaddle / 2 < 0) {
      paddles[1].y = paddles[1].heightPaddle / 2;  
    } 
  }
}
