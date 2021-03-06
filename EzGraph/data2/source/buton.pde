class buton {
  float x,y,r;
  String s;
  color cFill=c1,cFill_o=c1_o;
  boolean pressed=false;
  
  buton(float x_,float y_,float r_,String s_) {
    x=x_;
    y=y_;
    r=r_;
    s=s_;
  }
  
  void display() {
    if (s=="Delete graph") {
      if (dist(mouseX,mouseY,x,y)<r) {
        if (r<(R+R/4)/2) r+=2;
        if (mousePressed && delay==0) {
          delay=DELAY;
          for (int i=questions[questionActive].nGrafs-1;i>=0;i--)
            delete_point(questions[questionActive].g[i],questionActive);
        }
        fill(cFill_o);
      }
      else {
        fill(cFill);
        if (r>R/2) r-=2;
      }
    }
    else
      if (dist(mouseX,mouseY,x,y)<r || butonActive==s) {
        fill(cFill_o);
        if (r<(R+R/4)/2) r+=2;
        if (mousePressed)
          butonActive=s;
      }
      else {
        fill(cFill);
        if (r>R/2) r-=2;
      }
    
    noStroke();
    ellipse(x,y,r*2,r*2);
    
    fill(-1);
    textAlign(CENTER,CENTER);
    textSize(r/2.5);
    //text(s,x-2*r,y+r,r*4,r);
    if(s.equals("Delete graph")) text("Sterge graf",x-2*r,y+r,r*4,r);
    else if(s.equals("Add point")) text("Adauga nod",x-2*r,y+r,r*4,r);
    else if(s.equals("Add edge")) text("Adauga muchie",x-2*r,y+r,r*4,r);
    else if(s.equals("Delete point")) text("Sterge nod",x-2*r,y+r,r*4,r);
    else if(s.equals("Delete edge")) text("Sterge muchie",x-2*r,y+r,r*4,r);
    else if(s.equals("Move")) text("Misca",x-2*r,y+r,r*4,r);
    fill(128,128,128);
  }

  void mousePress(){
    if (s=="Delete graph") {
      if (dist(mouseX,mouseY,x,y)<r) {
        delay=DELAY;
        for (int i=questions[questionActive].nGrafs-1;i>=0;i--)
          delete_point(questions[questionActive].g[i],questionActive);
      }
    }
    else
      if (dist(mouseX,mouseY,x,y)<r || butonActive==s)
        butonActive=s;
  }
}

void display_all_butons() {
  move.display();
  deleteEdge.display();
  deletePoint.display();
  addEdge.display();
  addPoint.display();
  deleteGraf.display();
}
