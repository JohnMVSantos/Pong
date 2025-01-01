final int MENUSCREEN = 0;
final int GAMESCREEN = 1;
final int PLAYERSCREEN = 2;
final int DIFFICULTYSCREEN = 3;
final int HELPSCREEN = 4;

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
boolean endGame = false;

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

// Menu Elements
float buttonMargin;
float buttonStartPlacement;
float buttonSize;
float buttonHeight;
float buttonWidth;

float startButtonX, startButtonY; // Position of the start button.
boolean startButtonOver = false; // Condition to check if the mouse hovers over the start button.

float helpButtonX, helpButtonY; // Position of the help button.
boolean helpButtonOver = false; // Condition to check if the mouse hovers over the help button.

float onePlayerButtonX, onePlayerButtonY; // Position of the one player button.
boolean onePlayerButtonOver = false; // Condition to check if the mouse hovers over the one player button.

float twoPlayerButtonX, twoPlayerButtonY; // Position of the two player button.
boolean twoPlayerButtonOver = false; // Condition to check if the mouse hovers over the two player button.

float pointIncrementButtonX, pointIncrementButtonY; // Position of the points increment button.
boolean pointIncrementButtonOver = false; // Condition to check if the mouse hovers over the point increment button.

float pointDecrementButtonX, pointDecrementButtonY; // Position of the points decrement button.
boolean pointDecrementButtonOver = false; // Condition to check if the mouse hovers over the point decrement button.

float easyButtonX, easyButtonY; // Position of the easy button.
boolean easyButtonOver = false; // Condition to check if the mouse hovers over the easy button.

float normalButtonX, normalButtonY; // Position of the normal button.
boolean normalButtonOver = false; // Condition to check if the mouse hovers over the normal button.

float hardButtonX, hardButtonY; // Position of the hard button.
boolean hardButtonOver = false; // Condition to check if the mouse hovers over the hard button.

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
 paddleSpeed = 15;
 
 // Menu Properties
 buttonMargin = 50;
 buttonStartPlacement = 2 * textMargin;
 buttonSize = 0.05 * width;
 buttonWidth = 2 * buttonSize;
 buttonHeight = buttonSize / 2;
 
 // Main Menu
 startButtonX = width / 2 - buttonSize;
 startButtonY = height / 4 - buttonSize / 2 + buttonMargin + buttonStartPlacement;
 
 helpButtonX = width / 2 - buttonSize;
 helpButtonY = height / 4 - buttonSize / 2 + 2 * buttonMargin + buttonStartPlacement;
 
 // Player Selection
 onePlayerButtonX = startButtonX;
 onePlayerButtonY = startButtonY;
 
 twoPlayerButtonX = helpButtonX;
 twoPlayerButtonY = helpButtonY;
 
 pointIncrementButtonX = width / 2 + buttonWidth / 2 - 0.25 * buttonWidth;
 pointIncrementButtonY = twoPlayerButtonY + buttonMargin;
 
 pointDecrementButtonX = pointIncrementButtonX;
 pointDecrementButtonY = pointIncrementButtonY + 0.50 * buttonMargin;
 
 // Difficulty Selection
 easyButtonX = startButtonX;
 easyButtonY = startButtonY;
 
 normalButtonX = helpButtonX;
 normalButtonY = helpButtonY;
 
 hardButtonX = width / 2 - buttonSize;
 hardButtonY = height / 4 - buttonSize / 2 + 3 * buttonMargin + buttonStartPlacement;
}

