public abstract class StageStuff{
    public int x, y;
    private Board board;
    private int type;
    public Board getBoard(){
	return board;
    }

    public StageStuff(){


    }
    
    public StageStuff(int xa, int ya){
	x = xa;
	y = ya;
    }

    public void settype(int i){
	type = i;
    }

    public int gettype(){
	return type;
    }


}
