enum Menus {MAIN_MENU, OPTIONS_MENU, CREDITS_MENU, RACING_GAME, WINNING_SCREEN, LOSING_SCREEN_FOR_2ND_PLACE,
LOSING_SCREEN_FOR_3RD_PLACE, LOSING_SCREEN_FOR_4TH_PLACE, LOSING_SCREEN_FOR_5TH_PLACE, LOSING_SCREEN_FOR_6TH_PLACE}

class Menu
{
  // Create a global enum menu
  Menus MENU;
  
  // Create a vector for player car in the main menu to use it as a drag & drop object (as well as its width and height ints)
  PVector playerCarInMainMenu;
  int playerCarInMainMenuWidth, playerCarInMainMenuHeight;
  
  // Create a constructor for the menu class
  Menu()
  {
    MENU = Menus.MAIN_MENU; // Initialize the menu variable to start at 0
    
    PVector randomMainMenuVector = PVector.random2D();
    println(randomMainMenuVector); // inventory skill 41
    
    playerCarInMainMenu = new PVector(5, 5);
    
    playerCarInMainMenuWidth = 20;
    playerCarInMainMenuHeight = 40;
  }
  
  // Draw the main menu function (inventory skill 20)
  void drawMainMenu()
  {
    // Make the background black
    background(0);
    
    // Make the title text red
    fill(255, 0, 0);
    textSize(40);
    text("Racing Game", 90, 50);
    
    // Constrain the player car to stay on screen and not get in the way of the buttons on the main menu
    playerCarInMainMenu.x = constrain(playerCarInMainMenu.x, 5, 95);
    playerCarInMainMenu.y = constrain(playerCarInMainMenu.y, 5, 355);
    
    // Create a green player car rectangle for the main menu as a drag & drop object
    noStroke();
    fill(0, 255, 0);
    rect(playerCarInMainMenu.x, playerCarInMainMenu.y, playerCarInMainMenuWidth, playerCarInMainMenuHeight);
    
    // If the player presses their mouse inside where the player car in main menu is, drag it around the main menu and drop it when the mouse is released (inventory skill 47)
    if(mousePressed)
    {
      playerCarInMainMenu.x = mouseX;
      playerCarInMainMenu.y = mouseY;
    }
    
    // If the player lets go of the mouse, then place the player car where the player dropped it at
    else if(!mousePressed)
    {
      if(playerCarInMainMenu.x > 5 || playerCarInMainMenu.y > 5 || playerCarInMainMenu.x < 95 || playerCarInMainMenu.y < 355)
      {
        playerCarInMainMenu.x = playerCarInMainMenu.x;
        playerCarInMainMenu.y = playerCarInMainMenu.y;
      }
    }
  }
  
  // Draw the options menu function
  void drawOptionsMenu()
  {
    // Make the background black
    background(0);
    
    // Make the options text red
    fill(255, 0, 0);
    textSize(40);
    text("Options", 90, 50);
    
    // Print these statements to the console to tell the player the minimum laps and the maximum laps (inventory skill 11)
    println("The minimum amount of laps in this race is 1 lap");
    println("The maximum amount of laps in this race is 5 laps");
    
    // If the laps is equal to or more than 5, make it equal to 5 so that the player cannot exceed more than 5 laps
    if(playerCar.laps >= 5)
    {
      playerCar.laps = 5;
    }
    
    // If the laps is equal to or less than 1, make it equal to 1 so that the player cannot lower the laps further than 1
    if(playerCar.laps <= 1)
    {
      playerCar.laps = 1;
    }
    
    // Make the laps text red
    fill(255, 0, 0);
    textSize(20);
    text("Laps", 160, 150);
    
    // Switch the amount of laps inside the options menu (inventory skill 15)
    switch(playerCar.laps)
    {
      case 1:
      fill(255);
      textSize(40);
      text("1", 190, 220);
      break; // inventory skill 18
      
      case 2:
      fill(255);
      textSize(40);
      text("2", 190, 220);
      break;
      
      case 3:
      fill(255);
      textSize(40);
      text("3", 190, 220);
      break;
      
      case 4:
      fill(255);
      textSize(40);
      text ("4", 190, 220);
      break;
      
      case 5:
      fill(255);
      textSize(40);
      text ("5", 190, 220);
      break;
    }
  }
  
  // Draw the credits menu function
  void drawCreditsMenu()
  {
    // Make the background black
    background(0);
    
    // Make the Credits text red and size 40
    fill(255, 0, 0);
    textSize(40);
    text("Credits", 140, 50);
    
    // Make the Programming text red and size 30
    fill(255, 0, 0);
    textSize(30);
    text("Programming", 120, 150);
    
    // Make the Osama Hussein text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("Osama Hussein", 140, 200);
  }
  
