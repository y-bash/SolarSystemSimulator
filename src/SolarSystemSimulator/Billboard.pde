public class Billboard {
  private PImage mImage;
  private int    mWidth;
  private int    mHeight;
  private float  mX;
  private float  mY;
  private float  mZ;

  public Billboard(String imageName, int w, float x, float y, float z) {
    this( loadImage(imageName), w, x, y, z);
  }
  
  public Billboard(PImage image,  int w, float x, float y, float z) {
    mImage  = image;
    mWidth  = w;
    mHeight = w * mImage.height / mImage.width;
    mX      = x;
    mY      = y;
    mZ      = z;
  }

  public void update() {
    pushMatrix();
      transform();
      turnToCamera();
      drawSelf();
    popMatrix();
  }

  protected void transform() {
    translate(mX, mY, mZ);
  }

  protected void drawSelf() {
    float hw = mWidth  / 2;
    float hh = mHeight / 2;
    float iw = mImage.width;
    float ih = mImage.height;
    pushStyle();
      noStroke();
      beginShape();
        texture(mImage);
        vertex(-hw, -hh, 0,  0,  0);
        vertex( hw, -hh, 0, iw,  0);
        vertex( hw,  hh, 0, iw, ih);
        vertex(-hw,  hh, 0,  0, ih);
      endShape();
    popStyle();
  }
 
  protected void turnToCamera() {
    PMatrix3D m = (PMatrix3D)g.getMatrix();  
    m.m00 = m.m11 = m.m22 = 1;
    m.m01 = m.m02 = m.m10 = m.m12 = m.m20 = m.m21 = 0;
    resetMatrix();  
    applyMatrix(m);  
  }
}