void resizeEvent() {
  /**
   * Allow dynamic resizing of the elements 
   * if the window size changes.
   */
  
  textsSize = int(0.02 * width);
  textMargin = 0.03 * width;
  
  // Ball Properties
  ballRadius = 0.02 * width;
  powerupRadius = 0.01 * width;
  
  // Paddle Properties
  paddleWidth = 0.015 * width;
  paddleHeight = 0.1 * height;
  paddleMargin = 0.02 * width;
  
  paddles[0].x = paddleMargin;
  paddles[1].x = width - paddles[0].x;
  
  // Menu Properties
  buttonMargin = 0.03 * width;
  buttonStartPlacement = 2 * textMargin;
  buttonSize = 0.05 * width;
  buttonWidth = 2 * buttonSize;
  buttonHeight = buttonSize / 2;
   
  // Main Menu
  startButtonX = width / 2 - buttonSize;
  startButtonY = height / 4 - buttonSize / 2 + buttonMargin + buttonStartPlacement;
   
  helpButtonX = width / 2 - buttonSize;
  helpButtonY = height / 4 - buttonSize / 2 + 2 * buttonMargin + buttonStartPlacement;
   
  // Player Selection
  onePlayerButtonX = startButtonX;
  onePlayerButtonY = startButtonY;
   
  twoPlayerButtonX = helpButtonX;
  twoPlayerButtonY = helpButtonY;
   
  pointIncrementButtonX = width / 2 + buttonWidth / 2 - 0.25 * buttonWidth;
  pointIncrementButtonY = twoPlayerButtonY + buttonMargin;
   
  pointDecrementButtonX = pointIncrementButtonX;
  pointDecrementButtonY = pointIncrementButtonY + 0.50 * buttonMargin;
   
  // Difficulty Selection
  easyButtonX = startButtonX;
  easyButtonY = startButtonY;
   
  normalButtonX = helpButtonX;
  normalButtonY = helpButtonY;
   
  hardButtonX = width / 2 - buttonSize;
  hardButtonY = height / 4 - buttonSize / 2 + 3 * buttonMargin + buttonStartPlacement;
}

