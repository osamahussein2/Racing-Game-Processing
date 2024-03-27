class RaceTimer
{
  // Create 2 global variables for elapsed time in seconds and elapsed time in minutes
  int elapsedTimerInSeconds;
  int elapsedTimerInMinutes;
  
  // Create a constructor for the race timer class
  RaceTimer()
  {
    // Initialize the elapsed timer to 0 for both seconds and minutes
    elapsedTimerInSeconds = 0;
    elapsedTimerInMinutes = 0;
  }
  
  // Draw the timer during the race
  void drawRaceTimer()
  {
    /* I used this website to make the timer work: https://forum.processing.org/one/topic/timer-in-processing.html
    (Go to the first reply where it talks about the millis() function and how to use it, inventory skill 44) */
    
    elapsedTimerInSeconds = int(millis() / 1000) % 60;
    elapsedTimerInMinutes = int(millis() / 1000) / 60;
    
    // This is needed to make the elapsed time at the top left of the screen more visible to the player
    fill(0); // Make the rectangle black to make the text more visible to the player
    rect(0, 0, 80, 70);
    
    // Make the time text white and size 15
    fill(255);
    textSize(15);
    text( "Time: " + elapsedTimerInMinutes + ":" + elapsedTimerInSeconds, 0, 15);
  }
}
