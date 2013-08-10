/*
了解如何使用texture及PGraphics之後，
試著建立自己的mapper class來簡化程式敘述，並使得mapping程式更加彈性化

此範例的PlayVideo class修改自Processing本身的Video/Movie/Loop範例
*/

/*
buildMapperClass04範例:
- 播放影片 + Mapper class
*/


import processing.video.*;


Mapper mapper = null;
PlayVideo playVideo = null;

void setup(){
    size(800, 600, P2D);

    //設定影像來源
    playVideo = new PlayVideo(this);
    
    //設定Mapper
    mapper = new Mapper(50, 30, 400, 50, 400, 400, 50, 550);
}


void draw(){
    background(0);
    
    //當滑鼠左鍵按下時，可調整離滑鼠最近的Mapper角落位置
    if(mousePressed){
        mapper.showCorners();
        mapper.updateCorner(mouseX, mouseY);
    }
    
    //將取得的影像來源放入Mapper中做texture
    mapper.render(playVideo.getCurrentImage());
}

