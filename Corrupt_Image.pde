// Coded initially in 2004 Benjamin Gaulon corrupt.recyclism.com // more info on www.recyclism.com //
// Feel free to use / modify / Share this //

  PImage img;
  String fileName = "test"; // You file name here (should be in the DATA Folder)
  String fileExt = ".jpg"; // file extansion (works best with JPG or PNG)

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
  saveBytes("./results/"+fileName + Integer.toString(j) + fileExt, bCopy);
   

  }

}


 


