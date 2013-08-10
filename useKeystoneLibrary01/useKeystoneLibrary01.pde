/*
使用keystone這個library來處理四邊形的projection mapping
 
 此範例修改自keystone library的CornerPin範例
*/

/*
useKeystoneLibrary01範例:
- 練習使用keystone library
*/


import deadpixel.keystone.*;


Keystone ks;                //Keystone class為keystone library最主要的class
CornerPinSurface surface;   //CornerPinSurface class為四個角落可以動態調整的texture-mapping class

PGraphics offscreen;        //設定off-screen繪圖區


void setup() {
    size(800, 600, P3D);    //keystone僅能運作在P3D或OPENGL兩個render之下

    ks = new Keystone(this);    //建立Keystone物件, 參數需傳入此sketch本身物件 (this)，也就是PApplet物件
    surface = ks.createCornerPinSurface(400, 300, 20);    //透過Keystone的createCornerPinSurface()建立可動態調整的texture-mapping物件
                                                          //前面兩個參數為texture的width和height
                                                          //第三個參數為texture的grid數，數值越高越精密 (運算量也越大)

    //這邊讓off-screen繪圖區的大小跟上面的CornerPinSurface一樣
    //可以試試看使用不一樣的width跟height，會有意外的效果 (類似範例useTexture03中，使用textureMode(CLAMP)的效果)
    offscreen = createGraphics(400, 300, P3D);
}

void draw() {
    //將在surface範圍中的滑鼠座標，轉換成對應至surface所形成的texture範圍中的座標
    //這對於想在surface範圍中做滑鼠互動式很有用的
    PVector surfaceMouse = surface.getTransformedMouse();

    //繪製off-screen圖形
    offscreen.beginDraw();
    offscreen.background(255);
    offscreen.fill(0, 255, 0);
    offscreen.pushMatrix();
    offscreen.translate(surfaceMouse.x, surfaceMouse.y, 0);
    offscreen.rotateX(radians(frameCount%360+7));
    offscreen.rotateY(radians(frameCount%360));
    offscreen.noFill();
    offscreen.stroke(0);
    offscreen.box(50);
    offscreen.popMatrix();
    offscreen.endDraw();

    background(0);
    //做texture mapping
    surface.render(offscreen);
}

void keyPressed() {
    switch(key) {
    case 'c':
        //啟動或關閉調整四個角落的功能
        ks.toggleCalibration();
        break;

    case 'l':
        //將上一次儲存的ConrnerPinSurface的四個角落狀態載入
//        ks.load();    //目前keystone library (version 004)的save()跟load()有問題，無法work
        break;

    case 's':
        //將目前的ConrnerPinSurface的四個角落狀態儲存下來
//        ks.save();    //目前keystone library (version 004)的save()跟load()有問題，無法work
        break;
    }
}

