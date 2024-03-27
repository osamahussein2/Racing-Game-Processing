class RoadLine
{
  // Create a finish line vector to draw it to the screen
  PVector finishLine;
  
  // Create a finish line width and height
  int finishLineWidth, finishLineHeight;
  
  // Create the constructor for the road line class
  RoadLine()
  {
    // Instantiate a new finish line object to draw the finish line to the screen
    finishLine = new PVector(0, 0);
    
    finishLineWidth = 400; // Make it 400 at the beginning
    finishLineHeight = 0; // Make it 0 at the beginning
  }
  
  // Draw the road line with a white stroke (inventory skill 23)
  void drawRoadLine(int x1, int y1, int x2, int y2)
  {
    // The road line will have a stroke of white color, but won't have a fill color
    stroke(255);
    noFill();
    
    // Create a line to make the road by using the 4 parameters in this function to create the road line
    line(x1, y1, x2, y2);
  }
  
  // Draw the finish line
  void drawFinishLine()
  {
    /* Make the finish line white (but the finish line won't be shown on the screen anyway, it's just a test for collision detection
    system between the finish line and the cars in the race */
    
    noStroke();
    fill(255);
    
    // Draw a rectangle for the finish line
    rect(finishLine.x, finishLine.y, finishLineWidth, finishLineHeight);
  }
}
