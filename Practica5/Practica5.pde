float[] ang = {0,0,0,0,0,0};
int[] atomColor = {100, 54, 247};
int cubeLateral;
float[] desp = {0.6, 0.8, 1, 1.2, 1.4, 1.6};
int distance;
int particlesSize;
int coreSize;
int colorDesp = 1;
int posX;
int posY;
int posZ;
int centerX;
int centerY;
int centerZ;
boolean cameraMode = false;
PImage img;


void setup(){
  size(1000,1000,P3D);
  cubeLateral = 400;
  distance = 100;
  particlesSize = 5;
  coreSize = 20;
  noStroke();
  posX = width/2;
  posY = height/2;
  posZ = 600;
  centerX = width/2;
  centerY = height/2;
  centerZ = 0;
  img = loadImage("cielo.jpg");
}

void draw(){
  background(img);
  drawLights();
  drawCube();
  fill(atomColor[0], atomColor[1], atomColor[2]);
  drawAtom();
  camera(posX, posY, posZ, centerX, centerY, centerZ, 0.0, 1.0, 0.0);
  moveCamera();
}

void moveCamera(){
  if (keyPressed) {
    if (key == CODED) {
       if (keyCode == DOWN) {
         posY += 50;
         if(cameraMode) centerY += 50;
       } else if (keyCode == UP) {
         posY -= 50;
         if(cameraMode) centerY -= 50;
       } else if (keyCode == RIGHT) {
         posX += 50;
         if(cameraMode) centerX += 50;
       } else if (keyCode == LEFT) {
         posX -= 50;
         if(cameraMode) centerX -= 50;
       }
    } else if (key == '+'){
      posZ -= 100;
      if(cameraMode) centerZ -= 50;
    } else if (key == '-'){
      posZ += 100;
      if(cameraMode) centerZ += 50;
    }
    else if (key == '8'){
       centerY -= 100;
    } else if (key == '2'){
       centerY += 100;
    } else if (key == '4'){
       centerX -= 100;
    } else if (key == '6'){
       centerX += 100;
    } else if (key == '5'){
      centerX = width/2;
      centerY = height/2;
      centerZ = 0;
    } else if(key == 'c'){
      cameraMode = !cameraMode;
    }
  }
}

void drawAtom(){
  translate(width/2, height/2, cubeLateral/2);
  drawParticles();
  drawAtomCore();
}

void drawLights(){
  float val =((float)mouseX/(float)width*(float)255);
  directionalLight(255,161,width/2+(mouseX-width/2)*1.5,-1,0,0);
  pointLight(255, 161, 0,width/2+(mouseX-width/2)*2,cubeLateral/2,height/2+(mouseY-height/2)*4);
}

void drawCamera(){
  
}

void drawParticles(){
  if (atomColor[0] == 5 || atomColor[0] == 250) colorDesp = -colorDesp;
  atomColor[0] = (atomColor[0]+colorDesp)%255;
  println(atomColor[0] + " " + colorDesp);
  for(int i = 0; i < 4; i++){
    ang[i] = ang[i] + desp[i];
    drawParticle(radians(ang[i]), radians(i*45));
  }
}

void drawParticle(float rotateX, float rotateZ){
  pushMatrix();
  rotateZ(rotateZ);
  rotateX(rotateX);
  translate(0, 100, 0);
  sphere(particlesSize);
  popMatrix();
}

void drawAtomCore(){
  pushMatrix();
  sphere(coreSize);
  popMatrix();
}

void drawCube(){
  noFill();
  fill(255, 0, 0);
  pushMatrix();
  translate(width/2, height/2, 0); 
  box(cubeLateral, cubeLateral, 0);
  popMatrix();
  fill(0, 255, 0);

  pushMatrix();
  translate(width/2, height/2 + cubeLateral/2, cubeLateral/2); 
  box(cubeLateral, 0, cubeLateral);
  popMatrix();
  fill(0, 0, 255);

  pushMatrix();
  translate(width/2 - cubeLateral/2, height/2, cubeLateral/2); 
  box(0, cubeLateral, cubeLateral);
  popMatrix();
}
