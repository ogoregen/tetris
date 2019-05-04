
system t;
boolean paused, start;
PVector down;
int next;

void settings(){

  size(400, 600);
}

void setup(){

  textSize(20);
  next = int(random(7));
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
  else if(keyCode == 'E') t.rotate(true);
  else if(keyCode == 'Q') t.rotate(false);
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

  fill(10);
  stroke(10);
  if(start) rect(0, height, width, 60);

  stroke(255);
  fill(255);

  textAlign(RIGHT);
  if(paused) text("paused", width - 10, height + 40);
  if(t.over) text("game over", width - 10, height + 40);
  else if(start) text("next: ", width/2 + 10, height + 40);
  textAlign(LEFT);

  if(start){

    line(0, height, width, height);
    text("score: " + t.score, 10, height + 40);
    if(!t.over){

      fill(255);
      stroke(10);
      for(int i = 0; i < 4; i++){

        rect(
          t.b.shapes[next][i][1]*2*t.res/3 + width/2 + 20,
          t.b.shapes[next][i][0]*2*t.res/3 + height + 30,
          2*t.res/3, 2*t.res/3
          );
      }
    }
  }
  else text("press any key to start", 10, height/2 + 60);
}
