/*
mappingtools library可以讓使用者做出四邊形(Quad)、貝茲曲面形(Bezier)、自由面(free)等texture-mapping功能
這邊將練習使用mappingtools library
 
此範例為useMappingtoolsLibrary03的延伸
*/

/*
useMappingtoolsLibrary04範例:
- 嘗試解決兩台投影機的重疊影像區域的亮度問題 (重疊處會較其他區域亮)
- 此sketch為了簡化，把SettingHelper拿掉
*/


/*
mappingtools library預設支援以下按鍵功能：
- 按鍵 c ： 顯示/隱藏控制點                                            (注意！同時使用多個QuadWarp class時，僅此功能能正常使用)
- 按鍵 d ： reset控制點為預設值                                        (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 s ： 將控制點位置記錄下來，在sketch所在位置儲存成presets.txt檔     (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 p ： 載入先前所儲存的控制點位置(presets.txt檔)                    (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
*/


import mappingtools.*;


ArrayList<QuadWarpHelper> qwhList = null;    //為了SettingHelper而搭配使用 

ImageSource imageSource1 = null;
ImageSource imageSource2 = null;

//為避免兩個QuadWarpHelper的控制點重疊，以至於無法選擇特定的控制點，於是多宣告下列兩個boolean變數以方便選擇特定的QuadWarpHelper
boolean isSelect1 = true;
boolean isSelect2 = true;


void setup() {
    size(640, 480, P3D);

    qwhList = new ArrayList<QuadWarpHelper>();
    
    //建立兩個QuadWarpHelper，每個皆有不同控制點位置
    qwhList.add(new QuadWarpHelper("mapping1", this, 10, 100, 100, 200, 100, 200, 200, 100, 200));
    qwhList.add(new QuadWarpHelper("mapping2", this, 10, 400, 100, 500, 100, 500, 200, 400, 200));
    
    //分別載入適當裁切過得影像內容
    imageSource1 = new ImageSource("image1.jpg");    //原始影像左邊
    imageSource2 = new ImageSource("image2.jpg");    //原始影像右邊

    //載入遮罩，用來降低重疊區域的亮度 (mask必須為灰階影像, mask的白色處會使得原始影像留下, mask的黑色處會使得原始影像留下，mask的灰階處會使得原始影像留下但有透明度)
    imageSource1.setMask(loadImage("mask1.jpg"));
    imageSource2.setMask(loadImage("mask2.jpg"));
}


void draw() {
    background(0);

    for(int i=0; i<qwhList.size(); i++){
        if(i==0 && isSelect1)    qwhList.get(i).render(imageSource1.getImage());
        if(i==1 && isSelect2)    qwhList.get(i).render(imageSource2.getImage());
    }
}


void keyPressed(){
    //選擇第一個QuadWarpHelper
    if(key == '1'){
        isSelect1 = true;
        isSelect2 = false;
    }

    //選擇第二個QuadWarpHelper
    if(key == '2'){
        isSelect1 = false;
        isSelect2 = true;
    }

    //選擇二個QuadWarpHelper
    if(key == '0'){
        isSelect1 = true;
        isSelect2 = true;
    }
}

