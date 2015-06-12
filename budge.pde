class Budge {
  //all the variables
  float salary = 0;
  float Elect = 0;
  float Mortgage = 0;
  float Gas = 0;
  float Water = 0;
  float Clear = 0;
  float Food = 0;
  float sum = 0;
  float Travel = 0;
  float TV = 0;
  //this calculates the total cost by adding everything together
  float getTotalCost()
  {
    return Mortgage + Elect + Gas + Water + Food + Travel + TV;
  }
  //this is to calculate how much money the user has left after expendeture
  float getAmountLeft()
  {
    return salary - getTotalCost();
  }

  void draw() {
    pushMatrix();
    //this is for the 
    textAlign(CENTER);
    textSize(30);
    String b = "Monthly Budget"; 
    fill(255);
    text(b, 770, 110); //displays intro message
    popMatrix();
  }
  void keyPressed() {
    // alt+shift+l to load properties
    // alt+shift+s to save properties
    // if 1 is pressed all the data on the monthly budget is saved
    if (key=='1') {
      cp5.saveProperties(("Budge.properties"));
    } 
    //and if 2 is pressed, the saved data is displayed
    else if (key=='2') {
      cp5.loadProperties(("Budge.properties"));
    }
  }
}
