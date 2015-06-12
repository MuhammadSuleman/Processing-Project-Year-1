//importing libraries
import controlP5.*;
import java.io.*;
PFont font;

// declaring the classes
Calandar cal;
Clock clock;
Pad pad;
Budge budge;
ControlP5 cp5;

//creating a string for the text
String textT = "";
void setup() {

  fill(255, 0, 0);
  font = loadFont("AppleMyungjo.vlw");
  textAlign(LEFT);

  //setting the size and initialising the classes
  size (950, 600);
  background(0);
  smooth();
  //initialising the classes
  clock = new Clock();
  cal=new Calandar();
  pad = new Pad();
  budge = new Budge();
  //initialising control p5
  cp5 = new ControlP5(this);
  
  //this is the salary bar
  cp5.addSlider("salary")
    .setPosition(870, 135)
      .setSize(40, 365)
        .setRange(0, 10000)
          ;
  // this is a vertical mortgage slider

  cp5.addSlider("Mortgage")
    .setPosition(650, 135)
      .setSize(200, 20)
        .setRange(0, 5000)
          .setValue(0)
            ;
  // this repositions the Label for controller 'slider'
  cp5.getController("Mortgage").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("Mortgage").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);


  //.setNumberOfTickMarks(21)
  //this is the electricity slider
  cp5.addSlider("Elect")
    .setPosition(820, 175)
      .setSize(20, 100)
        .setRange(0, 500)
          //.setNumberOfTickMarks(21)
          ;
  //this is the water slider
  cp5.addSlider("Water")
    .setPosition(740, 175)
      .setSize(20, 100)
        .setRange(0, 500)
          //.setNumberOfTickMarks(21)
          ;
  //this is the gas slider
  cp5.addSlider("Gas")
    .setPosition(650, 175)
      .setSize(20, 100)
        .setRange(0, 500)
          //.setNumberOfTickMarks(21)
          ;

  //this is the food slider
  cp5.addSlider("Food")
    .setPosition(650, 295)
      .setSize(200, 20)
        .setRange(0, 500)
          .setValue(0)
            ;
  // this repositions the Label for controller 'slider'
  cp5.getController("Food").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("Food").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  //this is the travel slider
  cp5.addSlider("Travel")
    .setPosition(650, 335)
      .setSize(200, 20)
        .setRange(0, 500)
          .setValue(0)
            ;
  // this repositions the Label for controller 'slider'
  cp5.getController("Travel").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("Travel").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  //this is the tv slider
  cp5.addSlider("TV")
    .setPosition(650, 375)
      .setSize(200, 20)
        .setRange(0, 500)
          .setValue(0)
            ;
  // this repositions the Label for controller 'slider'
  cp5.getController("TV").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("TV").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);

  //this is tge clear button
  cp5.addButton("Clear All")
    .setValue(0)
      .setPosition(650, 415)
        .setSize(200, 50)
          ;
  //this is the salary spent vertical slider
  cp5.addSlider("salary spent")
    .setPosition(650, 480)
      .setSize(200, 20)
        .setRange(0, 10000)
          .setValue(0)
            .isLock()

              ;
  // this repositions the Label for controller 'slider'
  cp5.getController("salary spent").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("salary spent").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);


  cp5.addSlider("Amount left")
    .setPosition(650, 520)
      .setSize(260, 30)
        .setRange(-8000, 10000)
          .setValue(0)
            .setSliderMode(Slider.FIX)
              .setUserInteraction(false)
                ;
  // this repositions the Label for controller 'slider'              
  cp5.getController("Amount left").getValueLabel().align(ControlP5.RIGHT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
  cp5.getController("Amount left").getCaptionLabel().align(ControlP5.LEFT, ControlP5.BOTTOM_OUTSIDE).setPaddingX(0);
}
void draw()
{
  //this is to change the colour of the following sliders
  cp5.controller("Clear All").setColorBackground(#610B0B);
  cp5.controller("salary").setColorBackground(#610B0B);
  cp5.controller("Amount left").setColorBackground(#858A83);



  // calling the draw function 
  drawLayout();
  cal.draw();
  clock.draw();
  pad.draw();
  mousePressed();
  pad.keyPressed();
  budge.draw();
  // budge.slider();
  budge.keyPressed();
  //this is for the text on the screen
  textAlign(LEFT);
  fill(255, 0, 0);
  textFont(font, 20);
  //this is for the _ that apears while your writig and the position of it
  text(textT+(frameCount/10 % 3 == 2 ? "-" : ""), 150, 340, 355, 200);
}

//this is the controller for managing the budget
void controlEvent(ControlEvent theEvent) {

  if (theEvent.isController()) {
    //println(theEvent.getName());
    //these else and if statements  are to control the salary spent and amount left sliders
    if (theEvent.controller().name()=="Mortgage")
    {
      //sets the value of the Mortgage variable in the Budge class
      budge.Mortgage = theEvent.controller().value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    else if (theEvent.controller().name()=="Gas")
    {
      //sets the value of the Gas variable in the Budge class
      budge.Gas = theEvent.controller().value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    else if (theEvent.controller().name()=="salary")
    {
      //sets the value of the salary variable in the Budge class
      budge.salary = cp5.controller("salary").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    else if (theEvent.controller().name()=="Elect")
    {
      //sets the value of the elect variable in the Budge class
      budge.Elect = cp5.controller("Elect").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    else if (theEvent.controller().name()=="Water")
    {
      //sets the value of the water variable in the Budge clas
      budge.Water = cp5.controller("Water").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    else if (theEvent.controller().name()=="Food")
    {
      //sets the value of the food variable in the Budge clas
      budge.Food = cp5.controller("Food").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }

    else if (theEvent.controller().name()=="Travel")
    {
      //sets the value of the travel variable in the Budge clas
      budge.Travel = cp5.controller("Travel").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }

    else if (theEvent.controller().name()=="TV")
    {
      //sets the value of the tv variable in the Budge clas
      budge.TV = cp5.controller("TV").value();
      //and gets the value from total spent in the budge class and sets the value of salary spent to that
      cp5.controller("salary spent").setValue( budge.getTotalCost() );
      //this gets the amount left from the budge class and sets the value of amount left to that
      cp5.getController("Amount left").setValue( budge.getAmountLeft() );
    }
    //this button clears all the filds once clicked
    else if ( theEvent.controller().name()=="Clear All")
    {
      //it resets all the values to zero
      cp5.controller("salary spent").setValue( 0 );
      cp5.getController("Amount left").setValue( 0 );
      cp5.getController("salary").setValue( 0 );
      cp5.getController("Elect").setValue( 0 );
      cp5.getController("Water").setValue( 0 );
      cp5.getController("Mortgage").setValue( 0 );
      cp5.getController("Food").setValue( 0 );
      cp5.getController("TV").setValue( 0 );
      cp5.getController("Gas").setValue( 0 );
      cp5.getController("salary spent").setValue( 0 );
      cp5.getController("Travel").setValue( 0 );
    }
  }
} 

void drawLayout() {
  //the lay out of the page
  pushMatrix();
  background(0);
  fill(2, 52, 77);
  rect(0, 0, 950, 50);
  textAlign(CENTER);
  textSize(40);
  //this is the title of the calendar
  String sCal = "The Human Schedule"; 
  fill(255);
  text(sCal, width/2, 40); //displays intro message
  popMatrix();
}

void keyPressed() {

  //this is for the user input
  //if backspace is pressed 
  if (keyCode == BACKSPACE) {
    if (textT.length() > 0) {
      //it takes one character away from the string
      textT = textT.substring(0, textT.length()-1);
    }
  }

  //if delete is pressed it emptys the strin 
  else if (keyCode == DELETE) {

    textT = "";
  }

  else if (keyCode != SHIFT && keyCode != CONTROL && keyCode != ALT) {
    //println(textT);
    textT = textT + key;
  }
}
