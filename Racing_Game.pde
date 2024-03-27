// Inventory skills with questions answered listed below:

/* A for loop is a loop where you can run a block of code as many times as you want, whereas a while loop is a loop
that is only executes a block of code while the condition is true (inventory skill 19) */

/* Parameters are variables (e.g. int playerCarPositionX) that you pass in inside the parentheses when the function is defined, 
whereas arguments are the return values of something (e.g. drawPlayerCar(4)) that you're trying to send to the function when it is called (inventory skill 22) */

/* A class is where you declare the functions and variables inside it whereas an object is where you use the functions and variables from
that class (inventory skill 25) */

/* A constructor function is a function that initializes the class, and use it in when you need to use that constructor inside of another class (inventory skill 26) */

/* Each class should have its own tab in Processing so that it is easier for programmers to know where their classes are declared instead of
declaring that class inside the main program where programmers are less likely to notice a declared class inside of one file whereas declaring a
class inside the own tab in Processing makes life easier for programmers to notice where the classes are defined (inventory skill 27) */

/* An array is used to instantiate an object or value by a size of a fixed number (e.g. CPUcar[] cpuCar = new CPUcar[5]),
whereas an arrayList is used to instantiate an object without specifying the size of the array directly (where you can store it in a list)
(e.g. ArrayList<RoadLine> lines = new ArrayList<RoadLine>()) (inventory skill 31) */

/* You want to go through a list backwards by decrementing the index so that the list size decreases each time during the loop occurs
before completely removing it. This is useful if you want to remove the array list more efficiently but it's not required (inventory skill 32) */
 
/* Use PVector if any variable you have created is similar to another variable, you would use a PVector
to combine the variables together into one vector object instead of creating multiple float variables
(e.g. PVector playerPosition, rather than creating float playerPositionX and float playerPositionY) (inventory skill 37) */

/* A normalized vector is any vector that moves in any direction but is equal to the length between 0 and 1.
It is useful because when you need a vector to keep moving in the same direction and not change direction, you use normalized vector (inventory skill 42) */

// Create a player car class object to draw the player as well as other functions of this object
PlayerCar playerCar = new PlayerCar(new PVector(160, 360), new PVector(random(3, 4), random(3, 4)), 20, 40);

// Create a race timer object to draw the timer to the screen (inventory skill 29)
RaceTimer raceTimer = new RaceTimer();

// Create an array of 5 CPU cars to draw the CPU as well as other functions of this object (inventory skill 33)
CPUcar[] cpuCar = new CPUcar[5];

// Create a menu class object to draw it inside the draw() function in this program
Menu menu = new Menu();

// Create an array list of road lines to draw them on the screen (inventory skill 34)
ArrayList<RoadLine> lines = new ArrayList<RoadLine>();

// Create a fireworks class object to animate the fireworks inside the winning screen enum
Fireworks fireworks;

// Setup the game (inventory skill 4)
void setup()
{
  size(400, 400); // Make the window size 400 by 400
  
  // Setup the for loop for initializing the CPU cars' array
  for(int i = 0; i < cpuCar.length; i++)
  {
    // Populate the CPUcars array
    cpuCar[i] = new CPUcar(new PVector(20 + (i * 90), 360), new PVector(0, random(-2.5, -1.5)), 20, 40);
  }
  
  // Initialize the fireworks class object
  fireworks = new Fireworks();
}

