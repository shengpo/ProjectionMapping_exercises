class Mapper {
    private float[] pointA = new float[2];    //texture的左上角
    private float[] pointB = new float[2];    //texture的右上角
    private float[] pointC = new float[2];    //texture的右下角
    private float[] pointD = new float[2];    //texture的左下角

    
    public Mapper(float AX, float AY, float BX, float BY, float CX, float CY, float DX, float DY){
        pointA[0] = AX;
        pointA[1] = AY;
        pointB[0] = BX;
        pointB[1] = BY;
        pointC[0] = CX;
        pointC[1] = CY;
        pointD[0] = DX;
        pointD[1] = DY;
    }
        
    
    public void render(PGraphics pg){
        beginShape();
        texture(pg);
        vertex(pointA[0], pointA[1], 0, 0);
        vertex(pointB[0], pointB[1], 1, 0);
        vertex(pointC[0], pointC[1], 1, 1);
        vertex(pointD[0], pointD[1], 0, 1);
        endShape();
    }
    
    //設定左上角
    public void setPointA(float x, float y){
        pointA[0] = x;
        pointA[1] = y;
    }

    //設定右上角
    public void setPointB(float x, float y){
        pointB[0] = x;
        pointB[1] = y;
    }

    //設定右下角
    public void setPointC(float x, float y){
        pointC[0] = x;
        pointC[1] = y;
    }

    //設定左下角
    public void setPointD(float x, float y){
        pointD[0] = x;
        pointD[1] = y;
    }
}
