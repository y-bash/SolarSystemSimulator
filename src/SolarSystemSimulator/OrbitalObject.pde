public class OrbitalObject extends CelestialObject {
  private float mRadius;
  private int   mPeriod;
  private float mStart;

  public OrbitalObject(CelestialObject parent,
                       String imageName, int w,
                       float radius, int period) {
    super(imageName, w, 0, 0, 0);
    mRadius = radius;
    mPeriod = period * 1000;
    mStart = random(TWO_PI);
    parent.addChild(this);
  }

  public void update() {
    updateOrbit();
    super.update();
  }

  protected void transform() {
    int   ms = millis();
    float rd = mStart + TWO_PI * (ms % mPeriod) / mPeriod;
    rotateY(rd);
    translate(mRadius, 0, 0);
  }
  
  protected void updateOrbit() {
    pushMatrix();
      rotateX(HALF_PI);
      pushStyle();
        noFill();
        stroke(48, 48, 48);
        strokeWeight(1);
        circle(0, 0, mRadius*2);
      popStyle();
    popMatrix();
  }
}
