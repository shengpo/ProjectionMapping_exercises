/*
mappingtools library可以讓使用者做出四邊形(Quad)、貝茲曲面形(Bezier)、自由面(free)等texture-mapping功能
這邊將練習使用mappingtools library
 
此範例修改自mappingtools library的QuadWarp_img範例以及MULTI_QuadWarp_controlSprites範例
*/

/*
useMappingtoolsLibrary03範例:
- 自訂一個QuadWarpHelper class以及SettingHelper class：進一步處理控制點的設定、儲存控制點位置及載入預設的控制點位置
*/


/*
mappingtools library預設支援以下按鍵功能：
- 按鍵 c ： 顯示/隱藏控制點                                            (注意！同時使用多個QuadWarp class時，僅此功能能正常使用)
- 按鍵 d ： reset控制點為預設值                                        (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 s ： 將控制點位置記錄下來，在sketch所在位置儲存成presets.txt檔     (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
- 按鍵 p ： 載入先前所儲存的控制點位置(presets.txt檔)                    (注意！同時使用多個QuadWarp class時，此功能無法正常使用，會發生無法預期的結果)
*/


/*
此sketch透過SettingHelper提供恢復預設值、儲存當前設定值、以及載入設定值得功能
可透過以下按鍵達成：
- 按鍵 e ： reset所有的QuadWarpHelper的控制點為預設值
- 按鍵 q ： 將所有的QuadWarpHelper的控制點位置記錄下來，在sketch所在位置儲存成setting.txt檔
- 按鍵 w ： 載入先前所儲存的控制點位置至所有的QuadWarpHelper(setting.txt檔)
*/

import mappingtools.*;


ArrayList<QuadWarpHelper> qwhList = null;    //為了SettingHelper而搭配使用 
SettingHelper settingHelper = null;

PImage img;


void setup() {
    size(640, 480, P3D);
    img = loadImage("scotland.tif");

    settingHelper = new SettingHelper();
    qwhList = new ArrayList<QuadWarpHelper>();
    
    //建立兩個QuadWarpHelper，每個皆有不同控制點位置
    qwhList.add(new QuadWarpHelper("mapping1", this, 10, 100, 100, 200, 100, 200, 200, 100, 200));
    qwhList.add(new QuadWarpHelper("mapping2", this, 10, 400, 100, 500, 100, 500, 200, 400, 200));
}


void draw() {
    background(0);

    for(int i=0; i<qwhList.size(); i++){
        qwhList.get(i).render(img);
    }
}


void keyPressed(){
    if(key == 'q'){
        settingHelper.save(qwhList);
    }

    if(key == 'w'){
        settingHelper.load(qwhList);
    }

    if(key == 'e'){
        settingHelper.reset(qwhList);
    }
}
