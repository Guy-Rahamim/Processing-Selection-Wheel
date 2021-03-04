class SelectionWheel
{
  // String[] names;
  ArrayList<String> names;
  ArrayList<Text> texts;
  ArrayList<Line> lines;
  Ellipse frame;

  ArrayList<String> removed;
  int angle;
  boolean rotatable;

  int numberOfRotations;

  public SelectionWheel()
  {
    rotatable=true;

    texts= new ArrayList<Text>();
    lines= new ArrayList<Line>();
    names= new ArrayList<String>();
    removed= new ArrayList<String>();

    generateNameList();


    frame= new Ellipse();

    generateWheel();
    drawWheel();
    stopRotation();
  }


  void generateNameList()
  {
    String[] names2= loadStrings("kids.txt");
    for (String name : names2)
    {
      names.add(name);
    }
  }

  void generateWheel()
  {
    if (names.size()==0)
      return;


    rotatable=true;
    angle= (int) 360/names.size();
    texts= new ArrayList<Text>();
    lines= new ArrayList<Line>();

    if (names.size()==1)
    {
      texts.add(new Text());
      texts.get(0).text= names.get(0);
      texts.get(0).x=width/2;
      texts.get(0).y=height/2;
      texts.get(0).textSize=25;
      return;
    }

    for (int i=0; i<names.size(); i++)
    {
      texts.add(new Text());
      texts.get(i).text="         " +names.get(i) + "          ";
      texts.get(i).rotation=angle*(i+1);
      texts.get(i).x=width/2;
      texts.get(i).y=height/2;
      texts.get(i).textSize=25;

      lines.add(new Line());
      lines.get(i).x1=width/2;
      lines.get(i).y1=height/2;
      lines.get(i).x2=lines.get(i).x1+220;
      lines.get(i).y2=lines.get(i).y1;
      lines.get(i).penThickness=5;
      lines.get(i).rotation= angle*(i+1)+(angle/names.size());

      frame.x=width/2;
      frame.y=height/2;
      frame.radiusX=220;
      frame.radiusY=220;
      frame.penThickness=10;
      frame.brush=color(100, 100, 100);
    }
  }



  void drawWheel()
  {
    frame.draw();

    for (Text text : texts)
      text.draw();

    for (Line line : lines)
      line.draw();
  }




  void rotate()
  {
    stopRotation();
    if (rotatable)
    {
      for (int i =0; i<2; i++)
      {
        for (Text text : texts)
        {
          text.rotation++;
          text.rotation%=360;
        }

        for (Line line : lines)
        {
          line.rotation++;
          line.rotation%=360;
        }
      }
      updateNumberOfRotations();
    }
    drawWheel();
  }



  void stopRotation()
  {
    int random= (int) random(texts.size());
    if (numberOfRotations>2)
    {
      if (texts.get(random).rotation==0)
      {
        removed.add(texts.get(random).text.replaceAll(" ", ""));
        rotatable=false;
      }
    }
  }



  void updateNumberOfRotations()
  {
    if (texts.get(0).rotation==0)
    {
      numberOfRotations++;
    }
  }




  void regenerateWheel()
  {
    if (!rotatable)
    {
      names.removeAll(removed);
      generateWheel();
    }
  }
}
