# music-visualizer
WIP Processing project for a music visualizer



https://github.com/lohchness/music-visualizer/assets/50405970/3fccdef7-e3b3-41bf-8190-21b8c788306c



 - Bars roughly corresponds to spectrum created by the FFT
   - Overall values tweaked and capped so the spectrum is not entirely skewed to the lower side
   - Includes extra bars before the lower side of the spectrum so that it is not a slope; it is more like a wave instead (values determined by left side)
   - Bars around halfway onwards increased in size slightly based on a function to be on level with bars in lower side of spectrum
 - Balls move along to the music!
   - Moves faster with volume
   - Pulses with the beat
   - Smaller dots = faster velocity

TODO:
 - Improve spawning algorithm - tweak spawn dot rate, angle of larger/slower dots
 - Spawn dots in other areas of the screen - rare
 - Dot opacity/smoothness
 - Better lower spectrum smoothing
 - Lines at bar base
 - Titles
