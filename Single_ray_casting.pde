boundary bound;
ray r;

void setup() {
  size(600, 400);
  bound = new boundary(random(width), random(height), random(width), random(height));
  r = new ray(width/2, height/2);
}

void draw() {
  background(0);
  bound.show();
  r.lookAt(mouseX, mouseY);
  r.show();
  r.intersect(bound);
}
