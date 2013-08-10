class RotatingBox {
    private PGraphics offscreen = null;

    
    public RotatingBox(){
        offscreen = createGraphics(400, 300, P3D);
    }
    
    public PGraphics offscreenDraw(float mx, float my){
        if(mx < 0){
            mx = 0;
        }else if(mx > offscreen.width){
            mx = offscreen.width;
        }
        if(my < 0){
            my = 0;
        }else if(my > offscreen.height){
            my = offscreen.height;
        }
        
        
        offscreen.beginDraw();
        offscreen.background(255);
        offscreen.fill(0, 255, 0);
        offscreen.pushMatrix();
        offscreen.translate(mx, my, 0);
        offscreen.rotateX(radians(frameCount%360+7));
        offscreen.rotateY(radians(frameCount%360));
        offscreen.noFill();
        offscreen.stroke(0);
        offscreen.box(50);
        offscreen.popMatrix();
        offscreen.endDraw();
        
        return offscreen;
    }
}
