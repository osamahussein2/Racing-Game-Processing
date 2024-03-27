enum PlayerStates { IDLE, MOVING_FORWARD, MOVING_BACKWARD, MOVING_LEFT, MOVING_RIGHT }

class PlayerCar
{
  // Create a global enum for the player state
  PlayerStates playerState;
  
  // Create vectors for the player position and player velocity
  PVector playerPosition;
  PVector playerVelocity;
  
  // Create int variables for player width, player height, race position and laps
  int playerWidth, playerHeight;
  int racePosition, laps;
  
  // Initialize the global current laps variable to 1
  int currentLap = 1;
  
  // Create a roadline class object to test the collision between the player car and finish line
  RoadLine finishLine;
  
  // Create the constructor for the player class passing in the player position vector, player velocity vector, the player width int and the player height height int
  PlayerCar(PVector playerPosition_, PVector playerVelocity_, int playerWidth_, int playerHeight_)
  {
    playerPosition = playerPosition_;
    playerVelocity = playerVelocity_;
    
    playerWidth = playerWidth_;
    playerHeight = playerHeight_;
    
    racePosition = 1; // Initialize the race position to 1 because only the player is initalized in the race before the CPU cars are drawn to the screen
    laps = 1; // Start at lap 1 by default
    
    // Create a new road line object needed to test the collision between the player and the finish line
    finishLine = new RoadLine();
    
    // Initialize the player state enum to IDLE because the player will not move at the start of the race until they press an arrow key on the keyboard
    playerState = PlayerStates.IDLE;
  }
  
  // Draw the player car
  void drawPlayerCar()
  {
    // This is needed to tell the player to the console how to play this game
    println("Move the car left by pressing the left arrow button");
    println("Move the car right by pressing the right arrow button");
    println("Move the car up by pressing the up arrow button");
    println("Move the car down by pressing the down arrow button");
    
    // Find the direction and distance between two points using 2 local variables below and put it inside the text function for the player to see during race (inventory skill 40)
    
    float directionbetweenPlayerPositionYandFinishLineY = playerPosition.y - finishLine.finishLine.y; // I want to only find the the direction of two points along the y-axis
    
    textSize(15);
    text("Direction between player position Y and \nfinish line Y: " + directionbetweenPlayerPositionYandFinishLineY, 90, 100);
    
    float distanceBetweenPlayerAndFinishLine = playerPosition.dist(finishLine.finishLine);
    
    textSize(15);
    text("Distance between player and finish line: " + distanceBetweenPlayerAndFinishLine, 90, 20);
    
    // Use the heading method and put it inside the text function to show to the player during the race (https://processing.org/reference/PVector_heading_.html, inventory skill 43)
    textSize(15);
    text("The angle of rotation for the\nplayer position vector: " + playerPosition.heading(), 90, 50);
    
    // Constrain the player not to go off screen along the x and y axes (inventory skill 6)
    playerPosition.x = constrain(int(playerPosition.x), 0, 380);
    playerPosition.y = constrain(int(playerPosition.y), -40, 370);
    
    // Make the rectangle green for the player car
    noStroke();
    fill(0, 200, 0);
    
    // Draw the rectangle for the player car
    rect(playerPosition.x, playerPosition.y, playerWidth, playerHeight);
  }
  
  // Create a function that returns a player state and that switches to one of the 2 game states during the race (inventory skill 21)
  PlayerStates switchPlayerState()
  {
    // Switch the player state enum in the race (inventory skill 45)
    switch(playerState)
    {
      // If the player is IDLE, show the idle text during the race
      case IDLE:
      
      fill(255);
      textSize(15);
      text("Current Player State: " + PlayerStates.IDLE, 90, 150);
      break;
      
      // If the player is MOVING_FORWARD, show the moving forward text during the race
      case MOVING_FORWARD:
      
      fill(255);
      textSize(15);
      text("Current Player State: " + PlayerStates.MOVING_FORWARD, 90, 150);
      break;
      
      // If the player is MOVING_BACKWARD, show the moving backward text during the race
      case MOVING_BACKWARD:
      
      fill(255);
      textSize(15);
      text("Current Player State: " + PlayerStates.MOVING_BACKWARD, 90, 150);
      break;
      
      // If the player is MOVING_LEFT, show the moving left text during the race
      case MOVING_LEFT:
      
      fill(255);
      textSize(15);
      text("Current Player State: " + PlayerStates.MOVING_LEFT, 90, 150);
      break;
      
      // If the player is MOVING_FORWARD, show the moving forward text during the race
      case MOVING_RIGHT:
      
      fill(255);
      textSize(15);
      text("Current Player State: " + PlayerStates.MOVING_RIGHT, 90, 150);
      break;
    }
    
    return playerState; // Return the player state enum
  }
  
