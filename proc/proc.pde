public void setup(){
  StageStuff[][] stage = new StageStuff[15][15];
  ArrayList<Movers> movers = new ArrayList<Movers>();
  arrr(stage, "mae.asdf"); 
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