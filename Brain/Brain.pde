int[] retina;
int[] V1;
int[] V2;
int[] V4;
int detected = 100;
void setup()
{
  size(500,600);
  retina = new int[25];
  V1 = new int[30];
  V2 = new int[46];
  V4 = new int[56];
  fresh();
}

void fresh()
{
  background(0);
  grid(5,5);
  for(int i=0; i<retina.length; ++i)retina[i] = 0;
  for(int i=0; i<V1.length; ++i)V1[i] = 0;
  for(int i=0; i<V2.length; ++i)V2[i] = 0;
  for(int i=0; i<V4.length; ++i)V4[i] = 0;  
}

void dispArr(int[] arr)
{
  for(int i=0; i<arr.length; ++i)
  {
    println( i, ":", arr[i]);
  }
  println("");
}

void grid(int r, int c)
{
  int w = width;
  int h = height-100;
  stroke(255);
  for(int x=0; x<=w; x += w/r)
  {
    line(x, 0, x, h);
  }
  for(int y=0; y<=h; y += h/c)
  {
    line(0, y, w, y);
  }
}


void fillRetina()
{
  int x = mouseX/100;
  int y = mouseY/100;
  rect(x*100,y*100,100,100);
  int loc = x + y * 5;
  retina[loc] = 1;
  fillV1();
  
}

void fillV1()
{
  
  int indx = 0;
  for(int i=0; i<=20; i+=5)
  {
    for(int j=0; j<3; ++j)
    {
      if(retina[i+j] == 1 && retina[i+j+1] == 1 && retina[i+j+2] == 1)
      {
        V1[indx] = 1;
      }
      ++indx;
    }
  }
  
  for(int i=0; i<15; ++i)
  {
    
    if(retina[i] == 1 && retina[i+5] == 1 && retina[i+10] == 1)
    {
      V1[15+i] = 1;
    }
  }
  fillV2();
  
}


void fillV2()
{
  int i = 0;
  int j = 15;
  int V2len = (V2.length);
  int lim  = ((V2len/2)-6);
  for(int index=0; index<V2len-10; ++index)
  {
    if(V1[i] == 1 && V1[j] == 1)
    {
      V2[index] = 1;
    }
    //println(index, ":", i, ", ", j);
    if(j == 29)j = 14;
    if(index % 2 != 0)
    {
      if(index == lim)
      {
        i = i-2;
      }
      else ++i;
      if((index+1)%6 == 0)
      {
        j += 1;
      }
      else j -= 1;
    }
    else
    {
      j += 2;
    }
  }
  int base = 14;
  for(int reti=0; reti<5; ++reti)
  {
    base = base + 1;
    if(V1[base + 0] == 1 || V1[base + 5] == 1 || V1[base + 10] == 1)V2[(V2len-10)+reti]=1;
  }
  
  base = -3;
  for(int reti=0; reti<5; ++reti)
  {
    base = base + 3;
    if(V1[base + 0] == 1 || V1[base + 1] == 1 || V1[base + 2] == 1)V2[(V2len-5)+reti] = 1;
  }
  fillV4();
  
}

void fillV4()
{
  int j = 0;
  
  //////////////////////////////////////////////////////////////////////////////////////////
  // 0 TO 8
  for(int i=0; i <= 16; i+=2,++j)
  {
    if(V2[i] == 1 && V2[i+19] == 1)
    {
      V4[j] = 1;
    }
  }


  // 9 TO 17
  for(int i=0; i<=16; i+=2,++j)
  {
    if((V2[i+0] == 1 && V2[i+18] == 1) || (V2[i+0] == 1 && V2[i+1] == 1) || (V2[i+1] == 1 && V2[i+19] == 1) || (V2[i+18] == 1 && V2[i+19] == 1))
    {
      V4[j] = 1;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////  
  // 18 TO 20
  for(int i=0; i<=4; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+13] == 1)
    {
      V4[j] = 1;
    }
  }


  // 21 TO 23
  for(int i=1; i<=5; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+11] == 1)
    {
      V4[j] = 1;
    }
  }

  //////////////////////////////////////////////////////////////////////////////////////////
  // 24 TO 26
  for(int i=18; i<=22; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+13] == 1)
    {
      V4[j] = 1;
    }
  }
  
  // 27 TO 29
  for(int i=19; i<=23; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+11] == 1)
    {
      V4[j] = 1;
    }
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////  
  // 30 TO 32
  for(int i=13; i<=17; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+5] == 1)
    {
      V4[j] = 1;
    }
  }
  
  // 33 TO 35
  for(int i=12; i<=16; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+7] == 1)
    {
      V4[j] = 1;
    }
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////  
  // 36 TO 38
  for(int i=0; i<=4; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+30] == 1)
    {
      V4[j] = 1;
    }
  }
  
  // 39 TO 41
  for(int i=1; i<=5; i+=2, ++j)
  {
    if(V2[i] == 1 && V2[i+30] == 1)
    {
      V4[j] = 1;
    }
  }
  
  //////////////////////////////////////////////////////////////////////////////////////////
  
  //Avoid adding more
  
  //////////////////////////////////////////////////////////////////////////////////////////  
  // 42 TO 51 (start Vertical top left towards right)
  for(int i=0; i<10; ++i,++j)
  {
    if(V2[((V2.length - 10)+i)] == 1)
    {
      V4[j] = 1;
    }
  }
  //////////////////////////////////////////////////////////////////////////////////////////
  // 52 TO 55
  for(int i=0; i<4; ++i,++j)
  {
    boolean angle = false;
    int k;
    if(i == 0 || i == 1)k = i;
    else if(i == 2)k = 18;
    else k = 19;
    for( ; k<=(i+16); k+=2)
    {
      if(V2[k] == 1)angle = true;
      if(angle)break;
    }
    if(angle)V4[j] = 1;
    else V4[j] = 0;
  }
  
  
  
}

