// Variables para definir columnas y filas
int cols, rows;
int scale = 20;  
int w = 1400;  
int h = 800;   
PVector[] flowfield;  
PVector[] flowfield2; 
PVector[] flowfield3; // Inicializar el segundo campo de flujo
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Particle2> particles2 = new ArrayList<Particle2>();
ArrayList<Particle3> particles3 = new ArrayList<Particle3>();

//int frameCount = 0;  // Contador de fotogramas

void setup() {
  size(800, 800);
  cols = w / scale;
  rows = h / scale;
  flowfield = new PVector[cols * rows];
  flowfield2 = new PVector[cols * rows]; 
  flowfield3 = new PVector[cols * rows];// Inicializar el segundo campo de flujo
  
  // Inicializar la lista de Particle
  for (int i = 0; i < 1000; i++) {
    particles.add(new Particle());
  }
  
  // Inicializar la lista de Particle2
  for (int i = 0; i < 1000; i++) {  // Puedes ajustar el número de partículas si lo deseas
    particles2.add(new Particle2());
  }
  
   for (int i = 0; i < 2000; i++) {  // Puedes ajustar el número de partículas si lo deseas
    particles3.add(new Particle3());
  }
}

void draw() {
  background(0);
  float yoff = 0;
  
  // Actualizar el primer campo de flujo
  for (int y = 0; y < rows; y++) {
    float xoff = 0;
    for (int x = 0; x < cols; x++) {
      float angle = noise(xoff, yoff) * TWO_PI * 4;
      int index = x + y * cols;
      PVector v = PVector.fromAngle(angle);
      flowfield[index] = v;
      xoff += 0.1;
    }
    yoff += 0.1;
  }

  // Actualizar el segundo campo de flujo con un offset diferente
  float yoff2 = 100;
  
  for (int y = 0; y < rows; y++) {
    float xoff2 = 100;
    for (int x = 0; x < cols; x++) {
      float angle2 = noise(xoff2, yoff2) * TWO_PI * 4;
      int index = x + y * cols;
      PVector v2 = PVector.fromAngle(angle2);
      flowfield2[index] = v2;
      xoff2 += 0.1;
    }
    yoff2 += 0.1;
  }
  
    // Actualizar el segundo campo de flujo con un offset diferente
  float yoff3 = 50;
  
  for (int y = 0; y < rows; y++) {
    float xoff3 = 100;
    for (int x = 0; x < cols; x++) {
      float angle3 = noise(xoff3, yoff3) * TWO_PI * 4;
      int index = x + y * cols;
      PVector v3 = PVector.fromAngle(angle3);
      flowfield3[index] = v3;
      xoff3 += 0.1;
    }
    yoff3 += 0.1;
  }

  // Actualizar y mostrar las partículas de Particle
  for (Particle p : particles) {
    p.follow(flowfield);
    p.update();
    p.show();
    p.edges();
  }
  
  // Actualizar y mostrar las partículas de Particle2
  for (Particle2 p2 : particles2) {
    p2.follow(flowfield2);
    p2.update();
    p2.show();
    p2.edges();
  }
  
    // Actualizar y mostrar las partículas de Particle3
  for (Particle3 p3 : particles3) {
    p3.follow(flowfield3);
    p3.update();
    p3.show();
    p3.edges();
  }
  
  // Guardar cada fotograma como una imagen
  /*saveFrame("output3/frame-####.png");  // Guarda cada cuadro en la carpeta "output"
  
  // Incrementar el contador de cuadros
  frameCount++;
  
  // Detener el sketch después de, por ejemplo, 300 cuadros (ajusta según la duración deseada)
  if (frameCount == 600) {
    exit();  // Detiene el sketch
  }*/
}