// Draw everything to the screen (including the class objects)
void draw()
{
  /* If the menu enum is equal to main menu enum, draw the main menu screen
  (I used this link https://www.youtube.com/watch?v=p3rt3zDr2SE to make my own main menu, go to this timestamp 16:55-17:28) */
  if(menu.MENU == Menus.MAIN_MENU)
  {
    // Draw the main menu with play, options and credits buttons
    menu.drawMainMenu();
    menu.drawPlayButton();
    menu.drawOptionsButton();
    menu.drawCreditsButton();
  }
  
  // If the menu enum is equal to options menu enum, draw the options menu screen
  else if (menu.MENU == Menus.OPTIONS_MENU)
  {
    // Draw the options menu with back, left arrow and right arrow buttons
    menu.drawOptionsMenu();
    menu.drawBackButton();
    menu.drawLeftArrowButton();
    menu.drawRightArrowButton();
  }
  
  // Else if menu enum is equal to credits menu enum, show the credits screen
  else if (menu.MENU == Menus.CREDITS_MENU)
  {
    // Draw the credits menu with a back button
    menu.drawCreditsMenu();
    menu.drawBackButton();
  }
  
  // Else if menu enum is equal to racing game enum, show the playing game screen
  else if (menu.MENU == Menus.RACING_GAME)
  {
    // Use this local variable to use it inside the bacgkround function below (inventory skill 9)
    int slightlyGrey = 180;
    
    // Make the background slightly grey (inventory skill 5)
    background(slightlyGrey);
    
    // Draw the race timer and the player car
    raceTimer.drawRaceTimer();
    playerCar.drawPlayerCar();
    playerCar.switchPlayerState();
    
    // Loop the CPU car length to draw the cpu cars, update them and determine their race position and laps
    for(int i = 0; i < cpuCar.length; i++) 
    {
      // Draw CPU cars
      cpuCar[i].drawCPUcar(color(255, 0, 0));
      
      // Update CPU cars
      cpuCar[i].updateCPUcar();
      
      // Determine laps for the CPU cars
      cpuCar[i].determineCPUlaps(playerCar);
    }
    
    // Update the race position for the player
    playerCar.updateRacePositionForPlayer(cpuCar);
    
    // Update the laps for the player
    playerCar.updateLapsForPlayer();
    
    // Add the lines for the roadLine object
    lines.add(new RoadLine());
    
    // Create a local variable to store the size of the lines arrayList
    int linesArray = lines.size();
    
    // Loop the size of the lines array backwards (inventory skills 16 & 17)
    for (int i = linesArray - 1; i >= 0; i--)
    {
      // Get the lines array list using the local roadLine object (inventory skill 36)
      RoadLine roadLine = lines.get(i);
      
      // Loop the size of the created road lines
      for(int j = 0; j < 6; j++)
      {
        // Draw the road lines on the screen (inventory skill 35)
        roadLine.drawRoadLine(200 - (1 * j), 400, 200 - (1 * j), 350);
        roadLine.drawRoadLine(200 - (1 * j), 300, 200 - (1 * j), 250);
        roadLine.drawRoadLine(200 - (1 * j), 200, 200 - (1 * j), 150);
        roadLine.drawRoadLine(200 - (1 * j), 100, 200 - (1 * j), 50);
        roadLine.drawRoadLine(200 - (1 * j), 0, 200 - (1 * j), -50);
      }
      
      // Draw the finish line 
      roadLine.drawFinishLine();
      }
    }
  
  // If the menu enum is equal to winning screen enum, show the winning screen
  else if (menu.MENU == Menus.WINNING_SCREEN)
  {
    // Show the winning screen
    menu.drawWinningGameOverScreen();
    
    // Animate the fireworks in the winning screen
    fireworks.animateFireworks();
    
    // Add a restart button in the winning screen
    menu.drawRestartButton();
    
    // Add a quit button in the winning screen
    menu.drawQuitButton();
  }
  
  // Else if menu enum is equal to losing screen for 2nd place enum, show the 2nd place losing screen
  else if (menu.MENU == Menus.LOSING_SCREEN_FOR_2ND_PLACE)
  {
    // Show the 2nd place losing screen
    menu.drawLosingGameOverScreenForSecondPlace();
    
    // Add a restart button for 2nd place losing screen
    menu.drawRestartButton();
    
    // Add a quit button for 2nd place losing screen
    menu.drawQuitButton();
  }
  
  // Else if menu enum is equal to losing screen for 3rd place enum, show the 3rd place losing screen
  else if (menu.MENU == Menus.LOSING_SCREEN_FOR_3RD_PLACE)
  {
    // Show the 3rd place losing screen
    menu.drawLosingGameOverScreenForThirdPlace();
    
    // Add a restart button for 3rd place losing screen
    menu.drawRestartButton();
    
    // Add a quit button for 3rd place losing screen
    menu.drawQuitButton();
  }
  
  // Else if menu enum is equal to losing screen for 4th place enum, show the 4th place losing screen
  else if (menu.MENU == Menus.LOSING_SCREEN_FOR_4TH_PLACE)
  {
    // Show the 4th place losing screen
    menu.drawLosingGameOverScreenForFourthPlace();
    
    // Add a restart button for 4th place losing screen
    menu.drawRestartButton();
    
    // Add a quit button for 4th place losing screen
    menu.drawQuitButton();
  }
  
  // Else if menu enum is equal to losing screen for 5th place enum, show the 5th place losing screen
  else if (menu.MENU == Menus.LOSING_SCREEN_FOR_5TH_PLACE)
  {
    // Show the 5th place losing screen
    menu.drawLosingGameOverScreenForFifthPlace();
    
    // Add a restart button for 5th place losing screen
    menu.drawRestartButton();
    
    // Add a quit button for 5th place losing screen
    menu.drawQuitButton();
  }
  
  // Else if menu enum is equal to losing screen for 6th place enum, show the 6th place losing screen
  else if (menu.MENU == Menus.LOSING_SCREEN_FOR_6TH_PLACE)
  {
    // Show the 6th place losing screen
    menu.drawLosingGameOverScreenForSixthPlace();
    
    // Add a restart button for 6th place losing screen
    menu.drawRestartButton();
    
    // Add a quit button for 6th place losing screen
    menu.drawQuitButton();
  }
}

