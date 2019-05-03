
system t;
boolean paused, start;
PVector down;

void settings(){

  size(400, 600);
}

void setup(){

  textSize(20);
  t = new system();
  down = new PVector(0, 1);
}

void draw(){

  translate(0, -3 * t.res);
  background(0);
  if(!start){

    if(keyPressed) start = true;
  }
  else{

    grid(t.res);
    t.run();
  }
  hud();
}

void keyPressed(){

  if(keyCode == 'A') t.move(false);
  else if(keyCode == 'D') t.move(true);
  else if(keyCode == 'S' && t.b.position.y > t.res * 4) t.b.v.add(down);
  else if(keyCode == 'P' && start && !t.over) paused = !paused;
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

void hud(){

  stroke(255);
  fill(255);

  textAlign(RIGHT);
  if(paused) text("paused", width - 10, height + 50);
  if(t.over) text("game over", width - 10, height + 50);
  textAlign(LEFT);
  if(start){

    line(0, height, width, height);
    text("score: " + t.score, 10, height + 50);
  }
  else text("press any key to start", 10, height/2 + 60);
}
