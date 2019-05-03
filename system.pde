
class system{

  PVector gravity;
  int[][] grid;
  int res, cols, rows, score;
  boolean over;
  block b;

  system(){

    score = 0;
    gravity = new PVector(0, 0.01);
    res = 20; //must be divisible to width
    rows = height/res + 3; // 3 extra for the spawn zone
    cols = width/res;
    grid = new int[rows][cols];
    b = new block(res * int(random(2, cols-1)));
  }

  void run(){

    if(!over){

      if(!paused){

        b.update();
        b.check();
      }
      b.display();
    }

    for(int i = 0; i < cols; i++) if(grid[3][i] == 1) over = true;

    if(b.hit && !over) b = new block(res* int(random(2, cols-1)));

    for(int i = 0; i < rows; i++){

      int r = 0;
      for(int j = 0; j < cols; j++){

        r += grid[i][j];
        if(r == cols){
          score += 100;
          for(int a = 0; a < cols; a++) grid[i][a] = 0; //destroy the filled row
          for(int b = i; b > 0; b--){ // shift all the rows down by one above it

            for(int c = 0; c < cols; c++){

              grid[b][c] = grid[b-1][c];
            }
          }
        }
      }
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

        if(b.position.x + b.shapes[b.type][i][1]*res < res || grid[int(b.position.y/res)][int(b.position.x/res) + b.shapes[b.type][i][1] - 1] == 1){

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
