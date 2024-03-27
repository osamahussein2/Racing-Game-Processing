class Fireworks
{
  // Initialize 4 fireworks a fixed array
  PImage[] fireworks = new PImage[4];
  
  // Create a frame integer that we will use when we animate the images one at a time
  int frame = 0;
  
  // Create a constructor for the Fireworks class
  Fireworks()
  {
    // Initialize the fireworks array to load in individual images of fireworks (I made these images on my own using the Paint software)
    fireworks[0] = loadImage("Data/Fireworks animation part 1.png");
    fireworks[1] = loadImage("Data/Fireworks animation part 2.png");
    fireworks[2] = loadImage("Data/Fireworks animation part 3.png");
    fireworks[3] = loadImage("Data/Fireworks animation part 4.png");
  }
  
  // Create a PImage function that animates the fireworks
  PImage[] animateFireworks()
  {
    // Loop the fireworks images to animate it on the screen after the player has won the race
    for(int i = 0; i < fireworks.length; i++)
    {
      // Load the different fireworks images to animate them one at a time using the frame int
      image(fireworks[frame], 0, 0);
      
      // If the frame count % 5 is equal to 0, animate the images by frame
      if(frameCount % 5 == 0)
      {
        // millis() / 300 means that I'm trying to convert it to a second so the animation would take about 0.3 seconds to animate the images one at a time
        frame = (millis() / 300) % fireworks.length; // Animation occured (inventory skill 48)
      }
    }
    
    return fireworks; // Return the fireworks image
  }
}
