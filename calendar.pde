class Calandar {

  // array of the number of days in a month
  int [] dayOfMonths= {
    31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
  };
  // array of the names in the week
  String [] weekDay= {
    "Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"
  };

  // string of 
  String [] monthString= {
    "January", "February", "March", "April", "May", "June", "July", "August", 
    "September", "October", "November", "December"
  };
  //variables
  int year, month, weekDayFor1st;
  // this is for the leap year a
  //  boolean drawn=false;
  Calandar() {
    //background colour
    background(255);
  }

  void draw() {

    year= year(); 
    month= month();
    weekDayFor1st=getWeekDay();

    //function to determine leap year
    if (leapYear())
      dayOfMonths[1]=29;// 1 means february, and it has 29 days
    drawDates();
  }
  //this is to calculate the weekday of the current month, 
  // http://www.javaiq.net/examples/date/Nth-Week-Day-Of-The-Month-Finder-java-code.htm
  int getWeekDay() {
    int a = (int)floor((14 - month) / 12);
    int y = year - a;
    int m = month + 12 * a - 2;
    int d = (1 + y + (int)floor(y / 4) - (int )floor(y / 100) +
      (int)floor(y / 400) + (int)floor((31 * m) / 12))  % 7;
    //orgionally the first day (0) is a sunday 
    //to start on monday value "d" needs to be changed so it starts on monday
    if (d==0)
      d= 6;

    else if (d==1 )
      d= 0; 

    else if (d== 2)
      d= 1;

    else if (d== 3)
      d= 2;

    else if (d== 4)
      d= 3;

    else if (d== 5)
      d= 4;

    else if (d == 6)
      d= 5;
    return d;
  }
  //this if statement is to determine if the year is a leap year
  boolean leapYear() {
    if ((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
      return true;
    else
      return false;
  }
  /*   
   void drawTitle() {
   pushMatrix();
   textSize(32);
   textAlign(CENTER);
   //displays the current month from the array above at the top of the screen
   text(monthString[month-1]+" "+year, width/2, 40);
   popMatrix();
   }
   */
  void drawDates() {
    pushMatrix();
    textAlign(CENTER);
    //this for loop drwas the weekdays underneeth the month and year
    for (int i=0;i<weekDay.length;i++) {
      textSize(20);
      fill(255);
      text(weekDay[i], 270+(i*50), 100);
    }
    //declared the local variables here
    int counterDay=1, i, j=0;

    i=weekDayFor1st;
    //i is horizontal and j is for vertical and when i is 7 it changes to next week
    do {
      textSize(16);
      //this draws the red rectangle around the date
      if ( counterDay == day() )
      {
        stroke(255, 0, 0);
        fill(0);
        rect(255+(i*50), 128+(j*30), 30, 30);
      }
      else
      {
        stroke(0);
      }
      fill(255);
      text(counterDay, 270+(i*50), 150+(j*30));
      counterDay++;
      i++;
      //this is to calculate up to 7 days and then move to the next row
      if (i==7) {
        i=0;
        j++;
      }
    }
    // it will draw the days untill the end of the number of days of that month
    while (counterDay<=dayOfMonths[month-1]);
    popMatrix();
  }
}
