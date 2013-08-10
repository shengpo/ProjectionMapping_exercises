class RotatingBox {
    private PGraphics pg = null;
    private float degreeX = 0;
    private float degreeY = 0;


    public RotatingBox() {
        pg = createGraphics(400, 300, P3D);
    }


    public void update() {
        degreeX = map(mouseX, 0, width, 0, 360);
        degreeY = map(mouseY, 0, height, 0, 360);
    }

    public void show() {
        pg.beginDraw();
        pg.background(255);
        pg.stroke(0);
        pg.fill(255, 0, 0);
        pg.pushMatrix();
        pg.translate(pg.width/2, pg.height/2, 0);
        pg.rotateX(radians(degreeX));
        pg.rotateY(radians(degreeY));
        pg.box(50);
        pg.popMatrix();
        pg.endDraw();
    }

    public PGraphics getCurrentImage() {
        update();
        show();
        return pg;
    }
}

