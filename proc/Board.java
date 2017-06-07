import java.util.*;
import java.io.*;

public class Board{
    private StageStuff[][] board;
    private int score;
    private int time;

    public static StageStuff[][] arrr( String input){
	StageStuff[][]stage = new StageStuff[15][15];
	try{
	    Scanner sc = new Scanner(new File(input));
	    for(int i = 0; i < 15; i++){
		for(int j = 0; j < 15; j++){
		    if(sc.next().equals("#"))
			stage[i][j] = new Wall();
		    else{
			stage[i][j] = new Food();
		    }
		}
	    }
	    return stage;
	}
	catch(FileNotFoundException c){
	    System.out.println("File not found");
	    return stage;
	}

    }

    
    public static void main(String[]args){
	StageStuff[][] stage = arrr("mae.txt");

    }

}
