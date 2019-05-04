
class block{

  PVector position, v, a;
  boolean hit;
  int type;
  int[][][] current;
  int[][][] shapes = {
  { //square
    {0, 0},
    {0, -1},
    {-1, 0},
    {-1, -1}
  },
  { //L
    {0, 0},
    {0, 1},
    {-1, 0},
    {-2, 0}
  },
  { //I
    {0, 0},
    {1, 0},
    {-1, 0},
    {-2, 0}
  },
  { //T
    {0, 0},
    {0, 1},
    {0, -1},
    {1, 0}
  },
  { //Z
    {0, 0},
    {0, 1},
    {-1, 0},
    {-1, -1}
  },
  { //mirrored L
    {0, 0},
    {0, -1},
    {-1, 0},
    {-2, 0}
  },
  { //mirrored Z
    {0, 0},
    {0, -1},
    {-1, 0},
    {-1, 1}
  }
  };

  block(int x){

    int now = next;
    next = int(random(7));
    current = shapes;
    position = new PVector(x, 80);
    v = new PVector();
    a = new PVector();
    type = now;
  }

  void update(){

    if(!hit) a.add(t.gravity);
    v.add(a);
    position.add(v);
    a.mult(0);
  }

  void display(){

    fill(255);
    for(int i = 0; i < 4; i++){

      rect(
        current[type][i][1] * t.res + position.x,
        current[type][i][0] * t.res + position.y,
        t.res, t.res
      );
    }
  }

  void check(){ //vertical

    boolean blocked = false;
    if(!hit){

      for(int i = 0; i < 4; i++){

        if(position.y + current[type][i][0] * t.res >= height - t.res) blocked = true;
        else if(t.grid[int(position.y/t.res) + current[type][i][0] + 1][int(position.x/t.res) + current[type][i][1]] == 1) blocked = true;

        if(blocked){

          for(int j = 0; j < 4; j++){

            if(int(position.y/t.res) + current[type][j][0] >= 0){

              t.grid[int(position.y/t.res) + current[type][j][0]]
                    [int(position.x/t.res) + current[type][j][1]] = 1;
            }
          }
          hit = true;
          break;
        }
      }
    }
  }
}
