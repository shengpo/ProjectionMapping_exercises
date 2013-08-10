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
        textureMode(NORMAL);
    
        beginShape();
        texture(pg);
        vertex(pointA[0], pointA[1], 0, 0);
        vertex(pointB[0], pointB[1], 1, 0);
        vertex(pointC[0], pointC[1], 1, 1);
        vertex(pointD[0], pointD[1], 0, 1);
        endShape();
    }
    
    public void updateCorner(float mx, float my){
        if(dist(mx, my, pointA[0], pointA[1]) < 10){
            pointA[0] = mx;
            pointA[1] = my;
        }else if(dist(mx, my, pointB[0], pointB[1]) < 10){
            pointB[0] = mx;
            pointB[1] = my;
        }else if(dist(mx, my, pointC[0], pointC[1]) < 10){
            pointC[0] = mx;
            pointC[1] = my;
        }else if(dist(mx, my, pointD[0], pointD[1]) < 10){
            pointD[0] = mx;
            pointD[1] = my;
        }
    }
    
    public void showCorners(){
        stroke(255, 255, 0);
        noFill();
        ellipse(pointA[0], pointA[1], 10, 10);
        ellipse(pointB[0], pointB[1], 10, 10);
        ellipse(pointC[0], pointC[1], 10, 10);
        ellipse(pointD[0], pointD[1], 10, 10);
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
