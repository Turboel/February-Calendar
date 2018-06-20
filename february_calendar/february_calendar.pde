color bg;
float hueBackground, opposite;

int blobX = 256, blobY = 256;
float speed = 5;

boolean[] controlsArePressed = new boolean[4];
// controlsArePressed [ ↑ , ↓ , ← , → ]


void setup(){
  size(512, 512);
  smooth();
}

void draw(){
// BACKGROUND
  bg = color(mouseX/2, mouseY/2, (mouseX+mouseY)/4);
  background(bg);
  colorMode(HSB);
  stroke(360 - hue(bg), 360 - saturation(bg), 360 - brightness(bg));
  
// LINHAS
  for(int i=1; i<5; i++) line(0, i*height/4, width, i*height/4);
  for(int i=1; i<8; i++) line(i*width/7, 0, i*width/7, height);
  
  textSize(32);
  fill(360 - hue(bg), 360 - saturation(bg), 360 - brightness(bg));
  
// NºS CALENDÁRIO
  int i=1;
  for(int y=1; y<5; y++){
    for(int x=1; x<8; x++){     
      text(i, x*width/7 - width/10, y*height/4 - height/9);
      i++;
    }
  }
  
// BLOB
  fill(360 - hue(bg), 360 - saturation(bg), 360 - brightness(bg));
  
  colorMode(RGB);
  stroke(255);
  
  ellipse(blobX, blobY, 30, 30);
  fill(255);
  ellipse(blobX, blobY-5, 10, 10);
  fill(red(bg), blue(bg), green(bg));
  ellipse(blobX, blobY-5, 7, 7);
  
  if(mouseX >= 6*width/7 && mouseY >= 3*height/4){
    colorMode(HSB);
    fill(360 - hue(bg), 360 - saturation(bg), 360 - brightness(bg));
    
    text("Não é ano bissexto", (width*0.2), height/2);
    colorMode(RGB);
  }
  
// MOVIMENTAÇÃO DO BLOB
  if(controlsArePressed[0] == true){
    // ↖
    if(controlsArePressed[2] == true){
      blobX -= speed;
      blobY -= speed;
    }
    // ↗
    else if(controlsArePressed[3] == true){
      blobX += speed;
      blobY -= speed;
    }
    // ↑
    else blobY -= speed;
  }
  
  else if(controlsArePressed[1] == true){
    // ↙
    if(controlsArePressed[2] == true){
      blobX -= speed;
      blobY += speed;
    }
    // ↘
    else if(controlsArePressed[3] == true){
      blobX += speed;
      blobY += speed;
    }
    // ↓
    else blobY += speed;
  }
  
  // ←
  else if(controlsArePressed[2] == true) blobX -= speed;
  // →
  else if(controlsArePressed[3] == true) blobX+= speed;
    
}

// controlsArePressed [ ↑ , ↓ , ← , → ] 
void keyPressed(){
  if(keyCode == UP){
    controlsArePressed[0] = true;
    //blobY -= speed;
  }
  if(keyCode == DOWN){
    controlsArePressed[1] = true;
    //blobY += speed;
  }
  if(keyCode == LEFT){
    controlsArePressed[2] = true;
    //blobX -= speed;
  }
  if(keyCode == RIGHT){
    controlsArePressed[3] = true;
    //blobX += speed;
  }
}

void keyReleased(){
  if(keyCode == UP) controlsArePressed[0] = false;
  if(keyCode == DOWN) controlsArePressed[1] = false;
  if(keyCode == LEFT) controlsArePressed[2] = false;
  if(keyCode == RIGHT) controlsArePressed[3] = false;
}
