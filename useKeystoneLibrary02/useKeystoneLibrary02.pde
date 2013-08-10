/*
使用keystone這個library來處理四邊形的projection mapping
*/

/*
useKeystoneLibrary02範例:
- 做多個texture-mapping
*/


import deadpixel.keystone.*;


Keystone ks;
CornerPinSurface surface1;
CornerPinSurface surface2;

RotatingBox rotatingBox1;
RotatingBox rotatingBox2;


void setup() {
    size(800, 600, P3D);

    ks = new Keystone(this);
    
    surface1 = ks.createCornerPinSurface(400, 300, 20); 
    surface2 = ks.createCornerPinSurface(400, 300, 20); 

    rotatingBox1 = new RotatingBox();
    rotatingBox2 = new RotatingBox();
}

void draw() {
    background(0);

    //這邊要注意的是，getTransformedMouse()是將原本的滑鼠座標對應至每個CornerPinSurface中
    //因此滑鼠原始座標是共用的，然後分別被轉換至兩個CornerPinSurface中
    PVector surfaceMouse1 = surface1.getTransformedMouse();
    PVector surfaceMouse2 = surface2.getTransformedMouse();

    //一開始兩個CornerPinSurface會重疊，需先做calibration(此範例中按c鍵)將其分開
    surface1.render(rotatingBox1.offscreenDraw(surfaceMouse1.x, surfaceMouse1.y));
    surface2.render(rotatingBox2.offscreenDraw(surfaceMouse2.x, surfaceMouse2.y));
}

void keyPressed() {
    switch(key) {
    case 'c':
        ks.toggleCalibration();
        break;
    }
}




