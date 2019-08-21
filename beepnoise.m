% WarnWave = [ sin(1:.6:400), sin(1:.7:400),sin(1:.15:300)];

WarnWave = [ 0.2*sin(1:.15:300)];
Audio = audioplayer(WarnWave, 22050);
play(Audio);