//import processing.sound.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

final int WIDTH = 500, HEIGHT = 500;
String audioFileName = "spaceplusone.mp3"; 
float fps = 60;
float smooth_factor = .25;

// Global variables
AudioPlayer track;
FFT fft;
Minim minim;

// General
int bands = 256; // must be multiple of two
float[] spectrum = new float[bands];
float[] sum = new float[bands];

// Graphics
float unit;
int groundLineY;
PVector center;

void settings() {
  size(WIDTH, HEIGHT);
  smooth(8); // if errors reduce to 4 or 3 (default)
}

void setup() {
  //size(WIDTH, HEIGHT);
  frameRate(fps);
  
  // graphics
  unit = height / 100;
  strokeWeight(unit / 10.24);
  groundLineY = height * 3/4;
  center = new PVector(width / 2, height * 3/4);
  
  minim = new Minim(this);
  track = minim.loadFile(audioFileName, 2048);
  
  track.loop();
  
  fft = new FFT( track.bufferSize(), track.sampleRate() );
  
  fft.linAverages(bands);
  
  //track.cue(60000);
  
}


void draw() {
  fft.forward(track.mix);
 
  spectrum = new float[bands];
 
  for(int i = 0; i < fft.avgSize(); i++)
  {
    spectrum[i] = fft.getAvg(i) / 2;
 
    // Smooth the FFT spectrum data by smoothing factor
    sum[i] += (abs(spectrum[i]) - sum[i]) * smooth_factor;
  }
 
  // Reset canvas
  //fill(0);
  //noStroke();
  //rect(0, 0, width, height);
  //noFill();
 
  //drawAll(sum);
}

int sphereRadius;

//float spherePrevX;
//float spherePrevY;

//int yOffset;

//boolean initialStatic = true;
//float[] extendingSphereLinesRadius;


void drawAll(float[] sum) {
  
}