// Create a function to reset the whole game
boolean resetGame()
{
  // Reset the player's position and velocity to the starting point
  playerCar.playerPosition = new PVector(160, 360);
  playerCar.playerVelocity = new PVector(random(3, 4), random(3, 4));
  
  // Loop the length of the CPU cars
  for(int i = 0; i < cpuCar.length; i++)
  {
    // Reset all the CPU cars' positions back to where they started, as well as the CPU cars' velocities
    cpuCar[i].CPUposition = new PVector(20 + (i * 90), 360);
    cpuCar[i].CPUvelocity = new PVector(0, random(-2.5, -1.5));
    
    cpuCar[i].currentLapForCPU = 1; // Reset the current lap for the CPU to 1
  }
  
  return true;
}

// If the player presses a key below, trigger these events (inventory skill 7)
void keyPressed()
{
  // If the player presses the down arrow key, move the player car down
  if (keyCode == DOWN)
  {
    playerCar.playerPosition.y += playerCar.playerVelocity.y; // inventory skill 8
    playerCar.playerState = PlayerStates.MOVING_BACKWARD;
  }
  
  // If the player presses the up arrow key, move the player car up
  if (keyCode == UP)
  {
    playerCar.playerPosition.y -= playerCar.playerVelocity.y;
    playerCar.playerState = PlayerStates.MOVING_FORWARD;
  }
  
  // If the player presses the down arrow key, move the player car down
  if (keyCode == LEFT)
  {
    playerCar.playerPosition.x -= playerCar.playerVelocity.x;
    playerCar.playerState = PlayerStates.MOVING_LEFT;
  }
  
  // If the player presses the up arrow key, move the player car up
  if (keyCode == RIGHT)
  {
    playerCar.playerPosition.x += playerCar.playerVelocity.x;
    playerCar.playerState = PlayerStates.MOVING_RIGHT;
  }
}

// If the key is released, then stop the player car
void keyReleased()
{
  // If the player releases the down arrow key, don't move the player car until the player presses it again
  if (keyCode == DOWN)
  {
    playerCar.playerPosition.y = playerCar.playerPosition.y + 0;
    playerCar.playerState = PlayerStates.IDLE;
  }
  
  // If the player releases the up arrow key, don't move the player car until the player presses it again
  if (keyCode == UP)
  {
    playerCar.playerPosition.y = playerCar.playerPosition.y - 0;
    playerCar.playerState = PlayerStates.IDLE;
  }
  
  // If the player releases the down arrow key, don't move the player car until the player presses it again
  if (keyCode == LEFT)
  {
    playerCar.playerPosition.x = playerCar.playerPosition.x - 0;
    playerCar.playerState = PlayerStates.IDLE;
  }
  
  // If the player releases the up arrow key, don't move the player car until the player presses it again
  if (keyCode == RIGHT)
  {
    playerCar.playerPosition.x = playerCar.playerPosition.x + 0;
    playerCar.playerState = PlayerStates.IDLE;
  }
}
