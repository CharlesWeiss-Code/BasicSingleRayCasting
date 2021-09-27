class ray {
  PVector pos;
  PVector dir;
  PVector intPoint = new PVector (0,0);
  int l = 20;
  boolean intersectionP;
  ray(float x, float y) {
    pos = new PVector(x, y);
    dir = new PVector(1, 0);
  }

  void show() {
    push();
    ellipse(pos.x, pos.y, l, l);
    stroke(255, 0, 0);
    translate(pos.x, pos.y);
    dir.setMag(l);
    line(0, 0, dir.x, dir.y);
    pop();
  }

  void lookAt(float x, float y) {
    dir.x = x - pos.x;
    dir.y = y - pos.y;
    dir.normalize();
  }
  void intersect(boundary b) {
    float x1 = b.a.x;
    float y1 = b.a.y;
    float x2 = b.b.x;
    float y2 = b.b.y;

    float x3 = pos.x;
    float y3 = pos.y;
    float x4 = pos.x + dir.x;
    float y4 = pos.y + dir.y;

    float den = ((x1-x2) * (y3 - y4)) - ((y1 - y2)*(x3 - x4));
    if (den == 0) {
      return;
    } else {
      float t = (((x1 - x3) * (y3 - y4)) - ((y1 - y3) * (x3 - x4)))/den;
      float u = -(((x1 - x2) * (y1 - y3)) - ((y1 - y2) * (x1 - x3)))/den;
      if (t >= 0 && t <= 1 && u > 0) {
        intersectionP = true;
        intPointFider(x1, t, x2, y1, y2);
        push();
        stroke(255);
        strokeWeight(10);
        point(intPoint.x,intPoint.y);
        pop();
      } else {
        intersectionP = false;
      }
    }
  }


  PVector intPointFider(float x1, float t, float x2, float y1, float y2) {
    if (intersectionP) {
      intPoint.x = x1 + t*(x2-x1);
      intPoint.y = y1 + t*(y2-y1);
    }
    return intPoint;
  }
}