  // If the player finishes in 1st place, then trigger this winning game over screen function below
  void drawWinningGameOverScreen()
  {
    String st = "st"; // A local string variable to tell the player they finished 1st
    
    // Make the background black
    background(0);
    
    // Make the winning text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You won the race by achieving 1" + st + " place! \nCongratulations!", 40, 50);
    
    // Make a gold trophy for winning the race by finishing 1st place
    stroke(0);
    fill(255, 255, 0);
    rect(180, 370, 40, 10);
    
    stroke(0);
    fill(255, 255, 0);
    rect(195, 330, 10, 40);
    
    stroke(0);
    fill(255, 255, 0);
    triangle(185, 330, 195, 330, 195, 365);
    
    stroke(0);
    fill(255, 255, 0);
    triangle(205, 330, 205, 365, 215, 330);
    
    stroke(0);
    fill(255, 255, 0);
    ellipse(200, 319, 25, 25);
    
    fill(255, 255, 0);
    textSize(15);
    text("Take my trophy as a\ngift that you've won!", 250, 350);
  }
  
  // If the player finishes in 2nd place, then trigger this losing game over screen function below
  void drawLosingGameOverScreenForSecondPlace()
  {
    String nd = "nd"; // A local string variable to tell the player they finished 2nd
    
    // Make the background black
    background(0);
    
    // Make the 2nd place losing text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You lost the race by achieving 2" + nd + " place!\nTry again or quit?", 40, 50);
    
    // Make a silver trophy for losing the race by finishing 2nd place
    stroke(0);
    fill(192);
    rect(120, 370, 40, 10);
    
    stroke(0);
    fill(192);
    rect(135, 330, 10, 40);
    
    stroke(0);
    fill(192);
    triangle(125, 330, 135, 330, 135, 365);
    
    stroke(0);
    fill(192);
    triangle(145, 330, 145, 365, 155, 330);
    
    stroke(0);
    fill(192);
    ellipse(140, 319, 25, 25);
    
    // Draw a person saying "SO CLOSE! TRY AGAIN!"
    stroke(0);
    fill(255, 0, 0);
    ellipse(200, 330, 30, 30);
    
    // Draw 2 eyes
    stroke(0);
    fill(0);
    ellipse(195, 325, 3, 3);
    
    stroke(0);
    fill(0);
    ellipse(205, 325, 3, 3);
    
    // Draw a mouth
    stroke(0);
    fill(0);
    rect(193, 331, 15, 5);
    
    // Draw a small triangle for text bubble
    noStroke();
    fill(255, 0, 0);
    triangle(220, 330, 230, 320, 230, 340);
    
    // Draw a speech circle for the text
    noStroke();
    fill(255, 0, 0);
    ellipse(259, 330, 60, 50);
    
    fill(0);
    textSize(10);
    text("SO CLOSE!\nTRY AGAIN!", 237, 327);
  }
  
  // If the player finishes in 3rd place, then trigger this losing game over screen function below
  void drawLosingGameOverScreenForThirdPlace()
  {
    String rd = "rd"; // A local string variable to tell the player they finished 3rd
    
    // Make the background black
    background(0);
    
    // Make the 3rd place losing text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You lost the race by achieving 3" + rd + " place!\nTry again or quit?", 40, 50);
    
    // Make a bronze trophy for losing the race by finishing 3rd place
    stroke(0);
    fill(205, 127, 50);
    rect(120, 370, 40, 10);
    
    stroke(0);
    fill(205, 127, 50);
    rect(135, 330, 10, 40);
    
    stroke(0);
    fill(205, 127, 50);
    triangle(125, 330, 135, 330, 135, 365);
    
    stroke(0);
    fill(205, 127, 50);
    triangle(145, 330, 145, 365, 155, 330);
    
    stroke(0);
    fill(205, 127, 50);
    ellipse(140, 319, 25, 25);
    
    // Draw a person saying "Not bad!"
    stroke(0);
    fill(255, 0, 0);
    ellipse(200, 330, 30, 30);
    
    // Draw 2 eyes
    stroke(0);
    fill(0);
    ellipse(195, 325, 3, 3);
    
    stroke(0);
    fill(0);
    ellipse(205, 325, 3, 3);
    
    // Draw the mouth
    stroke(0);
    fill(0);
    rect(193, 331, 15, 5);
    
    // Draw a small triangle for text bubble
    noStroke();
    fill(255, 0, 0);
    triangle(220, 330, 230, 320, 230, 340);
    
    // Draw a speech circle for the text
    noStroke();
    fill(255, 0, 0);
    ellipse(259, 330, 60, 50);
    
    fill(0);
    textSize(12);
    text("Not bad!", 238, 330);
  }
  
