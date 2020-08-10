public class CelestialObject extends Billboard {
  private ArrayList<Billboard> mChildren = null;

  public CelestialObject(String imageName,
                         int w, float x, float y, float z) {
    super(imageName, w, x, y, z);
  }

  public void addChild(Billboard child) {
    if (mChildren == null) {
      mChildren = new ArrayList<Billboard>();
    }
    mChildren.add(child);
  }

  public void update() {
    pushMatrix();
      transform();
      pushMatrix();
        turnToCamera();
        drawSelf();
      popMatrix();
      updateChildren();
    popMatrix();
  }

  private void updateChildren() {
    if (mChildren != null) {
      for (Billboard child : mChildren) {
        child.update();
      }
    }
  } 
}
