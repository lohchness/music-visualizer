class Dot {
    PVector position;
    PVector vector;
    
    float xpos, ypos;
    float base_diameter, curr_diameter;
    float xvec, yvec;
    
    Dot() {
        xpos= WIDTH / 2 - 100;
        ypos= HEIGHT / 2;
        
        base_diameter = random(10 + 1);
        curr_diameter = base_diameter;
        
        
        // TODO: Make bigger particles travel slower and smaller particles travel faster
        // TODO: Randomize start location but make sure it flies across the screen
        xvec= random(3);
        yvec= random( - 1, 1);
    }
}
