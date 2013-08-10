/*
mappingtools library可以讓使用者做出四邊形(Quad)、貝茲曲面形(Bezier)、自由面(free)等texture-mapping功能
這邊將練習使用mappingtools library
 
此範例修改自mappingtools library的QuadWarp_img範例以及MULTI_QuadWarp_controlSprites範例
*/

/*
useMappingtoolsLibrary02範例:
- 同時使用兩個QuadWarp class
*/


/*
mappingtools library預設支援以下按鍵功能：
- 按鍵 c ： 顯示/隱藏控制點                                            (注意！同時使用多個QuadWarp class時，僅此功能能正常使用)
- 按鍵 d ： reset控制點為預設值                                        (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 s ： 將控制點位置記錄下來，在sketch所在位置儲存成presets.txt檔     (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 p ： 載入先前所儲存的控制點位置(presets.txt檔)                    (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
*/


import mappingtools.*;


QuadWarp qw1;
QuadWarp qw2;

//用來紀錄QuadWarp四周的控制點
PVector[] controlSprites1 = new PVector[4];
PVector[] controlSprites2 = new PVector[4];

PImage img;


void setup() {
    size(640, 480, P3D);
    img = loadImage("scotland.tif");

    qw1 = new QuadWarp(this, 10); 
    qw2 = new QuadWarp(this, 10);     

    //設定qw1的四個控制點的初始值
    controlSprites1[0] = new PVector(100, 100);    //左上角
    controlSprites1[1] = new PVector(200, 100);    //右上角
    controlSprites1[2] = new PVector(200, 200);    //右下角
    controlSprites1[3] = new PVector(100, 200);    //左下角

    //設定qw2的四個控制點的初始值
    controlSprites2[0] = new PVector(400, 100);    //左上角
    controlSprites2[1] = new PVector(500, 100);    //右上角
    controlSprites2[2] = new PVector(500, 200);    //右下角
    controlSprites2[3] = new PVector(400, 200);    //左下角
    
    //設定控制點    
    qw1.controlSprites(controlSprites1);
    qw2.controlSprites(controlSprites2);
}


void draw() {
    background(0);

    qw1.render(img);
    qw2.render(img);
}