void reset() {
 /**
  * Resetting the states of the game.
  */
 ball.active = false;
 ball.xDirection = 1;
 ball.yDirection = 1;
 ball.x = width / 2;
 ball.y =  3 * height / 4;
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
    ball.active = false;
    endGame = true;
    
    fill(255, 0, 0);
    text("GAME OVER", textMargin, textMargin);
    
    fill(255, 255, 0);
    textSize(0.50 * textsSize);
    text(
      "Press r to restart", 
      width / 2 - textWidth("Press r to restart") / 2, 
      height / 4
    );
    text(
      "Press q to return to main menu", 
      width / 2 - textWidth("Press q to return to main menu") / 2, 
      height / 4 + 2 * textMargin
    );
    textSize(textsSize);
    
    ball.x = width / 2;
    ball.y = 3 * height / 4;
    ball.active = false;
  } else {
    
    if (ball.x + ball.radius < 0) {
      ball.x = width / 4;
      ball.y = random(height);
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
    ball.active = false;
    endGame = true;
    
    fill(0, 0, 255);
    text(
      "GAME OVER", 
      width - textMargin - textWidth("GAME OVER"), 
      textMargin
    );
    
    fill(255, 255, 0);
    textSize(0.50 * textsSize);
    text(
      "Press r to restart", 
      width / 2 - textWidth("Press r to restart") / 2, 
      height / 4
    );
    text(
      "Press q to return to main menu", 
      width / 2 - textWidth("Press q to return to main menu") / 2, 
      height / 4 + 2 * textMargin
    );
    textSize(textsSize);
    
    ball.x = width / 2;
    ball.y = 3 * height / 4;
    
  } else {

    if (ball.x - ball.radius > width) {
      ball.x = width - width / 4;
      ball.y = random(height);
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

void updateButtonHover() {
  /**
   * Update button hover conditions.
   */
  
  if (overButton(startButtonX, startButtonY, buttonWidth, buttonHeight)) {
    startButtonOver = true;
  } else if (overButton(helpButtonX, helpButtonY, buttonWidth, buttonHeight)) {
    helpButtonOver = true;
  } else {
    startButtonOver = false; 
    helpButtonOver = false;
    
    onePlayerButtonOver = false;
    twoPlayerButtonOver = false;
    pointIncrementButtonOver = false;
    pointDecrementButtonOver = false;
    
    easyButtonOver = false;
    normalButtonOver = false;
    hardButtonOver = false;
  }
}

void updatePlayerButtonHover() {
  /**
   * Updates hover over the player selection buttons.
   */
  if (overButton(onePlayerButtonX, onePlayerButtonY, buttonWidth, buttonHeight)) {
    onePlayerButtonOver = true;
  } else if (overButton(twoPlayerButtonX, twoPlayerButtonY, buttonWidth, buttonHeight)) {
    twoPlayerButtonOver = true; 
  } else if (overButton(pointIncrementButtonX, pointIncrementButtonY, 0.25 * buttonWidth, 0.50 * buttonHeight)) {
    pointIncrementButtonOver = true;
  } else if (overButton(pointDecrementButtonX, pointDecrementButtonY, 0.25 * buttonWidth, 0.50 * buttonHeight)) {
    pointDecrementButtonOver = true;
  } else {
    startButtonOver = false; 
    helpButtonOver = false;
    
    onePlayerButtonOver = false;
    twoPlayerButtonOver = false;
    pointIncrementButtonOver = false;
    pointDecrementButtonOver = false;
    
    easyButtonOver = false;
    normalButtonOver = false;
    hardButtonOver = false;
  }
}

void updateDifficultyButtonHover() {
  /**
   * Updates hover over the difficulty selection buttons.
   */
   
  if (overButton(easyButtonX, easyButtonY, buttonWidth, buttonHeight)) {
    easyButtonOver = true;
  } else if (overButton(normalButtonX, normalButtonY, buttonWidth, buttonHeight)) {
    normalButtonOver = true;
  } else if (overButton(hardButtonX, hardButtonY, buttonWidth, buttonHeight)) {
    hardButtonOver = true;
  } else {
    startButtonOver = false; 
    helpButtonOver = false;
    
    onePlayerButtonOver = false;
    twoPlayerButtonOver = false;
    pointIncrementButtonOver = false;
    pointDecrementButtonOver = false;
    
    easyButtonOver = false;
    normalButtonOver = false;
    hardButtonOver = false;
  }
}

boolean overButton(float x, float y, float widthButton, float heightButton) {
  /**
   * Check if the mouse hovers the button.
   *
   * @param {float} x - The x position of the button as a recta* @param {float} y - The y position of the button as a rectangle.ngle.
   * @param {float} y - The y position of the button as a rectangle.
   * @param {float} widthButton - The width of the button as a rectangle.
   * @param {float} heightButton - The height of the button as a rectangle.
   * @returns {boolean} True if the mouse hovers over the button. False otherwise.
   */
  if (mouseX >= x && mouseX <= x + widthButton && 
      mouseY >= y && mouseY <= y + heightButton) {
    return true;
  } else {
    return false;
  }
}

void keyPressed() {
  /**
   * Detect key presses to move the paddles.
   */
  if (key == 'w') {
    paddles[0].direction = -1;
  }
  
  if (key == 's') {
    paddles[0].direction = 1;
  } 
  
  if (screenState == 1 && key == 'g') {
    ball.active = true;
    endGame = false;
  }
  
  if (screenState == 1 && key == 'r') {
    reset();
    ball.active = true;
    endGame = false;
  }
  
  if (screenState == 1 && ball.active == false && key == 'q') {
    reset();
    screenState = 0;
    endGame = false;
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

void mousePressed() {
  /**
   * Detect mouse presses to determine button clicks.
   */
  if (startButtonOver) {
    screenState = 2; // Transition to player selection.
  } else if (twoPlayerButtonOver) {
    players = 2;
    screenState = 3; // Transition to the difficulty screen. 
  } else if (onePlayerButtonOver) {
    players = 1;
    screenState = 3; // Transition to the difficulty selection.
  } else if (easyButtonOver) {
    // Set easy settings
    ballSpeed = 7;
    ball.xSpeed = ballSpeed;
    ball.ySpeed = ballSpeed;
    
    paddleSpeed = 20;
    paddles[0].speed = paddleSpeed;
    paddles[1].speed = paddleSpeed;
    
    screenState = 1; // Transition to the game screen.
  } else if (normalButtonOver) {
    // Set normal settings.
    ballSpeed = 10.80;
    ball.xSpeed = ballSpeed;
    ball.ySpeed = ballSpeed;
    
    paddleSpeed = 16;
    paddles[0].speed = paddleSpeed;
    paddles[1].speed = paddleSpeed;
    
    screenState = 1; // Transition to the game screen.
  } else if (hardButtonOver) {
    // Set hard settings
    ballSpeed = 15;
    ball.xSpeed = ballSpeed;
    ball.ySpeed = ballSpeed;
    
    paddleSpeed = 15;
    paddles[0].speed = paddleSpeed;
    paddles[1].speed = paddleSpeed;
    
    screenState = 1; // Transition to the game screen.
  } else if (helpButtonOver) {
   screenState = 4; // Transition to the help screen. 
  } else if (pointIncrementButtonOver) {
    maxPoints += 1; 
  } else if (pointDecrementButtonOver) {
    maxPoints -= 1; 
  }
}

void setup() { 
  /**
   * Initial declarations of the program 
   * and setting up the game elements.
   */
  size(1500, 800);
  initSettings();
  surface.setResizable(true);
  
  textSize(textsSize);
  
  control = new Control();
  
  // PowerUp properties (radius).
  slamBall = new SlamBall(powerupRadius);
  slamBall.slamSpeed = slamSpeed;
  
  // Ball properties (x, y) position and radius.
  ball = new Ball(width / 2, 3 * height / 4, ballRadius);
  ball.xSpeed = ballSpeed;
  ball.ySpeed = ballSpeed;
  
  //Paddle properties (x, y, height, width, RGB).
  paddles[0] = new Paddle(
                    paddleMargin, 
                    height / 2, 
                    paddleHeight, 
                    paddleWidth, 
                    color(255, 0, 0)
               );
  paddles[1] = new Paddle(
                    width - paddles[0].x, 
                    height / 2, 
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

void drawGame() {
  /**
   * Draw the game elements.
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
  paddles[0].display();
  paddles[1].display(); 
  
  // Move game elements.
  if (ball.active) {
    ball.move();
    // Resetting the ball state after SlamBall powerup deployed.
    slamBall.endState();
  } else {
    fill(255, 255, 0);
    textSize(0.50 * textsSize);
    
    if (!endGame) {
       text(
        "Press g to start", 
        width / 2 - textWidth("Press g to start") / 2, 
        height / 4 + textMargin
       );
    }
     text(
      "Press q to return to main menu", 
      width / 2 - textWidth("Press q to return to main menu") / 2, 
      height / 4 + 2 * textMargin
    );
    textSize(textsSize);
  }
  
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

void drawMenu() {
  /**
   * Draw the menu screen.
   */
  rectMode(CORNER); // Keep drawing of the rectangles consistent.
  
  updateButtonHover();
  background(0);
  
  fill(255, 255, 0);
  text(
      "PONG", 
      width / 2 - textWidth("PONG") / 2, 
      height / 4
   );
   textSize(0.50 * textsSize);
   
   text(
      "-- written in Processing --", 
      width / 2 - textWidth("-- written in Processing --") / 2, 
      height / 4 + textMargin
   );
   
   // Draw start button
   stroke(255);
   if (startButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(startButtonX, startButtonY, buttonWidth, buttonHeight);
   
   fill(0, 255, 0);
   text(
      "Start Game", 
      startButtonX + buttonWidth / 2 - textWidth("Start Game") / 2, 
      startButtonY + buttonMargin / 2
   );
   
   // Draw the help button
   if (helpButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(helpButtonX, helpButtonY, buttonWidth, buttonHeight);
   fill(173, 216, 230);
   text(
      "Help", 
      helpButtonX + buttonWidth / 2 - textWidth("Help") / 2, 
      helpButtonY + buttonMargin / 2
   );
   
   textSize(textsSize);
}

void drawPlayerSelection() {
  /**
   * Draw the menu for player selection.
   */
   rectMode(CORNER); // Keep drawing of the rectangles consistent.
   
   updatePlayerButtonHover();
   background(0);
   textSize(0.50 * textsSize);
   
   // Draw one player button
   stroke(255);
   if (onePlayerButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(onePlayerButtonX, onePlayerButtonY, buttonWidth, buttonHeight);
   
   fill(255, 255, 0);
   text(
      "One Player", 
      onePlayerButtonX + buttonWidth / 2 - textWidth("One Player") / 2, 
      onePlayerButtonY + buttonMargin / 2
   );
   
   // Draw two player button
   if (twoPlayerButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(twoPlayerButtonX, twoPlayerButtonY, buttonWidth, buttonHeight);
   fill(255, 255, 0);
   text(
      "Two Players", 
      twoPlayerButtonX + buttonWidth / 2 - textWidth("Two Players") / 2, 
      twoPlayerButtonY + buttonMargin / 2
   );
   
   // Draw points increment and decrement button
   fill(255);
   text(
      "Max Points: " + maxPoints, 
      twoPlayerButtonX, 
      pointDecrementButtonY
   );
   
   if (pointIncrementButtonOver) {
     fill(255);
   } else {
     fill(0);
   }
   rect(pointIncrementButtonX, pointIncrementButtonY, 0.25 * buttonWidth, 0.50 * buttonHeight);
   
   if (pointDecrementButtonOver) {
     fill(255);
   } else {
     fill(0);
   }
   rect(pointDecrementButtonX, pointDecrementButtonY, 0.25 * buttonWidth, 0.50 * buttonHeight);
   
   stroke(0, 255, 0);
   line(
     pointIncrementButtonX, 
     pointIncrementButtonY + 0.25 * buttonHeight, 
     pointIncrementButtonX + 0.25 * buttonWidth, 
     pointIncrementButtonY + 0.25 * buttonHeight
   );
   line(
     pointIncrementButtonX + 0.50 * 0.25 * buttonWidth, 
     pointIncrementButtonY, 
     pointIncrementButtonX + 0.50 * 0.25 * buttonWidth, 
     pointIncrementButtonY + 0.50 * buttonHeight
   );
   
   stroke(255, 0, 0);
   line(
     pointDecrementButtonX, 
     pointDecrementButtonY + 0.25 * buttonHeight, 
     pointDecrementButtonX + 0.25 * buttonWidth, 
     pointDecrementButtonY + 0.25 * buttonHeight
   );
   
   textSize(textsSize);
}

void drawDifficultySelection() {
  /**
   * Draw the difficulty selection menu.
   */
   
   rectMode(CORNER); // Keep drawing of the rectangles consistent.
   
   updateDifficultyButtonHover();
   background(0);
   textSize(0.50 * textsSize);
   
   // Draw easy button
   stroke(255);
   if (easyButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(easyButtonX, easyButtonY, buttonWidth, buttonHeight);
   
   fill(255, 255, 0);
   text(
      "Easy", 
      easyButtonX + buttonWidth / 2 - textWidth("Easy") / 2, 
      easyButtonY + buttonMargin / 2
   );
   
   // Draw normal button
   if (normalButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(normalButtonX, normalButtonY, buttonWidth, buttonHeight);
   fill(255, 255, 0);
   text(
      "Normal", 
      normalButtonX + buttonWidth / 2 - textWidth("Normal") / 2, 
      normalButtonY + buttonMargin / 2
   );
   
   // Draw hard button
   if (hardButtonOver) {
     fill(255); 
   } else {
     fill(0);  
   }
   rect(hardButtonX, hardButtonY, buttonWidth, buttonHeight);
   fill(255, 255, 0);
   text(
      "Hard", 
      hardButtonX + buttonWidth / 2 - textWidth("Hard") / 2, 
      hardButtonY + buttonMargin / 2
   );
   
   textSize(textsSize);
}

void drawHelpScreen() {
  /**
   * Drawing the help screen to provide user instructions.
   */
   
  
   
  
}

void draw() {
  /**
   * Drawing loop to update the display contents.
   */
  resizeEvent();
  
  if (screenState == 0) {
    drawMenu(); 
  } else if (screenState == 1) {
    drawGame(); 
  } else if (screenState == 2) {
    drawPlayerSelection();
  } else if (screenState == 3) {
    drawDifficultySelection(); 
  }
}