  // Update the race position for the player while making the race position functional in the game (inventory skill 24)
  void updateRacePositionForPlayer(CPUcar[] cpuCar_)
  {
    /* Create a local variable called total position to show it to the player in text (in-game) and use it to make it equal to the race position so that
    the race position doesn't exceed the max amount of total position */
    
    int totalPosition = cpuCar_.length + 1; // + 1 means that the player car is also included in the race along with the amount of CPU cars
    
    // Loop the race position for the player once they are ahead of the CPU cars or behind the CPU cars in the race
    for(int i = 0; i < cpuCar_.length; i++)
    {
      // Create 2 local variables called the real y position of the player and the real y position of the CPU cars (subtract the position y by the their height)
      int playerRealPositionY = int(playerPosition.y - playerHeight);
      int CPUcarRealPositionY = int(cpuCar_[i].CPUposition.y - cpuCar_[i].CPUheight);
      
      // If the player position is behind the CPU cars and behind the CPU cars by at least a lap, increase the race position by 1 each time they're behind a CPU car (inventory skills 12, 13 & 14)
      if(playerRealPositionY > CPUcarRealPositionY && cpuCar_[i].currentLapForCPU >= currentLap)
      {
        // Increment the race position by 1 every time the player is behind of the CPU cars
        racePosition += 1;
        
        // If the race position is equal to or greater than the total position, make it equal to the total position so that it doesn't increment continuously
        if(racePosition >= totalPosition)
        {
          racePosition = totalPosition;
        }
      }
      
      // If the player position is ahead of the CPU cars and ahead of the CPU cars by at least a lap, decrease the race position by 1 each time they're ahead of a CPU car
      else if(playerRealPositionY < CPUcarRealPositionY && currentLap >= cpuCar_[i].currentLapForCPU)
      {
        // Decrement the race position by 1 every time the player is ahead of the CPU cars
        racePosition -= 1;
        
        // If the race position is equal to or less than 1, make it equal to 1 so that it doesn't decrement continuously
        if(racePosition <= 1)
        {
          racePosition = 1;
        }
      }
      
      // If the player's real position Y is equal to the real CPU cars' position Y, don't change the race position of the player (and if they're on the same lap as the CPU cars)
      else if(playerRealPositionY == CPUcarRealPositionY && currentLap == cpuCar_[i].currentLapForCPU)
      {
        // Don't increment or decrement the race position if the player's real position is the same as the CPU cars' real positions
        racePosition = racePosition + 0;
      }
    }
    
    // Make the text white, size 15, showing the race position for the player
    fill(255);
    textSize(15);
    text("Position: " + racePosition + "/" + totalPosition, 0, 35);
  }
  
  // Update the laps for the player every time they hit the finish line
  void updateLapsForPlayer()
  {
      // If the player collides with the finish line, then increase the current lap by 1 each time and reset the player's position back to the starting point of the race
      if(playerCarCollidedWithFinishLine(finishLine))
      {
        // Increment the current laps local variable by 1
        currentLap += 1;
        
        // Reset the player's position
        playerPosition.x = 160;
        playerPosition.y = 360;
        
        playerCar.playerVelocity = new PVector(random(3, 4), random(3, 4));
        
        // If the current lap local variable is greater than the total laps variable, then make the current lap equal to the total laps
        if(currentLap > laps)
        {
          currentLap = laps;
          
          /* If the current lap is equal to total laps, then show a different menu screen depending on what place the player finished at
          (and reset the current lap to 1 when the player restarts the race) */
          if (currentLap == laps)
          {
          
          // If player won the race by finishing in 1st place, show the winning screen and reset the current lap to 1
          if(racePosition == 1)
          {
            menu.MENU = Menus.WINNING_SCREEN;
            currentLap = 1;
          }
          
          // If player won the race by finishing in 2nd place, show the losing screen finishing in 2nd place and reset the current lap to 1
          if(racePosition == 2)
          {
            menu.MENU = Menus.LOSING_SCREEN_FOR_2ND_PLACE;
            currentLap = 1;
          }
          
          // If player won the race by finishing in 3rd place, show the losing screen finishing in 3rd place and reset the current lap to 1
          if(racePosition == 3)
          {
            menu.MENU = Menus.LOSING_SCREEN_FOR_3RD_PLACE;
            currentLap = 1;
          }
          
          // If player won the race by finishing in 4th place, show the losing screen finishing in 4th place and reset the current lap to 1
          if(racePosition == 4)
          {
            menu.MENU = Menus.LOSING_SCREEN_FOR_4TH_PLACE;
            currentLap = 1;
          }
          
          // If player won the race by finishing in 5th place, show the losing screen finishing in 5th place and reset the current lap to 1
          if(racePosition == 5)
          {
            menu.MENU = Menus.LOSING_SCREEN_FOR_5TH_PLACE;
            currentLap = 1;
          }
          
          // If player won the race by finishing in 6th place, show the losing screen finishing in 6th place and reset the current lap to 1
          if(racePosition == 6)
          {
            menu.MENU = Menus.LOSING_SCREEN_FOR_6TH_PLACE;
            currentLap = 1;
          }
        }
        }
      }
    
    // Make the text white, size 15, showing the laps completed by the player
    fill(255);
    textSize(15);
    text("Laps: " + currentLap + "/" + laps, 0, 55);
  }
  
  /* Collision function between the player car and the finish line:
  https://happycoding.io/tutorials/processing/collision-detection (go to Rectangle Rectangle Collision Detection, and go to lines 18-19. That's where I used this collision code below.
  This gave me a starting point to the rectangle collisions working, inventory skill 49) */
  boolean playerCarCollidedWithFinishLine(RoadLine finishLine_)
  {
    // I only need the collision detection between the player car and the finish line along the y axis, since the player is looking to win the race
  
    if (playerPosition.x >= 0 && playerCar.playerPosition.x <= 400 &&
    playerPosition.y <= 400 &&
    playerPosition.y < finishLine_.finishLine.y)
    {
      return true; // The collision occurred
    }
  
    return false; // Otherwise, no collision occurred
  }
}
