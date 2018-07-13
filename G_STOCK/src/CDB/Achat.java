package CDB;

public class Achat {
	
	
	public int codeAchat;
	public int codArt;
	public String nomArt;
	public String descArt;
	public int qteAchete;
	public double prixArt;
    public String dateReception;
    
    
    public Achat(int ca , int car, String na, String ds, int qa, double pa  , String da){
    	this.codeAchat = ca;
    	this.codArt = car;
    	this.nomArt = na;
    	this.descArt = ds;
    	this.qteAchete = qa;
    	this.prixArt = pa;
    	this.dateReception = da;
 
    	
    }
}
