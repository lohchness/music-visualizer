final int MAX_VELOCITY = 1;
final float MAX_DIAMETER = 7.5;

// type 1 dot
final float T1_START_HEIGHT_SPAWN = HEIGHT * 1/3;
final float T1_END_HEIGHT_SPAWN = HEIGHT * 2/3;
final float T1_START_X_SPAWN = -50;
final float T1_Y_VECTOR = .1;

class Dot {
    PVector position = new PVector();
    PVector vector = new PVector();
    
    //float xpos, ypos;
    float base_diameter, curr_diameter;
    //float xvec, yvec;
    
    Dot() {
        
        //float r = random(1);
        position.x = T1_START_X_SPAWN;
        position.y = random(T1_START_HEIGHT_SPAWN, T1_END_HEIGHT_SPAWN);
        
        //xpos= WIDTH / 2 - 100;
        //ypos= HEIGHT / 2;
        
        base_diameter = random(MAX_DIAMETER + 1);
        curr_diameter = base_diameter;
        
        
                // TODO: Randomize start location but make sure it flies across the screen
        
        //vector.x = random(3);
        vector.x = MAX_VELOCITY - map(base_diameter, 0, MAX_DIAMETER + 1, 0, MAX_VELOCITY);
        vector.y = random(-T1_Y_VECTOR, T1_Y_VECTOR);
        //xvec= random(3);
        //yvec= random( - 1, 1);
    }
}
