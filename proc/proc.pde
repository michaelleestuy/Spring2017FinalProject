import java.util.*;
import java.io.*;

public void setup(){
  StageStuff[][] stage = new StageStuff[15][15];
  ArrayList<Movers> movers = new ArrayList<Movers>();
  arrr(stage, "mae.asdf");
  size(750, 750);
  for(int i = 0; i < 15; i++){
  	  for(int j = 0; j < 15; j++){
	  	  if(stage[i][j].gettype == 0){
		  	stroke(204, 102, 0);
		  	rect(50 * i, 50 * j, 50, 50);
		  }
		  else{
			stroke(153);
			point(50 * i + 25, 50 * j + 25);
		  }
	  }	  
  }
}

private void arrr(StageStuff[][] stage, String input){
	try{
		File infile = new File(input);
		Scanner inf = new Scanner(infile);
		for(int i = 0; i < 15; i++){
			for(int j = 0; j < 15; j++){
				char a = inf.nextChar();
				if(a == '#')
				     stage[i][j] = new Wall();
				if(a == '.')
				     stage[i][j] = new Dot();
			}			
		}		
	}
	catch(FileNotFoundException e){
				    System.out.println("File not found");
				    System.exit(0);
	}
	

}