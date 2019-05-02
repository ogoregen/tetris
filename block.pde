
class block{

  PVector position, v, a;
  boolean hit;
  int type;

  int[][][] shapes = {
  { //square
    {0, 0},
    {0, -1},
    {-1, 0},
    {-1, -1}
  },
  { //L
    {0, 0},
    {0, -1},
    {-1, -1},
    {-2, -1}
  },
  { //I
    {0, 0},
    {-1, 0},
    {-2, 0},
    {-3, 0}
  },
  { //T
    {0, 0},
    {-1, 0},
    {-1, 1},
    {-2, 0}
  },
  { //Z
    {0, 0},
    {0, -1},
    {-1, -1},
    {-1, -2}
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

    position = new PVector(x, 0);
    v = new PVector();
    a = new PVector();
    type = int(random(8));
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
        shapes[type][i][1] * t.res + position.x,
        shapes[type][i][0] * t.res + position.y,
        t.res, t.res
      );
    }
  }

  void check(){

    boolean blocked = false;
    if(!hit){

      for(int i = 0; i < 4; i++){

        if(position.y >= height - t.res) blocked = true;
        else if(position.y > 3 * t.res && t.grid[int(position.y/t.res) + shapes[type][i][0] + 1][int(position.x/t.res) + shapes[type][i][1]] == 1) blocked = true;
        if(blocked){

          for(int j = 0; j < 4; j++){

            t.grid[int(position.y/t.res) + shapes[type][j][0]][int(position.x/t.res) + shapes[type][j][1]] = 1;
          }
          hit = true;
          break;
        }
      }
    }
  }
}
