int players = 2;

SlamBall slamBall;
Ball ball;
Paddle [] paddles = new Paddle[players];
Control control;

int redPoints = 0;
int bluePoints = 0;
int maxPoints = 10;

PImage slamBallImage;
PImage ballImage;

void setup() { 
  /**
   * Initial declarations of the program 
   * and setting up the game elements.
   */
  size(1500, 800);
  
  control = new Control();
  
  // PowerUp properties (radius).
  slamBall = new SlamBall(20);
  // Ball properties (x, y) position and radius.
  ball = new Ball(width/2, height/2, 30.0);
  //Paddle properties (x, y, height, width, RGB).
  paddles[0] = new Paddle(30, height/2, 80, 25, color(255, 0, 0));
  paddles[1] = new Paddle(width - paddles[0].x, height/2, 80, 25, color(0, 0, 255));
  
  // Display images.
  slamBallImage = loadImage("SlamBall.png");
  ballImage = loadImage("football.png");
}

void keyPressed() {
  /**
   * Detect keypresses to move the paddles.
   */
  if (key == 'w') {
    paddles[0].direction = -1;
  }
  
  if (key == 's') {
    paddles[0].direction = 1;
  } 
  
  if (key == 'g') {
    ball.active = true;
  }
  
  if (key == CODED) {
    if (keyCode == UP) {
      paddles[1].direction = -1;
    }
    if (keyCode == DOWN) {
      paddles[1].direction = 1;
    }
  }
}    

void updatePoints() {
  /**
   * Update the points system.
   */
  
  fill(0, 0, 255);
  if (bluePoints == maxPoints) {
    text("GAME OVER", 60, 60);
    ball.x = width / 2;
    ball.y = height / 2;
    ball.active = false;
  } else {
    
    if (ball.x + ball.radius < 0) {
      ball.x = width / 4;
      ball.y = height / 2;
      ball.xSpeed *= -1;
      ball.ySpeed *= -1;
      bluePoints += 1;
    }
    text(bluePoints, width/2+20, 40);
  
  }
  
  fill(255, 0, 0);
  if (redPoints == maxPoints) {
    text("GAME OVER", width-240, 60);
    ball.x = width/2;
    ball.y = height/2;
  } else {
    
    if (ball.x - ball.radius > width) {
      ball.x = width - width / 4;
      ball.y = height / 2;
      ball.xSpeed *= -1;
      ball.ySpeed *=-1;
      redPoints += 1;
    } 
    text(redPoints, width / 2 - 50, 40);
  }
}

void draw() {
  /**
   * Drawing loop to update the display contents.
   */
  
  // Display game elements.
  background(0);
  // Draw the line split in the middle. 
  strokeWeight(2);
  stroke(255);
  line(width/2, 0, width/2, height);
  
  // Display the names of each side.
  textSize(35);
  fill(255, 0, 0);
  text("RED", width/2-150, 40);
  fill(0, 0, 255);
  text("BLUE", width/2+80, 40);
  
  slamBall.display();
  ball.display();
  
  for (int i = 0; i < paddles.length; i++) {
   paddles[i].display(); 
  }
  
  // Move game elements.
  if (ball.active) {
    ball.move();
  }
  
  paddles[1].y = ball.y;
  
  if (slamBall.hit() && ball.active) {
     slamBall.deploy(); 
  }
  
  control.movePaddles();
  
  // Update the elements.
  updatePoints();

  if (ball.x<0 || ball.x>width) {
    strokeWeight(10);
    stroke(255);
    line(width/2, 0, width/2, height);
  }
}
