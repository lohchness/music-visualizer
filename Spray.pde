class Spray {
    ArrayList<Dot> dots;
    
    Spray() {
        dots= new ArrayList<Dot>();
    }
    
    void addDot(Dot dot) {
        dots.add(dot);
    }
    
    void removeDot(Dot dot) {
        dots.remove(dot);
    }
    
}


void sprayDots() {
    if (frameCount % 10 == 0) {
        spray.addDot(new Dot()); 
    }
    float curr_level = track.mix.level();
    
    for (Dot dot : spray.dots) {
        
        fill(255);
        ellipse(dot.position.x, dot.position.y, dot.curr_diameter, dot.curr_diameter);
        //dot.position.add( dot.vector );
        dot.position.x += dot.vector.x * (curr_level + 1.2);
        dot.position.y += dot.vector.y * (curr_level + 1.2);
        
        if (dot.curr_diameter > dot.base_diameter) {
            dot.curr_diameter -= 0.05;
        }
        
        //if (beat.isRange(5, 15, 2)) {
        //if (beat.isKick() || beat.isHat() || beat.isSnare()) {
        if (beat.isOnset()) {
            dot.curr_diameter = dot.base_diameter * 1.25;                        
        }
        
        
    }
    
    
    //clean up
    for (int i = 0; i < spray.dots.size(); i++) {
        if (spray.dots.get(i).position.x> WIDTH || spray.dots.get(i).position.y > HEIGHT) {
            spray.removeDot(spray.dots.get(i));
            //i--;
        }
    }
    
}
