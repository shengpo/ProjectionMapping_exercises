class PlayVideo {
    private PGraphics pg = null;
    private Movie movie;


    public PlayVideo(PApplet papplet) {
        pg = createGraphics(640, 360, P2D);
        movie = new Movie(papplet, "transit.mov");
        movie.loop();
    }


    public void update() {
        if (movie.available() == true) {
            movie.read(); 
        }
    }

    public void show() {
        pg.beginDraw();
        pg.image(movie, 0, 0, pg.width, pg.height);
        pg.endDraw();
    }

    public PGraphics getCurrentImage() {
        update();
        show();
        return pg;
    }
}

