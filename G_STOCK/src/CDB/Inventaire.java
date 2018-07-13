package CDB;

public class Inventaire {
	public int codeInv;
	public int codArt;
	public String nomArt;
	public String descInv;
	public int qteArt;
	public double prixArt;
    public String dateInv;
    
    
    public Inventaire(int ci , int ca, String na, String ds, int qa, double pa  , String di){
    	this.codeInv = ci;
    	this.codArt = ca;
    	this.nomArt = na;
    	this.descInv = ds;
    	this.qteArt = qa;
    	this.prixArt = pa;
    	this.dateInv = di;
 
    	
    }


	public void setQteArt(int qteArt) {
		this.qteArt = qteArt;
	}

}
