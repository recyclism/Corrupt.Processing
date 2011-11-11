    import java.awt.image.BufferedImage;
  
    String fileName = "test"; // You file name here (should be in the DATA Folder)
    String fileExt = ".jpg"; // file extansion (works best with JPG or PNG)
    PImage img;
    void setup(){
      
    size(950,150);
    byte b[] = loadBytes(fileName + fileExt);
    
    for(int j = 0; j < 30; j ++) // change 30 to any value to generate more images
  
    {
      
  
       byte bCopy[] = new byte[b.length];
       arrayCopy(b, bCopy);
       // load binary of file
  
       int scrambleStart = 10;
       // scramble start excludes 10 bytes///
       
       int scrambleEnd = b.length;
       // scramble end ///
       
       int nbOfReplacements = int (random(1, 10));
       // Number of Replacements - Go easy with this as too much will just kill the file ///
  
       // Swap bits ///
       for(int i = 0; i < nbOfReplacements; i++)
  
       {
         int PosA = int(random (scrambleStart, scrambleEnd));
  
         int PosB = int(random (scrambleStart, scrambleEnd));
  
         byte tmp = bCopy[PosA];
  
         bCopy[PosA] = bCopy[PosB];
  
         bCopy[PosB] = tmp;
  
       }
  
      
    // Save the file  in "corrupted" folder ///
    saveBytes("./temp/"+fileName + Integer.toString(j) + fileExt, bCopy);
  
      try
  
      {
  
        PImage myImage = loadImage("./temp/"+fileName + Integer.toString(j) + fileExt); 
        size (myImage.width,myImage.height);
        image(myImage, 0, 0);
        saveFrame("./results/"+ fileName + Integer.toString(j) + fileExt);
  
      }
  
      catch (Exception e)
  
      {
  
        System.err.println("error while opening and saving the image " + fileName + Integer.toString(j) + fileExt);
        e.printStackTrace();
  
      } 
  
  
    }
  
  
  }
  
  
  
  
  
  // save IMAGE hacked by Martin and Koenie 
  
  public void save(String filename) { 
  
    BufferedImage img = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB); 
    img.setRGB(0, 0, width, height, pixels, 0, height); 
    String extn = filename.substring(filename.lastIndexOf('.') + 1).toLowerCase(); 
  
    if (extn.equals("jpg") || extn.equals("png"))
  
    {  // add here as needed 
  
      try {javax.imageio.ImageIO.write(img, extn, new File(filename));}
      catch (Exception e)
  
        {System.err.println("error while saving as " + extn);
  
         e.printStackTrace();} 
  
    }
  
    else {super.save(filename);} 
  
  } 
