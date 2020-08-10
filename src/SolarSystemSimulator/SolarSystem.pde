public class SolarSystem {
  private CelestialObject mSun;

  public SolarSystem() {
    mSun = new CelestialObject("Sun.png", 50, 0, 0, 0);
    OrbitalObject mercury  = new OrbitalObject(mSun,    "Mercury.png", 19, 227,  14);
    OrbitalObject venus    = new OrbitalObject(mSun,    "Venus.png",   47, 425,  37);
    OrbitalObject earth    = new OrbitalObject(mSun,    "Earth.png",   50, 587,  60);
               /* moon     */new OrbitalObject(earth,   "Moon.png",    13, 130,   4);
    OrbitalObject mars     = new OrbitalObject(mSun,    "Mars.png",    26, 894, 112);
    OrbitalObject jupiter  = new OrbitalObject(mSun,    "Jupiter.png",100,1527, 711);
               /* io       */new OrbitalObject(jupiter, "Io.png",      14, 165,   1);
               /* europa   */new OrbitalObject(jupiter, "Europa.png",  12, 263,   2);
               /* ganymede */new OrbitalObject(jupiter, "Ganymede.png",21, 420,   3);
               /* callisto */new OrbitalObject(jupiter, "Callisto.png",19, 590,   4);
    OrbitalObject saturn   = new OrbitalObject(mSun,    "Saturn.png", 100,2800, 886);
               /* titan    */new OrbitalObject(saturn,  "Titan.png",   20, 479,   3);
    OrbitalObject uranus   = new OrbitalObject(mSun,    "Uranus.png",  50,3755,1685);
    OrbitalObject neptune  = new OrbitalObject(mSun,    "Neptune.png", 50,4410,2472);
               /* triton   */new OrbitalObject(neptune, "Triton.png",  11, 139,  -1);
    OrbitalObject pluto    = new OrbitalObject(mSun,    "Pluto.png",    9,5789,3716);
    OrbitalObject eris     = new OrbitalObject(mSun,    "Eris.png",     9,6632,5580);
  }

  public void update() {
    mSun.update();
  }
}
