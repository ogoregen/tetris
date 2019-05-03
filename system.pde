
class system{

  PVector gravity;
  int[][] grid;
  int res, cols, rows;
  boolean over;
  int score;
  block b;

  system(){

    score = 0;
    gravity = new PVector(0, 0.01);
    res = 20; //must be divisible to width
    rows = height/res + 3;
    cols = width/res;
    grid = new int[rows][cols];
    b = new block(res * int(random(1, cols-1)));
  }

  void run(){

    if(!over){

      b.update();
      b.check();
      b.display();
    }stroke(255);
          line(0, height, width, height);
    for(int i = 0; i < cols; i++){

      if(grid[3][i] == 1) over = true;
    }
    if(b.hit && !over) b = new block(res* int(random(1, cols-1)));
    text("score: " + score, res*2, height+3*res/2);
    if(over){

      text("game over", width/2, height/2);
    }
  }

  void move(boolean right){

    boolean endedr = false;
    boolean endedl = false;

    boolean rclear = true;
    boolean lclear = true;

    for(int i = 0; i < 4; i++){
    if(!endedr){
      if(b.position.x + b.shapes[b.type][i][1]*res >= width-res || grid[int(b.position.y/res)][int(b.position.x/res) + b.shapes[b.type][i][1] + 1] == 1){
        rclear = false;
        endedr = true;
      }

      else rclear = true;
          }
        if(!endedl){
      if(b.position.x + b.shapes[b.type][i][1]*res < res || grid[int(b.position.y/res)][int(b.position.x/res) + b.shapes[b.type][i][1] - 1] == 1) {
        lclear = false;
      endedl = true;
    }
      else lclear = true;
    }
    }
    if(!b.hit){

      if(right){

        if(b.position.x < width -res && rclear) b.position.x += res;
      }
      else if(b.position.x > 0 && lclear) b.position.x -= res;
    }
  }
}
