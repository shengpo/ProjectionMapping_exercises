/*
要做projection mapping, 最基本必須了解texture原理
基本要了解的function有：
- texture()
- textureMode()
- textureWrap()

useTexture系列範例修改自Processin官網的reference, 以及Processing本身的TextureQuad範例
*/

/*
useTexture03範例:
- 示範textureWrap()的用法
*/


PImage img = null;

void setup(){
    size(400, 400, P3D);
    img = loadImage("berlin-1.jpg");    //載入一張圖片作為貼圖的紋理(texture)用
    textureMode(NORMAL);    //將圖片(img)的四個角落座標以正規化表示，依序為：左上角(0, 0) -> 右上角(1, 0) -> 右下角(1, 1) -> 左下角(0, 1) 
}


void draw(){
    background(0);
    
    if (mousePressed) {
        textureWrap(REPEAT);     //會將圖片(img)重複貼圖, 重複原則由四個vertex()的最後兩個參數決定
    } else {
        textureWrap(CLAMP);    //圖片(img)僅會貼一次，若不特別指定textureWrap()的話，CLAMP為預設模式
                               //若使用這個模式，且四個vertex()的最後兩個參數不是(0, 0), (1, 0), (1, 1), (0, 1)的話，
                               //則圖片(ig)除了在第一個貼圖位置正常之外，其他貼圖位置皆是該圖片週邊的延伸
                               //實際執行看看這個sketch，看看差別吧！
    }
    
    noStroke();
    beginShape();
    texture(img);
    //以下vertex()最後兩個參數的寫法，在REPEAT模式下，將會形成2x2的貼圖
    vertex(10, 20, 0, 0, 0);
    vertex(300, 5, 0, 2, 0);
    vertex(330, 280, 0, 2, 2);
    vertex(40, 160, 0, 0, 2);
    
    //以下vertex()最後兩個參數的寫法，在REPEAT模式下，將會形成3x2的貼圖
    //vertex(10, 20, 0, 0, 0);
    //vertex(300, 5, 0, 3, 0);
    //vertex(330, 280, 0, 3, 2);
    //vertex(40, 160, 0, 0, 2);
    endShape();
}
