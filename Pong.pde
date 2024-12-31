final int MENUSCREEN = 0;
final int GAMESCREEN = 1;

int screenState;
int players;
int textsSize;
float textMargin;

// Game Elements
Paddle [] paddles = new Paddle[2];
Ball ball;
SlamBall slamBall;
Control control;

PImage slamBallImage;
PImage ballImage;

// Point Properties
int redPoints;
int bluePoints;
int maxPoints;

// Ball Properties
float ballSpeed;
float ballRadius;
float powerupRadius;
float slamSpeed;

// Paddle Properties
float paddleWidth;
float paddleHeight;
float paddleMargin;
float paddleSpeed;


void initSettings() {
 /**
  * Initialize game settings.
  */
 screenState = 0;
 players = 1;
 redPoints = 0;
 bluePoints = 0;
 maxPoints = 1;
 textsSize = 35;
 textMargin = 50;
  
 // Ball Properties
 ballSpeed = 10.80;
 ballRadius = 0.02 * width;
 powerupRadius = 0.01 * width;
 slamSpeed = 40;
 
 // Paddle Properties
 paddleWidth = 0.015 * width;
 paddleHeight = 0.1 * height;
 paddleMargin = 0.02 * width;
 paddleSpeed = 15.0;
}

void reset() {
 /**
  * Resetting the states of the game.
  */
 ball.active = false;
 ball.xDirection = 1;
 ball.yDirection = 1;
 ball.x = width / 2;
 ball.y = height / 2;
 ball.xSpeed = ballSpeed;
 ball.ySpeed = ballSpeed;
 
 paddles[0].direction = 0;
 paddles[1].direction = 0;
 paddles[0].y = height / 2;
 paddles[1].y = height / 2;
 
 slamBall.direction = 0;
 slamBall.active = false;
 
 redPoints = 0;
 bluePoints = 0;
}

void updatePoints() {
  /**
   * Update the points system.
   */
  
  if (bluePoints == maxPoints) {
    fill(255, 0, 0);
    text("GAME OVER", textMargin, textMargin);
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
  }
  
  fill(0, 0, 255);
  text(
      bluePoints, 
      width/2 + textMargin, 
      textMargin
   );
  
  if (redPoints == maxPoints) {
    fill(0, 0, 255);
    text(
      "GAME OVER", 
      width - textMargin - textWidth("GAME OVER"), 
      textMargin
    );
    ball.x = width / 2;
    ball.y = height / 2;
    
  } else {

    if (ball.x - ball.radius > width) {
      ball.x = width - width / 4;
      ball.y = height / 2;
      ball.xSpeed *= -1;
      ball.ySpeed *= -1;
      redPoints += 1;
    } 
  }
  
  fill(255, 0, 0);
  text(
      redPoints, 
      width / 2 - textMargin - textWidth(char(redPoints)), 
      textMargin
   );
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
  
  if (key == 'r') {
    reset();
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

void setup() { 
  /**
   * Initial declarations of the program 
   * and setting up the game elements.
   */
  size(1500, 800);
  
  initSettings();
  textSize(textsSize);
  
  control = new Control();
  
  // PowerUp properties (radius).
  slamBall = new SlamBall(powerupRadius);
  slamBall.slamSpeed = slamSpeed;
  
  // Ball properties (x, y) position and radius.
  ball = new Ball(width / 2, height / 2, ballRadius);
  ball.xSpeed = ballSpeed;
  ball.ySpeed = ballSpeed;
  
  //Paddle properties (x, y, height, width, RGB).
  paddles[0] = new Paddle(
                    paddleMargin, 
                    height/2, 
                    paddleHeight, 
                    paddleWidth, 
                    color(255, 0, 0)
               );
  paddles[1] = new Paddle(
                    width - paddles[0].x, 
                    height/2, 
                    paddleHeight, 
                    paddleWidth, 
                    color(0, 0, 255)
               );
  paddles[0].speed = paddleSpeed;
  paddles[1].speed = paddleSpeed;
  
  // Display images.
  slamBallImage = loadImage("SlamBall.png");
  ballImage = loadImage("football.png");
  
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
  line(width / 2, 0, width / 2, height);
  
  // Display the names of each side.
  fill(255, 0, 0);
  text(
    "RED", 
    width / 2 - 2 * textMargin - textWidth("0") - textWidth("RED"), 
    textMargin
  );
  fill(0, 0, 255);
  text(
    "BLUE", 
    width / 2 + 2 * textMargin + textWidth("0"), 
    textMargin
  );
  
  slamBall.display();
  ball.display();
  
  for (int i = 0; i < paddles.length; i++) {
   paddles[i].display(); 
  }
  
  // Move game elements.
  if (ball.active) {
    ball.move();
    // Resetting the ball state after SlamBall powerup deployed.
    slamBall.endState();
  }
  
  paddles[1].y = ball.y;
  
  if (slamBall.hit() && ball.active) {
     slamBall.deploy(); 
  }
  
  control.movePaddles();
  control.boundPaddles();
  
  // Update the elements.
  updatePoints();

  if (ball.x < 0 || ball.x > width) {
    strokeWeight(10);
    stroke(255);
    line(width / 2, 0, width / 2, height);
  }
}
