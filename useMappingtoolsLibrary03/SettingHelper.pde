class SettingHelper {

    public SettingHelper() {
    }

    //將每個QuadWarpHelper的reset成預設值
    public void reset(ArrayList<QuadWarpHelper> qwhList) {
        for(QuadWarpHelper qwh : qwhList){
            qwh.reset();
        }
        
        println("[SettingHelper] all QuadWarpHelpers are reseted!");
    }    


    //將每個QuadWarpHelper的當前設定紀錄至setting.txt檔
    public void save(ArrayList<QuadWarpHelper> qwhList) {
        PrintWriter output = createWriter("setting.txt");

        for(QuadWarpHelper qwh : qwhList){
            output.println(qwh.getSetting());
        }

        output.flush();
        output.close();

        println("[SettingHelper] all QuadWarpHelpers' settings are saved as setting.txt");
    }


    //將setting.txt檔的內容載入至每個QuadWarpHelper
    public void load(ArrayList<QuadWarpHelper> qwhList) {
        BufferedReader reader = createReader("setting.txt");
        String line = null;

        try{
            line = reader.readLine();
            
            while(line != null){
                for (QuadWarpHelper qwh : qwhList) {
                    qwh.loadSetting(line);
                }
    
                line = reader.readLine();
            }

            println("[SettingHelper] all QuadWarpHelpers' settings are loaded from setting.txt");
        }catch(IOException e){
            e.printStackTrace();
        }
    }
}

