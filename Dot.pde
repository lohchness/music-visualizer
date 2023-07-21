class Dot {
  int xpos, ypos;
  int base_diameter, curr_diameter;
  int xvec, yvec;
  
  Dot() {
    xpos = 0;
    ypos = int(random(HEIGHT + 1));
    
    base_diameter = int(random(10 + 1));
    curr_diameter = base_diameter;
  }
}
