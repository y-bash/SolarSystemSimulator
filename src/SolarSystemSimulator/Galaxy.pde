public class Galaxy {
  private Billboard[] mStars = new Billboard[1000];

  public Galaxy() {
    PImage[] images = new PImage[] {
      loadImage("BlueStar50.png"),
      loadImage("WhiteStar50.png"),
      loadImage("YellowStar50.png"),
      loadImage("OrangeStar50.png"),
      loadImage("RedStar50.png"),
    };

    for (int i = 0; i < mStars.length; i++) {
      float angle  = random(TWO_PI);
      float radius = random(4000, 5000);
      float x      = sin(angle) * radius;
      float z      = cos(angle) * radius;
      float y      = random(-3000, 3000);

      int n = (int)random(5);
      mStars[i]    = new Billboard(images[n], 50, x, y, z);
    }
  }
  
  public void update() {
    for (Billboard star: mStars) {
      star.update();
    }
  }
}
