/*
mappingtools library可以讓使用者做出四邊形(Quad)、貝茲曲面形(Bezier)、自由面(free)等texture-mapping功能
這邊將練習使用mappingtools library
 
此範例修改自mappingtools library的QuadWarp_img範例
*/

/*
useMappingtoolsLibrary01範例:
- 練習使用mappingtools library最基本的QuadWarp class
*/


/*
mappingtools library預設支援以下按鍵功能：
- 按鍵 c ： 顯示/隱藏控制點
- 按鍵 d ： reset控制點為預設值
- 按鍵 s ： 將控制點位置記錄下來，在sketch所在位置儲存成presets.txt檔
- 按鍵 p ： 載入先前所儲存的控制點位置(presets.txt檔)
*/


import mappingtools.*;


QuadWarp qw;    //for 四邊形的texture-mapping
PImage img;


void setup() {
    size(640, 480, P3D);    //mappingtools library僅能在OPENGL相關的render下運作，例如：P2D, P3D, OPENGL ...等。
                            //預設的JAVA2D render是無法正常地運行mappingtools library的

    img = loadImage("scotland.tif");

    qw = new QuadWarp(this, 10);    //第一個參數指的是此sketch本身的物件(即PApplet)，第二個參數為grid解析度(供texture變形計算用，grid越高計算量越大，但也越細緻)
}


void draw() {
    background(0);

    qw.render(img);    //將影像來源送給QuadWarp.render()做texture-mapping運算
}

