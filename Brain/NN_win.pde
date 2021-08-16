class PWindow extends PApplet
{
  PWindow()
  {
    super();
    PApplet.runSketch(new String[] {this.getClass().getSimpleName()}, this);
  }
  
  class Layer
  {
    int nodes;
    int x;
    int y;
    int interval;
    int wid;
    boolean shwLbl;
    int[] arr;
    Layer(int n, int _y, boolean shw_label, int[] _arr)
    {
      arr = _arr;
      shwLbl = shw_label;
      nodes = n;
      interval = int(width / (nodes+1));
      x = interval+10;
      y = _y;
    }
    
    
    void disp()
    {
      int z = x;
      for(int i=0; i<nodes; i+= 1)
      {
        if(arr[i] == 0)noFill();
        else fill(255,0,0);
        strokeWeight(1.5);
        stroke(0,255,255);
        circle(z,y,20);
        if(shwLbl)
        {
          textSize(25);
          fill(255,255,0);
          text(str(i),z-7,y+40);
        }
        z += interval;
      }
      
    }
  }
  
  Layer l, l1, l2, l3, l4;
  void settings()
  {
    size(1340, 700);
  }
  
  void setup()
  {
    l = new Layer(25,20,false,retina);
    l1 = new Layer(30,200,false,V1);
    l2 = new Layer(46,350,false,V2);
    l3 = new Layer(56,500,false,V4);
    l4 = new Layer(10,650,true,IT);
    //colorMode(HSB,1);
  }
  void connections(Layer send, Layer receive)
  {
    int zi = send.x;
    for(int i=0; i<send.nodes; i += 1)
    {
      int zj = receive.x;
      for(int j=0; j<receive.nodes; j += 1)
      {
        if(send.arr[i] == 1 && receive.arr[j] == 1)
        {
          stroke(255,0,0,100);
          line(zi,send.y,zj,receive.y);
        }
        zj += receive.interval;
      }
      zi += send.interval;
    }
  }
  
  
  void draw()
  {
    image(img,0,0);
    connections(l,l1);
    connections(l1,l2);
    connections(l2,l3);
    connections(l3,l4);
    l.disp();
    l1.disp();
    l2.disp();
    l3.disp();
    l4.disp(); 
    
    //noLoop();
  }
}
