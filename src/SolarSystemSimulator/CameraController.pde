public class CameraController {
  private float mRadius = 1000;
  private float mAngle  =    0;
  private float mYCoord =    0;

  private int mRadiusSpeed     = 0;
  private int mRotationalSpeed = 0;
  private int mVerticalSpeed   = 0;

  private int mPrevMillis = 0;

  public void left() {
    mRotationalSpeed -= 5;
    printStatus();
  }

  public void right() {
    mRotationalSpeed += 5;
    printStatus();
  }

  public void up() {
    mVerticalSpeed -= 25;
    printStatus();
  }
  
  public void down() {
    mVerticalSpeed +=25;
    printStatus();
  }

  public void forward() {
    mRadiusSpeed -= 10;
    printStatus();
  }
  
  public void backward() {
    mRadiusSpeed += 10;
    printStatus();
  }

  public void printStatus() {
    print("(R,A,V)=(");
    print((int)mRadius + "px, " + (int)mAngle + "deg, " + (int)mYCoord + "px");
    print(") (dR,dA,dV)=(");
    print(mRadiusSpeed + "px/s, " + mRotationalSpeed + "deg/s, " + mVerticalSpeed + "px/s");
    println(")");
  }
  
  public void update() {
    int ms = millis();

    if (ms/1000 != mPrevMillis/1000) printStatus();

    int dt = ms - mPrevMillis;
    mPrevMillis = ms;

    mRadius += mRadiusSpeed * dt / 1000.0;
    mRadius = max(mRadius, 100.0);
    if (mRadius==100.0) mRadiusSpeed = 0;

    mAngle += mRotationalSpeed * dt / 1000.0;
    mAngle = mAngle % 360;
    if (mAngle < 0) mAngle += 360;

    mYCoord += mVerticalSpeed * dt / 1000.0;

    float z = mRadius * cos(radians(mAngle));
    float x = mRadius * sin(radians(mAngle));
    float y = mYCoord;
    camera(x, y, z, 0, 0, 0, 0, 1, 0);
  }
}
