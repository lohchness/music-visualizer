final int BARS = 63;
final float BASE_THICKNESS = 0.5;
final int BAR_THICKNESS = 4;
final float BAR_MAX_LENGTH = -250;

final int startX = 50, startY = 400;

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
    float extendingLinesMax = 50;
    
    //print(fft.specSize()); // 1025
    //print("\n");
    
    //process specsize to bar_length array
    fill(255);

    for (int i = 0; i < fft.specSize(); i++) {

        target_length[int(map(i, 0, fft.specSize(), 0, BARS))] -= abs(fft.getBand(i));
        
        //target_length[int(map(i, 0, fft.specSize(), 0, BARS))] -= sum[int(map(i, 0, fft.specSize(), 0, 30))];
    }
    
    
    //for (int i=0; i<fft.avgSize(); i++) {

        
    //    //float freq = pow(i,a) + 20;
    //    //float freq = 
        
        
    //    float amp = fft.getAvg(i);
        
    //    float bandDB = 20 * log(2 * amp / fft.timeSize());
        
    //    target_length[int(map(i, 0, bands, 0, BARS))] -= map(bandDB, 0, -150, 0, height);
        
    //}
    

    
    for (int i = 0; i < BARS; i++) {
        
        if (target_length[i] < BAR_MAX_LENGTH) {
            target_length[i] = BAR_MAX_LENGTH;
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
}
