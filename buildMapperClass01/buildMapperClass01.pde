/*
了解如何使用texture及PGraphics之後，
試著建立自己的mapper class來簡化程式敘述，並使得mapping程式更加彈性化
*/

/*
buildMapperClass01範例:
- 示範建立簡易的Mapper class
*/


Mapper mapper1 = null;
Mapper mapper2 = null;

PGraphics pg1 = null;
PGraphics pg2 = null;


void setup(){
    size(800, 600, P3D);
    
    //設定off-screen繪圖區
    pg1 = createGraphics(400, 300, P3D);
    pg2 = createGraphics(400, 300, P3D);
    
    //設定Mapper
    mapper1 = new Mapper(10, 30, 400, 250, 400, 350, 10, 550);
    mapper2 = new Mapper(400, 250, 790, 30, 790, 550, 400, 350);
    
    //設定textureMode()
    textureMode(NORMAL);
}


void draw(){
    background(0);

    //設置動態內容的off-screen
    computerPg1();
    computerPg2();
    
    //進行texture貼圖
    mapper1.render(pg1);
    mapper2.render(pg2);
}

void computerPg1(){
    pg1.beginDraw();
    pg1.background(255);
    pg1.stroke(0);
    pg1.fill(255, 0, 0);
    pg1.pushMatrix();
    pg1.translate(pg1.width/2, 100, 0);
    pg1.rotateX(radians(frameCount%360+7));
    pg1.rotateY(radians(frameCount%360));
    pg1.box(50);
    pg1.popMatrix();
    pg1.endDraw();
}

void computerPg2(){
    pg2.beginDraw();
    pg2.background(255);
    pg2.stroke(255, 0, 0);
    pg2.fill(255, 255, 0);
    pg2.pushMatrix();
    pg2.translate(pg2.width/2, 230, 0);
    pg2.rotateY(radians(frameCount%360));
    pg2.sphere(50);
    pg2.popMatrix();
    pg2.endDraw();
}

