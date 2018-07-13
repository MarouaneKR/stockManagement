package CDB;

import java.sql.*;
import java.util.ArrayList;

import CDB.Article;


public class Methodes {
	
	// Returns inventories  
	public static ArrayList<Inventaire> getInventaire() throws Exception{
		
		// Getting articles and inventory
		ResultSet rs = Acess_donner.selection("SELECT * FROM `articles` ", "g_vente");
		ResultSet inventaires = Acess_donner.selection("SELECT * FROM `inventaire`", "g_stock");
		
		// creating new arrayLists of type article and inventaire (result) !
		ArrayList<Article> Articles = new ArrayList<Article>();
		ArrayList<Inventaire> Result = new ArrayList<Inventaire>();
		
		// Saving all article in the array<article>
		while(rs.next()){ 
			System.out.println(rs.getInt("codeArt")+"  "+rs.getString("nomArt")+" "+rs.getInt("prixArt"));
			Articles.add(new Article(rs.getInt("codeArt"),rs.getString("nomArt"),rs.getInt("prixArt"),rs.getString("descArt")));	
		}
		
		// Matching the article informations (price , name , description ... ) with the inventory information (date , qunatity ...)
		while(inventaires.next()){ 
			for(int i = 0; i< Articles.size() ; ++i){
				if(inventaires.getInt("codeArt")==Articles.get(i).codeArt ){
					Result.add(new Inventaire(inventaires.getInt("codeInv"),
											  Articles.get(i).codeArt,
											  Articles.get(i).nomArt,
											  inventaires.getString("descInv"),
											  inventaires.getInt("qteArt"),
											  Articles.get(i).prixArt,
											  inventaires.getString("dateInv")				  
											));
				}
			}
		}
		
		return Result;
	}
	
	
	// Returns purchases
	public static ArrayList<Achat> getAchat() throws Exception{
		
		// Getting articles and purchases
		ResultSet rs = Acess_donner.selection("SELECT * FROM `articles` ", "g_vente");
		ResultSet achats = Acess_donner.selection("SELECT * FROM `achats`", "g_stock");
		
		// creating new arrayLists of type article and achat (result) !
		ArrayList<Article> Articles = new ArrayList<Article>();
		ArrayList<Achat> Result = new ArrayList<Achat>();
		
		// Saving all article in the array<article>
		while(rs.next()){ 
			System.out.println(rs.getInt("codeArt")+"  "+rs.getString("nomArt")+" "+rs.getInt("prixArt"));
			Articles.add(new Article(rs.getInt("codeArt"),rs.getString("nomArt"),rs.getInt("prixArt"),rs.getString("descArt")));	
		}
		
		// Matching the article informations (price , name , description ... ) with the purchase information (date , qunatity ...)
		while(achats.next()){ 
			for(int i = 0; i< Articles.size() ; ++i){
				if(achats.getInt("codeArt")==Articles.get(i).codeArt ){
					Result.add(new Achat(achats.getInt("codeAchat"),
											  Articles.get(i).codeArt,
											  Articles.get(i).nomArt,
											  Articles.get(i).descArt,
											  achats.getInt("qteAchete"),
											  Articles.get(i).prixArt,
											  achats.getString("dateReception")				  
											));
				}
			}
		}
		
		return Result;
	}
	
	
	
}
