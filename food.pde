class Food {
  int xpos=(int)random(20, width-20); //randomly assign position and color to food
  int ypos=(int)random(20, height-20);
  color c = color((int)random(255), (int)random(155, 255), (int)random(155, 255));

  private void display() {
    fill(c);             //display food using variables
    rect(xpos, ypos, size, size);
  }

  private color moreFood() {
    color tempColor=c;       //keep the old color
    xpos=(int)random(20, width-20);      //reset all of the variables
    ypos=(int)random(20, height-20);
    c = color((int)random(255), (int)random(255), (int)random(200,255));
    return tempColor;  //return old color to be used
  }
};