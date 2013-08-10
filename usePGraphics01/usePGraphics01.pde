/*
了解如何使用texture之後，
若要在一個畫面(一個投影 or 一個投影機)中作多個texture，且每個texture內容皆不同的話
則必須使用off-screen繪圖的技巧
其中一個最簡單的方式，便是使用 PGraphics

usePGraphics系列範例修改自Processin官網的reference
*/

/*
usePGraphics01範例:
- 示範PGraphics的基本用法
*/


PGraphics pg = null;    //宣告一個PGraphics變數

void setup(){
    size(800, 600, P3D);
    
    pg = createGraphics(300, 300);        //利用createGraphics()產生一個可以off-screen繪圖的PGraphics物件
                                          //createGraphics()可以填入2~4個參數，前面兩個是off-screen繪圖區的大小(width x height)
                                          //第三個參數為指定的render，有P2D, P3D, PDF可供選擇，若不特別指定，則預設為P2D
                                          //至於第四個參數僅在render為PDF時需要，用來指定PDF檔名
//    pg = createGraphics(300, 300, P2D);
//    pg = createGraphics(300, 300, P3D);

    /***
    需特別注意的是：
    若在size()中無特別指定render(如：P2D或P3D)，則createGraphics()的render設定就不能夠使用P2D跟P3D，僅能用PDF或是不設定直接使用預設值 (此時的預設值跟size()的預設值一樣為JAVA2D)
    舉例：
    size(400, 300);    //無指定render, 使用預設的JAVA2D render
    pg = createGraphics(300, 300, P2D); //error
    pg = createGraphics(300, 300, P3D); //error
    pg = createGraphics(300, 300); //passed! 此使用同size()預設的render: JAVA2D
    ***/
}


void draw(){
    background(0);
    
    /***
    要對off-screen繪圖區做繪圖的動作，必須針對PGraphics物件，呼叫其對應的函式(function 或 method)
    以此sketch為例，這邊的pg變數代表的便是PGraphics物件
    在開始繪製之前，必須呼叫beginDraw()，繪製完成後必須呼叫endDraw()
    在繪製的過程中，只要呼叫相對應於主繪圖區的函式即可
    例如：
    - 在主繪圖區要畫一條直線時，直接呼叫line()
    - 在off-screen的繪圖區要畫一條直線，便要呼叫PGraphics物件的line()，以此sketch為例，就是pg.line()
    ***/

    pg.beginDraw();            //必須以beginDraw()開頭

    //中間部份：在off-screen繪圖區上繪圖跟一般在主繪圖區(預設的Processing繪圖區)一樣
    //對pg使用相對應於主繪圖區的函式即可
    pg.background(100);
    pg.stroke(255, 255, 0);
    pg.noFill();
    float x = map(mouseX, 0, width, 0, pg.width);
    float y = map(mouseY, 0, height, 0, pg.height);
    pg.ellipse(x, y, 30, 30);

    pg.endDraw();              //結束off-screen繪圖後，必須以endraw()結束
                               //在呼叫endDraw()之後，pg本身可以被視為PImage來使用
    
    image(pg, 10, 10);         //利用image()來呈現off-screen繪圖區(pg)的內容
    image(pg, 320, 10);
}