void detectIT()
{
  
  int V4len = V4.length;
  ////////////////////////////////////////////////////////////////////////
  int overall = 0;
  for(int i=0; i<V4len; ++i)
  {
    if(V4[i] == 1)overall += 1;
  }
  
  ///////////////////////////////////////////////////////////////////////
  int ignrLines = 0;
  for(int i=0; i<V4len-14; ++i)
  {
    if(V4[i] == 1)ignrLines += 1;
  }
  int angle = 0;
  for(int i=0; i<4; ++i)
  {
    if(V4[i+52] == 1)angle += 1;
  }
  
  ////////////////////////////////////////////////////////////////////////
  
  int lines = (overall - (ignrLines+angle));
  
  ////////////////////////////////////////////////////////////////////////
  int cnt = 0;
  for(int i=0; i<9; ++i)
  {
    if(V4[i] == 1)
    {
      cnt += 1;
    }
  }
  
  // 0
  if(cnt == 1 && ignrLines == 2)
  {
    detected = 0;
    return;
  }
  else if((ignrLines-2) == 2)
  {
    for(int i=36; i<=38; ++i)
    {
      if(V4[i] == 1 && V4[i+3] == 1)
      {
        detected = 0;
        return;
      }
    }
  }
  else
  {
    if(ignrLines == 2 && lines == 4)
    {
      for(int i=9; i<=14; ++i)
      {
        if(V4[i] == 1 && V4[i+3] == 1)
        {
          if((i % 3 == 0) && (V4[42] == 1 && V4[44] == 1))
          {
            detected = 0;
            return;
          }
          else if(((i-1) % 3 == 0) && (V4[43] == 1 && V4[45] == 1))
          {
            detected = 0;
            return;
          }
          else if(((i-2) % 3 == 0) && (V4[44] == 1 && V4[46] == 1))
          {
            detected = 0;
            return;
          }
        }
      }
    }
  }
  
  
  
  if(cnt == 1)
  {
    // 9
    for(int i=0; i<3; ++i)
    {
      if(V4[i] == 1 && V4[i+18] == 1 && V4[i+21] != 1)
      {
        detected = 9;
        return;
      }
    }
    
    // 6
    for(int i=0; i<3; ++i)
    {
      if(V4[i+6] == 1 && V4[i+30] == 1 && V4[i+33] != 1)
      {
        detected = 6;
        return;
      }
    }
  }


  // 8
  if(cnt == 2)
  {
    for(int i=0; i<3; ++i)
    {
      if(V4[i] == 1 && V4[i+6] == 1)
      {
        detected = 8;
        return;
      }
    }
  }
  
  if(cnt == 0)
  {
    if(lines == 5 && ignrLines == 5)
    {
      for(int i=0; i<3; ++i)
      {
        // 2
        if(V4[i+21] == 1 && V4[i+27] == 1)
        {
          detected = 2;
          //return;
        }
        // 5
        else if(V4[i+18] == 1 && V4[i+24] == 1)
        {
          detected = 5;
          return;
        }
      }
    }
    else if(lines == 3)
    {
      for(int i=0; i<3; ++i)
      {
        // 4
        if(V4[i+30] == 1 && V4[i+9] == 1)
        {
          detected = 4;
          return;
        }
      }
    }
    
    else if(ignrLines == 3 && lines == 4)
    {
      for(int i=0; i<3; ++i)
      {
        // 3
        if(V4[i+39] == 1 && V4[i+9] == 1)
        {
          detected = 3;
        }
      }
    }

  }

  if(lines == 1)
  {
    // 1
    detected = 1;
    return;
  }
  if(lines == 2 && V4[53] == 1)
  {
    // 7
    detected = 7;
    return;
  }
  detected = 100;
  println("Can't be identified");
  println("overall: ", overall, "ignrLines: ", ignrLines, "lines: ",lines, "cnt: ", cnt);

}



void draw()
{
  
  
  fill(255,0,0);
  noStroke();
  if(mousePressed && mouseY < (height-100))
  {
    fillRetina();
  }
  
}

void updt()
{
  detectIT();
  fill(0);
  rect(height-100,0,width,height);
  fill(255);
  textSize(40);
  if(detected == 100)text("Detected: Not a Number",0,height-50);
  else text("Detected: "+str(detected),0,height-50);
}

void keyPressed()
{
  if(key == 'e' || key == 'E')fresh();
  else if(key == 'd' || key == 'D')dispArr(retina);
  else if(key == 'r' || key == 'R')dispArr(retina);
  else if(key == 'f' || key == 'F')fillV1();
  else if(key == '1')dispArr(V1);
  else if(key == '2')dispArr(V2);
  else if(key == '3')fillV2();
  else if(key == '4')dispArr(V4);  
  else if(key == ENTER)updt();
}
