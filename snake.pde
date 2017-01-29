class Snake {
  int moveX, moveY;  //which direction snake is moving
  int gameOver;  //0=gameOn, 1= gameOver
  int len=1;  //initial length of snake
  IntList colors=new IntList(); //list of link colors of snake
  IntList xpos= new IntList();  //list of x and y pos of snake and its links
  IntList ypos= new IntList();


  Snake() {
    gameOver=0; //start game
    xpos.append((int)random(20, width-20));  //add random x, y  
    ypos.append((int)random(20, height-20));// to repective lists
    colors.append(color(0));            //head of snake is always black (first position)     
  };

  private void displaySnake() {
    moveSnake(); // move the snake
    for (int i=0; i<len; i++) {  //iterate through list
      fill(colors.get(i));  //set fill for each link
      rect(xpos.get(i), ypos.get(i), size, size);//display linke
    }
    fill(colors.get(len-1)); //fill= the color of last link
    text(len, (width-(width/10)), height/10);// display score (length)
  };

  private void moveSnake() {  //moves in linear motion
    if (gameOver!=1) { //if gameOn
      if (keyPressed) {
        if (keyCode==RIGHT && moveX!=-size-5) { //if pressed right key
          moveY=0;            //moveY=0
          moveX=size+5;       //set the movementX to be right (+)
        } else if (keyCode==LEFT) {
          moveY=0;              //reset
          moveX= -size-5;     //if left set moveX to be negative
        } else if (keyCode==UP) {
          moveY=-size-5;        //if key pressed is up, set moveY to be negative
          moveX=0;              //reset moveX
        } else if (keyCode==DOWN) {
          moveY=size+5;         //(+)
          moveX=0;
        }
      }

      for (int i=len; i>0; i--) {//iterate backwards to preserve information
        xpos.set(i, xpos.get(i-1));  //set each link equal to the previous link position
        ypos.set(i, ypos.get(i-1));
      }

      xpos.add(0, moveX); //increment the head forwards
      ypos.add(0, moveY);
      checkBorders();  //check if the snake has hit borders
      checkHit();        //check if  snake has hit its own tail
    }
    if (gameOver==1) //if gameOver
      playAgain(); //give option to play again
  };

  private void addLink(color c) {
    xpos.append(xpos.get(len-1));  //add new postions to respective lists
    ypos.append(ypos.get(len-1));
    colors.append(c);          //append the correct color
    len++;  //add one to link
  };

  private void checkHit() {
    boolean hit=false;   //initialize hit to false
    if (len>1) { //if the snake has a tail
      for (int i=1; i<len; i++) {  //iterate through
        if ((xpos.get(0)==xpos.get(i))&&(ypos.get(0)==ypos.get(i))) //if head equals another position
          hit=true;   //hit is true
      }
    }
    if (hit)  //if tail is hit
      gameOver=1;  //gameOver
  };

  private void checkBorders() {
    if (xpos.get(0)>=width)  //if snake if going off screen
      xpos.set(0, 1);        //reset the head position to
    if (xpos.get(0)<=0)     // the opposite side of the screen
      xpos.set(0, width);
    if (ypos.get(0)>=height)
      ypos.set(0, 1);
    if (ypos.get(0)<=0)
      ypos.set(0, height);
  };


  private void playAgain() { //to play again
    fill(0);
    text("Score: "+len, width/4, 1.5*height/4);
    text("Play again? ('y/n')", width/8, height/2);
    if (keyPressed) {
      if (key=='y'||key=='Y') {  ///enter y
        setup();   //reset all variables
      }
      if (key=='n'||key=='N') //enter n
        exit();               //close the screen
    }
  };
}