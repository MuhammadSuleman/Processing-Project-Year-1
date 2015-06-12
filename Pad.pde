class Pad {
  PrintWriter output;
  BufferedReader reader;
  String line;




  Pad () {
    pushMatrix();
    //      reader = createReader("notes.txt"); 
    //
    //  String line; 
    //  boolean lineFound = false;
    //  //using try and catch method to read in the lines
    //  try {
    //    do {
    //      line = reader.readLine();
    //      if (line.length() > 0) {
    //        println("line: " + line);
    //        lineFound = true;
    //      }
    //    }
    //    //if there are still lines in the txt file the while loop carries on running
    //    while ( line != null && !lineFound);
    //  } 
    //  catch (IOException e) {
    //    e.printStackTrace();
    //    line = null;
    //    exit();
    //  }

    //this reads out the data from the sketch
    output = createWriter("notes.txt");


    reader = createReader("notes.txt"); //<>//
    //println(reader);

    //print(reader.readLine());
    String line;
    try {
      line = reader.readLine();
    } 
    catch (IOException e) {
      e.printStackTrace();
      line = null;
    }

    output = createWriter("notes.txt");
    popMatrix();
  }


  void draw() {

    pushMatrix();
    fill(255);
    rect(80, 300, 490, 250, 5);

    for (int i=360; i < 530; i = i+32) {
      {
        fill(0);
        line (150, i, 500, i );
      }
    }
    textAlign(CENTER);
    textSize(30);
    String Notes = "Notes"; 
    fill(2, 52, 77);
    text(Notes, 315, 330); //displays intro message
    popMatrix();
  }

  void keyPressed() {

    //this is to store the user input 
    if (key == '1')
    {
      output.println(textT + "\n");
      output.flush(); // Writes the remaining data to the file
      output.close(); // Finishes the file
      exit(); // Stops the program
    }
  }
}
