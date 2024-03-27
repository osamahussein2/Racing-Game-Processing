class CPUcar
{
  // Create CPU position and velocity vectors (inventory skills 38 & 39)
  PVector CPUposition;
  PVector CPUvelocity;
  
  // Create CPU width and height as global int variables (inventory skill 10)
  int CPUwidth, CPUheight;
  
  // Create a global variable to take in the current lap for CPU car
  int currentLapForCPU;
  
  // Create a roadline class object to test the collision between the CPU car and finish line
  RoadLine finishLine;
  
  // Create a constructor for the CPU car (inventory skills 28 & 30)
  CPUcar(PVector CPUposition_, PVector CPUvelocity_, int CPUwidth_, int CPUheight_)
  {
    CPUposition = CPUposition_;
    CPUvelocity = CPUvelocity_;
    
    CPUwidth = CPUwidth_;
    CPUheight = CPUheight_;
    
    currentLapForCPU = 1;
    
    // Create a road line object to test the collision between the CPU car and the finish line
    finishLine = new RoadLine();
  }
  
  // Draw the CPU car while creating an argument to pass in a color object
  void drawCPUcar(color Color)
  {
    // A CPU car doesn't need a stroke and make it the color whatever is passed in the parameter once this function is used inside the RACING_GAME if statement
    noStroke();
    fill(Color); // inventory skill 2
    
    rect(CPUposition.x, CPUposition.y, CPUwidth, CPUheight); // inventory skill 1
  }
  
  // Create a function to update the CPU car
  void updateCPUcar()
  {
    // Update the CPU car to move both its x position and y position
    CPUposition.x += CPUvelocity.x;
    CPUposition.y += CPUvelocity.y;
  }
  
  // Determine the CPU laps during the race
  void determineCPUlaps(PlayerCar player_)
  {
    // If a CPU car collides with the finish line
    if(CPUcarCollidedWithFinishLine(finishLine))
    {
      // Increment the current lap for the CPU car
      currentLapForCPU += 1;
      
      // Place the CPU car back to the starting position (with randomized position X and velocity Y)
      CPUposition = new PVector(random(20, 380), 360);
      CPUvelocity = new PVector(0, random(-2.5, -1.5));
      
      // If the current lap for CPU is greater than the total laps (set by the player), then make the current lap for CPU equal to player laps
      if(currentLapForCPU > player_.laps)
      {
        currentLapForCPU = player_.laps;
        
        // If current lap for CPU is equal to total laps (already happened above), then place CPU car off screen (just above the finish line)
        if(currentLapForCPU == player_.laps)
        {
          CPUposition.x = random(10, 390); // Place them anywhere inside the screen limits along the x-axis
          CPUposition.y = -50; // Put the CPU cars offscreen (above the screen)
          
          CPUvelocity.x = 0; // Won't move
          CPUvelocity.y = 0; // Also won't move because the CPU car finished racing
        }
      }
    }
  }
  
  /* Create a boolean function to check the collision between the CPU cars and the finish line:
  https://happycoding.io/tutorials/processing/collision-detection (go to Rectangle Rectangle Collision Detection, and go to lines 18-19. That's where I used this collision code below.
  This gave me a starting point to the rectangle collisions working) */
  boolean CPUcarCollidedWithFinishLine(RoadLine finishLine_)
  {
    // I only need the collision detection between the CPU cars and the finish line along the y axis, since the CPU cars are looking to win the race
    
    if (CPUposition.x >= 0 && CPUposition.x <= 400 &&
      CPUposition.y <= 400 &&
      CPUposition.y < finishLine_.finishLine.y)
    {
      return true; // The collision occurred
    }
  
    return false; // Otherwise, no collision occurred
  }
}
