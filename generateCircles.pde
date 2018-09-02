int num = 80;
Circle[] _circleArr = {};

void setup(){

	fullScreen();
	noCursor();
	background(255);
	smooth();
  blendMode(ADD);

	drawCircles();
}

void draw(){

	background(0);
	for(int i = 0; i < _circleArr.length; i++){

		Circle thisCirc = _circleArr[i];
		thisCirc.updateMe();
	}
}

void drawCircles(){

	for(int i = 0; i < num; i++){

		Circle thisCirc = new Circle();
		thisCirc.drawMe();
		_circleArr = (Circle[])append(_circleArr, thisCirc);
	}
}