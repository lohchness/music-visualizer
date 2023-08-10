final int BARS = 63;
final float BASE_THICKNESS = 0.5;
final int BAR_THICKNESS = 4;
final float BAR_MAX_LENGTH = -250;
final int NUM_BARS = 5;


final int startX = 150, startY = 400;

final int BAR_WIDTH = 10;
final int BAR_GAP = 15;
final float DIVIDE_THRESH = 1.01;

final float EASING = 0.2;


void draw_base() {
    strokeWeight(BASE_THICKNESS);
    
    int currx = startX, curry = startY;
    
    for (int i = 0; i < BARS; i++) {
        
        line(currx, curry, currx + BAR_WIDTH, curry);
        
        currx += BAR_GAP;
    }
}

float[] bar_length;
float[] target_length;
float a = (log(20000 - 20) / log(bands));

void draw_bars() {
    
    int currx = startX;
    
    //print(fft.specSize()); // 1025
    //print("\n");
    
    //process specsize to bar_length array
    fill(#ec8c00);

    for (int i = 0; i < fft.specSize(); i++) {

        target_length[int(map(i, 0, fft.specSize(), 0, BARS))] -= abs(fft.getBand(i));
        
        //target_length[int(map(i, 0, fft.specSize(), 0, BARS))] -= sum[int(map(i, 0, fft.specSize(), 0, 30))];
    }
    

    
    
    float counter = 0;
    
    for (int i = 0; i < BARS - 10; i++) {
        
        
        if (target_length[i] < BAR_MAX_LENGTH) {
            target_length[i] = BAR_MAX_LENGTH;
        }
        
        // SHITTY SOLUTION TO A PROBLEM
        // if first bars get average of next bars 
        if (i==0) {
            target_length[0] = (target_length[0] + target_length[3] + target_length[5]) / 4;
        }
        else if (i == 1) {
            target_length[1] = (target_length[1] + target_length[4] + target_length[6]) / 4;
        }
        else if (i == 2) {
            target_length[2] = (target_length[2] + target_length[5] + target_length[7]) / 4;
        }
        
        //if (target_length[i] < BAR_MAX_LENGTH) {
        //    target_length[i] = BAR_MAX_LENGTH;
        //}
        
        
         //increase size of these bars according to sine wave
        if (i > int(BARS * 1/3)) {
            //target_length[i] *= 4;
            //float mapped = map(target_length[i], 0, BAR_MAX_LENGTH, 0, 1);
            //float increased = ((pow(sin(mapped),2))/2)+.5;
            float mult = ((pow(sin(counter),2)) * 2 )+1;
            target_length[i] *= mult;
            counter += .15;
        }
        
        
        float targetX = target_length[i];
        float dx = targetX - bar_length[i];
        bar_length[i] += dx * EASING;
        
        //if (bar_length[i] < BAR_MAX_LENGTH) {
        //    bar_length[i] = BAR_MAX_LENGTH;
        //}
        //bar_length[i] = constrain(bar_length[i], 0, BAR_MAX_LENGTH);
        //print(bar_length[i] + "\n");
        
        
        // draw bars
        
        // bass
        //if (i < 10) {
            
        
        
            
        
        rect(currx, startY, BAR_WIDTH, bar_length[i]);
        //}
        //else{
            //rect(currx, startY, BAR_WIDTH, bar_length[i]);
            
        //}
        currx += 15;
        
        
        target_length[i] = 0;
    }
    
    // draw bars before first one (bass)
    // smooth out left side of the visualizer, looks more like a wave than a slope
    int preX = startX - 15;
    //fill(150);
    
    for (int i=NUM_BARS; i>0; i--) {
        float mapped = (map(bar_length[ NUM_BARS - i ],0,BAR_MAX_LENGTH, 0, 1));
        //float bar_height = ((-(pow((mapped - 1),2))) + 1) * BAR_MAX_LENGTH;
        float bar_height = pow(sin(mapped),2) * BAR_MAX_LENGTH;
        rect(preX, startY, BAR_WIDTH,  bar_height);
        preX -= 15;
    }
    
}
