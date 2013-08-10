class QuadWarpHelper {
    private String title = "";    //此Helper的title名稱
    private QuadWarp qw = null;

    //用來紀錄QuadWarp四周的控制點(預設的控制點位置)
    PVector[] controlSprites = new PVector[4];
    
    //A, B, C, D分別代表分別代表四個角落的控制點，依序為左上角、右上角、右下角、左下角
    public QuadWarpHelper(String title, PApplet papplet, int grid, float AX, float AY, float BX, float BY, float CX, float CY, float DX, float DY){
        this.title = title;
        
        qw = new QuadWarp(papplet, grid);
        controlSprites[0] = new PVector(AX, AY);    //左上角
        controlSprites[1] = new PVector(BX, BY);    //右上角
        controlSprites[2] = new PVector(CX, CY);    //右下角
        controlSprites[3] = new PVector(DX, DY);    //左下角

        qw.controlSprites(controlSprites);
        qw.showControls(false);    //使得一開始不會秀出控制點
    }
    
    
    public void render(PImage img){
        qw.render(img);
    }
    
    //將控制點reset將控制點設成一開始的預設位置
    public void reset(){
        qw.controlSprites(controlSprites);
    }
    

    //取得此helper的title名稱
    public String getTitle(){
        return title;
    }
    
//    //取得控制點目前的值
//    public String getSetting(){
//        String setting = "";
//
//        setting = title + "|" + qw.x_pos[0] + "|" + qw.y_pos[0] + "|"
//                              + qw.x_pos[1] + "|" + qw.y_pos[1] + "|"
//                              + qw.x_pos[2] + "|" + qw.y_pos[2] + "|"
//                              + qw.x_pos[3] + "|" + qw.y_pos[3];
//        return setting;
//    }

    //取得控制點目前的值 (這邊是使用hack的方式，因為無法直接取得QuadWarp.x_pos跟QuadWarp.y_pos的值)
    public String getSetting(){
        String setting = "";

        //先讓QuadWarp將目前的控制點數值儲存成presets.txt檔
        qw.savePresets();

        //再將presets.txt檔的數值讀出
        BufferedReader reader = createReader("presets.txt");
        String line = null;

        //開始紀錄setting數值
        setting = setting + title;    //以title開頭，後面接控制點目前的數值
        try{
            line = reader.readLine();
            while(line != null){
                setting = setting + "|" + float(line);
                line = reader.readLine();    //read next line
            }
        }catch(IOException e){
            e.printStackTrace();
        }
        
        return setting;
    }
    
    //載入控制點的設定值
    public void loadSetting(String setting){
        String[] items = split(setting, "|");
        
        if(items.length == 9){    //設定值數量足夠才進行設定
            if(items[0].equals(title)){
                controlSprites[0].x = float(items[1]);
                controlSprites[0].y = float(items[2]);
                controlSprites[1].x = float(items[3]);
                controlSprites[1].y = float(items[4]);
                controlSprites[2].x = float(items[5]);
                controlSprites[2].y = float(items[6]);
                controlSprites[3].x = float(items[7]);
                controlSprites[3].y = float(items[8]);
        
                qw.controlSprites(controlSprites);
            }
        }
    }
}
