
class system{

  PVector gravity;
  int[][] grid;
  int res, cols, rows;
  block b;

  system(){

    gravity = new PVector(0, 0.01);
    res = 40; //must be divisible to width
    rows = height/res;
    cols = width/res;
    grid = new int[rows][cols];
    b = new block(gridtopix(int(random(cols))));
  }

  void run(){

    b.update();
    b.check();
    b.display();
    if(b.hit) b = new block(gridtopix(int(random(cols))));
  }

  void move(boolean right){

    if(!b.hit){

      if(right){

        if(b.position.x < width -res) b.position.x += res;
      }
      else if(b.position.x > 0) b.position.x -= res;
    }
  }

  int gridtopix(int x){

    int col = x*res;
    return col;
  }
}
