float cX,cY;
float scale,rotate;
int offsetX,offsetY;
int divisions = 6;
float R = 0;
PrintWriter output;
int MINIMUM_SEGMENTS = 2;
int MAXIMUM_SEGMENTS = 7;
void setup(){
//  output = createWriter("positions.txt");
  size( 796, 1036 );
  strokeWeight( 3 );
  frameRate( 2 );
  background(250);
  stroke(25,25,25);
}

void GlyphRadial(int index,int divisor, int offsetX, int offsetY) {
   //Center to Point on Circle
     line(cX+offsetX,cY+offsetY,(scale*cos((index*(TAU/divisor))+rotate))+cX+offsetX,(scale*sin((index*(TAU/divisor))+rotate)+cY+offsetY));
    // output.print("PU"+10*((int(cX+offsetX)))+","+(10*(int(cY+offsetY)))+";");
    // output.println("PD"+(10*(int((scale*cos((index*(TAU/divisor))+rotate))+cX+offsetX)))+","+(10*(int(scale*sin((index*(TAU/divisor))+rotate)+cY+offsetY)))+";");
}

void GlyphSegment(int index,int divisor, int offsetX, int offsetY) {
   //Point on Circle to Next Point on Circle
     line((scale*cos((index*(TAU/divisor))+rotate))+cX+offsetX,(scale*sin((index*(TAU/divisor))+rotate)+cY+offsetY),
          (scale*cos(((index+1)*(TAU/divisor))+rotate))+cX+offsetX,(scale*sin(((index+1)*(TAU/divisor))+rotate)+cY+offsetY));
    //output.print("PU"+(10*(int((scale*cos((index*(TAU/divisor))+rotate))+cX+offsetX)))+","+(10*(int(scale*sin((index*(TAU/divisor))+rotate)+cY+offsetY)))+";");
    //output.println("PD"+(10*(int((scale*cos(((index+1)*(TAU/divisor))+rotate))+cX+offsetX)))+","+(10*(int(scale*sin(((index+1)*(TAU/divisor))+rotate)+cY+offsetY)))+";");
}
 


void Glyph(int offsetX, int offsetY) {
  IntList GlyphLine;
   GlyphLine = new IntList();
   
   for(int a=0;a<=(divisions*2);a++) {
      GlyphLine.append(a);
   }
   
   GlyphLine.shuffle();



     
     
  for(int b=0;b<int(random(MINIMUM_SEGMENTS,MAXIMUM_SEGMENTS));b++) {
      if(GlyphLine.get(b) <= divisions) {
        GlyphRadial(GlyphLine.get(b),divisions,offsetX,offsetY);
      } else {
        GlyphSegment((GlyphLine.get(b)-divisions),divisions,offsetX,offsetY);  
      }
}
}

void draw(){

  int spacing = 25;
  cX=40;
  cY=40;
  scale=9.0;
  rotate=R;
   
  //output.println("IN;SP1;");
  for(int y = 10;y<960;y=y+spacing) {
  for(int x = 10;x<720;x=x+spacing) {
  
    // Uncomment for random rotation
  
  //  R = random(0,1);     
  //  if(R < .25 ) {
  //    rotate = 0;
  //  } else if((R >= .25) && (R < .5)) {
  //    rotate = PI/6;
  //  } else if((R >= .5) && (R < .75)) {
  //    rotate = PI;
  //  } else {
  //    rotate = -(PI/6);
  //  }
  
    //rotate=.05*PI+R;
    //R=R+.1;
    Glyph(x,y);
  }}
  //output.println("PU;SP0;");
  //output.flush();  // Writes the remaining data to the file
  //output.close();  // Finishes the file
  stop();
}
