/*
了解如何使用texture之後，
若要在一個畫面(一個投影 or 一個投影機)中作多個texture，且每個texture內容皆不同的話
則必須使用off-screen繪圖的技巧
其中一個最簡單的方式，便是使用 PGraphics

usePGraphics系列範例修改自Processin官網的reference
*/

/*
usePGraphics02範例:
- 示範多個texture，多個PGraphics
*/


PGraphics pg1 = null;
PGraphics pg2 = null;
PGraphics pg3 = null;

PImage dragonball = null;
PImage ironman = null;
PImage luffy = null;


void setup(){
    size(800, 600, P3D);
    
    //載入圖片
    dragonball = loadImage("dragonball.jpg");
    ironman = loadImage("ironman.jpg");
    luffy = loadImage("luffy.jpg");

    //設定off-screen繪圖區
    pg1 = createGraphics(400, 300, P2D);
    pg2 = createGraphics(300, 400, P2D);
    pg3 = createGraphics(300, 300, P3D);
    
    //設定靜態內容的off-screen
    pg2.beginDraw();
    pg2.image(dragonball, 0, 0, pg2.width, pg2.height);
    pg2.endDraw();
    
    //設定textureMode()
    textureMode(NORMAL);
}


void draw(){
    background(0);

    //設置動態內容的off-screen
    pg1.beginDraw();
    if(frameCount%100 < 50){
        pg1.image(ironman, 0, 0, pg1.width, pg1.height);
    }else{
        pg1.image(luffy, 0, 0, pg1.width, pg1.height);
    }
    pg1.endDraw();
    
    pg3.beginDraw();
    pg3.background(200);
    pg3.stroke(0);
    pg3.fill(255, 0, 0);
    pg3.pushMatrix();
    pg3.translate(pg3.width/2, pg3.height/2, 0);
    pg3.rotateX(radians(frameCount%360+7));
    pg3.rotateY(radians(frameCount%360));
    pg3.box(100);
    pg3.popMatrix();
    pg3.endDraw();
    
    //進行texture貼圖
    beginShape();
    texture(pg1);
    vertex(10, 20, 0, 0);
    vertex(150, 5, 1, 0);
    vertex(300, 200, 1, 1);
    vertex(40, 300, 0, 1);
    endShape();

    beginShape();
    texture(pg2);
    vertex(400, 50, 0, 0);
    vertex(750, 100, 1, 0);
    vertex(680, 400, 1, 1);
    vertex(430, 500, 0, 1);
    endShape();

    beginShape();
    texture(pg3);
    vertex(44, 316, 0, 0);
    vertex(378, 226, 1, 0);
    vertex(398, 564, 1, 1);
    vertex(44, 576, 0, 1);
    endShape();
}

