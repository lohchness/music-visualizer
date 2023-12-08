# music-visualizer
WIP Processing project for a music visualizer

[![](https://img.youtube.com/vi/5qB2VDdLEVU/hqdefault.jpg)](https://www.youtube.com/embed/5qB2VDdLEVU)

___

Music visualizer in the style of Monstercat videos.

 - Bars roughly corresponds to spectrum created by the FFT
   - Overall values tweaked and capped so the spectrum is not entirely skewed to the lower side
   - Includes extra bars before the lower side of the spectrum so that it is not a slope; it is more like a wave instead (values determined by left side)
   - Bars around halfway onwards increased in size slightly based on a function to be on level with bars in lower side of spectrum
 - Balls move along to the music!
   - Moves faster with volume
   - Pulses with the beat
   - Smaller dots = faster velocity
 
___

## Update 3 & 4

Dots:

 - Is now blurry (woo!)
 - Improved initial vector X, now travels to the right more than vertically
 - Decrease maximum diameter of dots
 - Increased ceiling and floor of min and max velocity

Spray:

 - Improved velocity sensitivity to sound
 - Increased spawn rate

Lines:

 - Increase sentivity of latter part of bars to music
 - Moved bars upwards to fit title in

Todo:

 - Add title in space
 - Figure out how to get the first half of the spectrum data
  - smooth first spectrum data of first few bars
 - Lines at bar base
 - Improve velocity and spawn algorithm - tweak spawn dot rate, angle of larger/slower dots
   - Increase spawn rate with rate of dot removal / sound / speed of dots?
 - Spawn dots in other areas of the screen - rare


___