  // If the player finishes in 4th place, then trigger this losing game over screen function below
  void drawLosingGameOverScreenForFourthPlace()
  {
    String th = "th"; // A local string variable to tell the player they finished 4th
    
    // Make the background black
    background(0);
    
    // Make the 4th place losing text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You lost the race by achieving 4"  + th + " place!\nTry again or quit?", 40, 50);
    
    // Draw a person saying "Do better! You didn't get a trophy!"
    stroke(0);
    fill(255, 0, 0);
    ellipse(200, 330, 30, 30);
    
    // Draw the eyes
    stroke(0);
    fill(0);
    ellipse(195, 325, 3, 3);
    
    stroke(0);
    fill(0);
    ellipse(205, 325, 3, 3);
    
    // Draw the mouth
    stroke(0);
    fill(0);
    rect(193, 331, 15, 5);
    
    // Draw a tear
    noStroke();
    fill(134, 185, 216); // Make it a color of tears
    ellipse(194, 333, 3, 7);
    
    // Draw a small triangle for text bubble
    noStroke();
    fill(255, 0, 0);
    triangle(220, 330, 230, 320, 230, 340);
    
    // Draw speech circle for the text
    noStroke();
    fill(255, 0, 0);
    ellipse(259, 330, 60, 50);
    
    fill(0);
    textSize(9);
    text("Do better!\nYou didn't\nget a trophy!", 238, 321);
  }
  
