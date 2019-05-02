
system t;
boolean paused;

void settings(){

  size(400, 600);
}

void setup(){

  textAlign(CENTER);
  textSize(40);

  t = new system();
}

void draw(){

  if(!paused){

    background(0);
    grid(t.res);

    t.run();
  }
  else{

    stroke(255);
    fill(255);
    text("paused", width/2, height/2);
  }
}

void keyPressed(){

  if(keyCode == 'A') t.move(false);
  else if(keyCode == 'D') t.move(true);
  else if(keyCode == 'P') paused = !paused;
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
