class ImageSource {
    private PImage img = null;
    private PImage mask = null;

    
    public ImageSource(String imageFileName){
        img = loadImage(imageFileName);
    }
    
    
    public PImage getImage(){
        if(mask != null){
            img.mask(mask);
        }
        
        return img;
    }
    
    
    public void setMask(PImage mask){
        mask.resize(img.width, img.height);    //mask大小必須跟mask對象一樣大
        this.mask = mask;
    }
}
