/*
要做projection mapping, 最基本必須了解texture原理
基本要了解的function有：
- texture()
- textureMode()
- textureWrap()

useTexture系列範例修改自Processin官網的reference, 以及Processing本身的TextureQuad範例
*/

/*
useTexture01範例:
- 示範texture的基本用法
*/


PImage img = null;

void setup(){
    size(400, 400, P3D);
    img = loadImage("berlin-1.jpg");    //載入一張圖片作為貼圖的紋理(texture)用
}


void draw(){
    background(0);

    noStroke();    //若不noStroke()則會出現描邊(例如當背景為白色時, 出現黑色描邊)
    beginShape();    //使用beginShape()+endShape()+vertex()來畫出texture要貼上的範圍
    texture(img);    //設定texture為img
                     //以四個點(vertex)來指定texture的範圍 (texture的四個角落位置)
                     //這邊vertex()的參數用法為：前面2~3個參數為texture某個角落的指定位置, 最後兩個參數為所要貼的圖(img)的相對應角落座標
                     //角落依序"必須"為左上角 -> 右上角 -> 右下角 -> 左下角 才能畫出正規的四邊形
    vertex(10, 20, 0, 0, 0);                    //左上角
    vertex(300, 5, 0, img.width, 0);            //右上角
    vertex(330, 280, 0, img.width, img.height); //右下角
    vertex(40, 160, 0, 0, img.height);          //左下角
    endShape();
}
