int dif; //difficulty ; 0=not set, 1=set
Snake snake; //global snake variable
Food food; //global food variable
int size=25;//size of snake and food

void setup() {
  size(700, 700);
  snake = new Snake(); //initialize snake
  food = new Food();  //initialize food
  dif=0; //initialize difficulty to not set 
  colorMode(HSB);     //change color mode
  PFont font = loadFont("AgencyFB-Reg-48.vlw"); //create font
  textFont(font, ((width/10+height/10)/2));  //set the size
}

void draw() {
  background(150); //reset background each time
  if (dif==0) //if difficulty hasnt been selected, get dif
    getDiff();
  if (dif!=0) { //else
    food.display();//display the food
    snake.displaySnake();// display the snake

    if (dist(snake.xpos.get(0)+size/2, snake.ypos.get(0)+size/2, food.xpos+10, food.ypos+10)<size){ //if snake is on touching food
      color temp=food.moreFood();//make more food
      snake.addLink(temp);//add the food to tail of the snake
    }
  }
}

void getDiff() {  //gets user input to set frame rate
  background(155);
  fill(0);
  textSize(100);
  text("Difficulty", width/4, height/5);
  textSize(65);
  text("Easy 'e'", width/4, 2*height/5);
  text("Medium 'm'", width/4, 3*height/5);
  text("Hard 'h'", width/4, 4*height/5);
  if (keyPressed) {  //if user presses a key
    if (key=='h'||key=='H') { //if they press h frame rate =30, and same method for other settings
      frameRate(30);
      dif=1;                 //checks each key to set dif to reduce glitches if other keys hit
    }
    if (key=='m'||key=='M') {
      frameRate(20);
      dif=1;
    }
    if (key=='e'||key=='E') {
      frameRate(10);
      dif=1;
    }
  }
};