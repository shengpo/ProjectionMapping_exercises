/*
了解如何使用texture及PGraphics之後，
試著建立自己的mapper class來簡化程式敘述，並使得mapping程式更加彈性化
*/

/*
buildMapperClass02範例:
- 建立一個影像來源的class，並使用Mapper class
*/


Mapper mapper = null;
RotatingBox rotatingBox = null;    //作為影像來源


void setup(){
    size(800, 600, P3D);

    //設定影像來源
    rotatingBox = new RotatingBox();
    
    //設定Mapper
    mapper = new Mapper(50, 30, 400, 50, 400, 400, 50, 550);
}


void draw(){
    background(0);
    
    //將取得的影像來源放入Mapper中做texture
    mapper.render(rotatingBox.getCurrentImage());
}

