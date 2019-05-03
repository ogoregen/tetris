
system t;
boolean paused, start;

void settings(){

  size(400, 600);
}

void setup(){

  textAlign(CENTER, CENTER);
  t = new system();
}

void draw(){

  translate(0, -60);
  if(!start){

    background(0);
    textSize(20);
    stroke(255);
    fill(255);
    line(0, height, width, height);
    text("press any key to start", width/2, height/2);
    if(keyPressed) start = true;
  }
  else{

    if(!paused){

      background(0);


      grid(t.res);

      t.run();
    }
    else{

      textSize(30);
      stroke(255);
      fill(255);
      text("paused", width - 100, height);
    }
  }
}

void keyPressed(){

  if(keyCode == 'A') t.move(false);
  else if(keyCode == 'D') t.move(true);
  else if(keyCode == 'P' && start) paused = !paused;
}

void grid(int res){

  stroke(10);
  for(int x = 0; x <= width - t.res; x += res){

    for(int y = 0; y <= height - t.res; y += res){

      if(t.grid[y/t.res][x/t.res] == 1) fill(255);
      else fill(0);
      rect(x, y, res, res);
    }
  }
}
