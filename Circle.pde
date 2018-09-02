class Circle{

	float x, y;
	float radius;
	color linecol, fillcol;
	float xmove, ymove;

	Circle(){

        x       = random(width);
        y       = random(height);
        radius  = random(100) + 30;
        linecol = color(random(255), random(255), random(255));
        fillcol = color(random(255), random(255), random(255));
        xmove   = random(10) - 5;
        ymove   = random(10) - 5;
	}

	void drawMe(){
		
		fill(fillcol);
		strokeWeight(1);
		stroke(linecol, 100);
		ellipse(x, y, 10, 10);
	}

	void updateMe(){

		x += xmove;
		y += ymove;
		if(x > (width + radius)){x = 0 - radius;}
		if(x < (0 - radius)){x = width + radius;}
		if(y > (height + radius)){y = 0 - radius;}
		if(y < (0 - radius)){y = height + radius;}

		for(int i = 0; i < _circleArr.length; i++){

			Circle otherCirc = _circleArr[i];

			if(otherCirc != this){
  
				float dis     = dist(x, y, otherCirc.x, otherCirc.y);
				float overlap = dis - radius - otherCirc.radius;
                
				if(overlap < 0){

				   float midx, midy;
					 midx = (x + otherCirc.x) / 2;
					 midy = (y + otherCirc.y) / 2;
					
					noFill();
					overlap *= -1;
					ellipse(midx, midy, overlap, overlap);
					line(midx, midy, x, y);
				}
			}
		}

		drawMe();
	}
}