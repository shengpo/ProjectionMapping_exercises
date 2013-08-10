/*
了解如何使用texture及PGraphics之後，
試著建立自己的mapper class來簡化程式敘述，並使得mapping程式更加彈性化
*/

/*
buildMapperClass03範例:
- 利用滑鼠調整Mapper的四個角落位置
*/


Mapper mapper = null;
RotatingBox rotatingBox = null;    //作為影像來源


void setup(){
    size(800, 600, P2D);

    //設定影像來源
    rotatingBox = new RotatingBox();
    
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
    mapper.render(rotatingBox.getCurrentImage());
}

