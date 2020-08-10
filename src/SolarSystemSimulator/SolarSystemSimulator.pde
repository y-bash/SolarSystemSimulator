Galaxy gGalaxy;
SolarSystem gSolarSystem;
CameraController gCameraController;

void setup() {
  gGalaxy = new Galaxy();
  gSolarSystem = new SolarSystem();
  gCameraController =  new CameraController();
  size(1920, 1080, P3D);
  hint(ENABLE_DEPTH_SORT);
  frameRate(24);
}

void draw() {
  background(0, 0, 0);
  gCameraController.update();
  gGalaxy.update();
  gSolarSystem.update();
}

void keyPressed() {
  final int PAGE_UP   = 16;
  final int PAGE_DOWN = 11;
  switch (keyCode) {
    case LEFT      : gCameraController.left();    break;
    case RIGHT     : gCameraController.right();   break;
    case UP        : gCameraController.up();      break;
    case DOWN      : gCameraController.down();    break;
    case PAGE_UP   : gCameraController.forward(); break;
    case PAGE_DOWN : gCameraController.backward();break;
  }
}