  // If the player finishes in 5th place, then trigger this losing game over screen function below
  void drawLosingGameOverScreenForFifthPlace()
  {
    String th = "th"; // A local string variable to tell the player they finished 5th
    
    // Make the background black
    background(0);
    
    // Make the 5th place losing text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You lost the race by achieving 5"  + th + " place!\nTry again or quit?", 40, 50);
    
    // Draw a person saying "Do better! You nearly finished last!"
    stroke(0);
    fill(255, 0, 0);
    ellipse(200, 330, 30, 30);
    
    // Draw the eyes
    stroke(0);
    fill(0);
    ellipse(195, 325, 3, 3);
    
    stroke(0);
    fill(0);
    ellipse(205, 325, 3, 3);
    
    // Draw the mouth
    stroke(0);
    fill(0);
    rect(193, 331, 15, 5);
    
    // Draw tears
    noStroke();
    fill(134, 185, 216); // Make it a color of tears
    ellipse(194, 333, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(194, 345, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 333, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 345, 3, 7);
    
    // Draw a small triangle for text bubble
    noStroke();
    fill(255, 0, 0);
    triangle(220, 330, 230, 320, 230, 340);
    
    // Draw speech circle for the text
    noStroke();
    fill(255, 0, 0);
    ellipse(259, 330, 60, 50);
    
    fill(0);
    textSize(9);
    text("Do better!\nYou nearly\nfinished last!", 238, 321);
  }
  
  // If the player finishes in 6th place, then trigger this losing game over screen function below
  void drawLosingGameOverScreenForSixthPlace()
  {
    String th = "th"; // A local string variable to tell the player they finished 6th
    
    // Make the background black
    background(0);
    
    // Make the 6th place losing text red and size 20
    fill(255, 0, 0);
    textSize(20);
    text("You lost the race by achieving 6"  + th + " place!\nTry again or quit?", 40, 50);
    
    // Draw a person saying "WELP!"
    stroke(0);
    fill(255, 0, 0);
    ellipse(200, 330, 30, 30);
    
    // Draw the eyes
    stroke(0);
    fill(0);
    ellipse(195, 325, 3, 3);
    
    stroke(0);
    fill(0);
    ellipse(205, 325, 3, 3);
    
    // Draw the mouth
    stroke(0);
    fill(0);
    rect(193, 331, 15, 5);
    
    // Draw tears
    noStroke();
    fill(134, 185, 216); // Make it a color of tears
    ellipse(194, 333, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(194, 345, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(194, 357, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(194, 369, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(194, 381, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 333, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 345, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 357, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 369, 3, 7);
    
    noStroke();
    fill(134, 185, 216);
    ellipse(204, 381, 3, 7);
    
    // Draw a small triangle for text bubble
    noStroke();
    fill(255, 0, 0);
    triangle(220, 330, 230, 320, 230, 340);
    
    // Draw speech circle for the text
    noStroke();
    fill(255, 0, 0);
    ellipse(259, 330, 60, 50);
    
    fill(0);
    textSize(15);
    text("WELP!", 240, 335);
  }
  
  /* Draw the play button function (I made the buttons work using this little tutorial: https://forum.processing.org/one/topic/simple-button-tutorial.html
  Go to the first reply, and I used lines 13-17 where I drew the buttons & 20, only for going to another screen) */
  void drawPlayButton()
  {
    // Draw the play button on the screen
    
    rectMode(CORNER); // inventory skill 3
    noStroke();
    fill(255, 0, 0);
    rect(150, 180, 85, 50);
    
    textSize(32);
    fill(0);
    text("PLAY", 160, 215);
    
    // If the player didn't press the mouse on the PLAY button
    if(!mousePressed)
    {
      // If the mouse is hovered around the PLAY rectangle button
      if (mouseX >= 150 && mouseY >= 180 && mouseX <= 235 && mouseY <= 230) 
      {
        // Change the original red PLAY button color to green while the mouse is hovered over it (inventory skill 46)
        rectMode(CORNER);
        noStroke();
        fill(0, 255, 0);
        rect(150, 180, 85, 50);
        
        textSize(32);
        fill(0);
        text("PLAY", 160, 215);
      }
    }
    
    // Click play button (press within the rectangle button with your mouse)
    // Basically it's mouseX >= rectX && mouseY >= rectY && mouseX <= rectX + rectW && mouseY <= rectY + rectH (like I did below)
    if(mousePressed)
    {
      if (mouseX >= 150 && mouseY >= 180 && mouseX <= 235 && mouseY <= 230) 
      {
        MENU = Menus.RACING_GAME; // Transition to the game
      }
    }
  }
  
  // Draw the options button function
  void drawOptionsButton()
  {
    // Draw the options button on the screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(150, 240, 85, 50);
    
    textSize(18);
    fill(0);
    text("OPTIONS", 160, 270);
    
    // If the mouse is not pressed on the OPTIONS button
    if(!mousePressed)
    {
      // If the player hovers the mouse around the OPTIONS rectangle button
      if (mouseX >= 150 && mouseY >= 240 && mouseX <= 235 && mouseY <= 290) 
      {
        // Change the original red button to a orange button while hovering around the OPTIONS button
        rectMode(CORNER);
        noStroke();
        fill(255, 165, 0);
        rect(150, 240, 85, 50);
        
        textSize(18);
        fill(0);
        text("OPTIONS", 160, 270);
      }
    }
    
    // Click options button (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 150 && mouseY >= 240 && mouseX <= 235 && mouseY <= 290) 
      {
        MENU = Menus.OPTIONS_MENU; // Transition to the options menu
      }
    }
  }
  
  // Draw the credits button function
  void drawCreditsButton()
  {
    // Draw the credits button on the screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(150, 300, 85, 50);
    
    textSize(18);
    fill(0);
    text("CREDITS", 160, 330);
    
    // If the player doesn't press the mouse on the CREDITS button
    if(!mousePressed)
    {
      // If the player hovers the mouse around the CREDITS rectangle button
      if (mouseX >= 150 && mouseY >= 300 && mouseX <= 235 && mouseY <= 350) 
      {
        // Change the original CREDITS button color from red to yellow while hovering over it
        rectMode(CORNER);
        noStroke();
        fill(255, 255, 0);
        rect(150, 300, 85, 50);
    
        textSize(18);
        fill(0);
        text("CREDITS", 160, 330);
      }
    }
    
    // Click credits button (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 150 && mouseY >= 300 && mouseX <= 235 && mouseY <= 350) 
      {
        MENU = Menus.CREDITS_MENU; // Transition to the credits menu
      }
    }
  }
  
  // Draw the back button function
  void drawBackButton()
  {
    // Draw the back button on the screen (only available in the options menu and credits menu)
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(300, 330, 75, 40);
    
    textSize(27);
    fill(0);
    text("BACK", 305, 360);
  
    // If player doesn't press the mouse on the BACK button
    if(!mousePressed)
    {
      // If player hovers the mouse around the BACK rectangle button
      if (mouseX >= 300 && mouseY >= 330 && mouseX <= 375 && mouseY <= 370) 
      {
        // Change the BACK button color from red to blue (also changing the text from black to white to make it clearer)
        rectMode(CORNER);
        noStroke();
        fill(0, 0, 255);
        rect(300, 330, 75, 40);
    
        textSize(27);
        fill(255); // Improved legibility
        text("BACK", 305, 360);
      }
    }
  
    // Click back button to go back to the main menu (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 300 && mouseY >= 330 && mouseX <= 375 && mouseY <= 370) 
      {
        MENU = Menus.MAIN_MENU; // Go back to the main menu
      }
    }
  }
  
  // Draw the left arrow button function
  void drawLeftArrowButton()
  {
    // Draw the left arrow button on the screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(130, 170, 40, 80);
    
    textSize(30);
    fill(0);
    text("<", 140, 220);
  
    // If player doesn't press the mouse on the < button
    if(!mousePressed)
    {
      // If the player hovers the mouse over the < button
      if (mouseX >= 130 && mouseY >= 170 && mouseX <= 170 && mouseY <= 250) 
      {
        // Change the original red > button to white while hovering over it
        rectMode(CORNER);
        noStroke();
        fill(255);
        rect(130, 170, 40, 80);
    
        textSize(30);
        fill(0);
        text("<", 140, 220);
      }
    }
  
    // Click the left button to lower the amount of laps in the race (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 130 && mouseY >= 170 && mouseX <= 170 && mouseY <= 250) 
      {
        // Decrement the laps if the player presses the left arrow button in the options menu
        playerCar.laps -= 1;
      }
    }
  }
  
  // Draw the right arrow button function
  void drawRightArrowButton()
  {
    // Draw the the right arrow button on the screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(230, 170, 40, 80);
    
    textSize(30);
    fill(0);
    text(">", 240, 220);
    
    // If the player doesn't press the mouse on the > button
    if (!mousePressed)
    {
      // If the player hovers the mouse over the > button
      if (mouseX >= 230 && mouseY >= 170 && mouseX <= 270 && mouseY <= 250) 
      {
        // Change the original > button color from red to white while hovering the mouse over it
        rectMode(CORNER);
        noStroke();
        fill(255);
        rect(230, 170, 40, 80);
    
        textSize(30);
        fill(0);
        text(">", 240, 220);
      }
    }
    
    // Click the right button to increase the amount of laps in the race (press within the rectangle button with your mouse)
    if (mousePressed)
    {
      if (mouseX >= 230 && mouseY >= 170 && mouseX <= 270 && mouseY <= 250) 
      {
        // Increment the player lap by 1 each time the player hits the finish line
        playerCar.laps += 1;
      }
    }
  }
  
  // Create a restart button function
  void drawRestartButton()
  {
    // Draw the restart button on the winning game over screen and the losing game over screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(60, 215, 85, 50);
    
    textSize(18);
    fill(0);
    text("RESTART", 65, 245);
    
    // If player doesn't press the mouse on the RESTART button
    if(!mousePressed)
    {
      // If the player hovers the mouse over the RESTART rectangle button
      if (mouseX >= 60 && mouseY >= 215 && mouseX <= 145 && mouseY <= 265) 
      {
        // Change the original RESTART button color from red to green (like the play button on the main menu) while hovering the mouse over it
        rectMode(CORNER);
        noStroke();
        fill(0, 255, 0);
        rect(60, 215, 85, 50);
    
        textSize(18);
        fill(0);
        text("RESTART", 65, 245);
      }
    }
    
    // Click the restart button to retry the race (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 60 && mouseY >= 215 && mouseX <= 145 && mouseY <= 265) 
      {
        // Reset the game and restart the race
        resetGame(); // inventory skill 21
        MENU = Menus.RACING_GAME;
      }
    }
  }
  
  // Create a quit button function
  void drawQuitButton()
  {
    // Draw the quit button on the screen
    
    rectMode(CORNER);
    noStroke();
    fill(255, 0, 0);
    rect(260, 215, 85, 50);
    
    textSize(24);
    fill(0);
    text("QUIT", 275, 245);
    
    // If the player doesn't click the mouse on the QUIT button
    if(!mousePressed)
    {
      // If the player hovers the mouse over the QUIT rectangle button
      if (mouseX >= 260 && mouseY >= 215 && mouseX <= 345 && mouseY <= 265) 
      {
        // Change the original QUIT button color from red to purple (also changing the text color from black to white to make it clearer)
        rectMode(CORNER);
        noStroke();
        fill(128, 0, 128);
        rect(260, 215, 85, 50);
    
        textSize(24);
        fill(255); // Improved legibility
        text("QUIT", 275, 245);
      }
    }
    
    // Click quit button to back to the main menu (press within the rectangle button with your mouse)
    if(mousePressed)
    {
      if (mouseX >= 260 && mouseY >= 215 && mouseX <= 345 && mouseY <= 265) 
      {
        // Reset the game and go back to the main menu
        resetGame();
        MENU = Menus.MAIN_MENU;
      }
    }
  }
}
