
package com.yourcompany.struts.action;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import CDB.Article;
import CDB.Inventaire;

import com.yourcompany.struts.form.InvHistoriqueForm;


public class InvHistoriqueAction extends Action {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		InvHistoriqueForm invHistoriqueForm = (InvHistoriqueForm) form;// TODO Auto-generated method stub
		
		//Getting Inventory quantity of the last t
		String 	DateI = "0000-00-00", 
				DateX = invHistoriqueForm.getDate(); 
		
		int QteArtInv   = 0, 
			QteArtAch  = 0, 
			QteArtVte  =0 ;
		
		ArrayList<Article> article = new ArrayList<Article>();
		ArrayList<Inventaire> lastInventaire = new ArrayList<Inventaire>();
		
		// Getting all articles
		ResultSet LastInventaire , LastPrurchase, lastSale,  articles = CDB.Acess_donner.selection("SELECT * FROM `articles`", "g_vente");
		while(articles.next()){
			article.add(new Article(articles.getInt("codeArt"),articles.getString("nomArt"),articles.getInt("prixArt"),articles.getString("descArt")));
		}
		
		// Getting last inventory
		for(int i = 0 ; i < article.size(); ++i){
			LastInventaire = CDB.Acess_donner.selection("SELECT * FROM `inventaire` WHERE `codeArt` = '"+article.get(i).codeArt+"'", "g_stock");
			while(LastInventaire.next()){
				if(LastInventaire.getString("dateInv").compareTo(DateI)>0 && LastInventaire.getString("dateInv").compareTo(DateX)<=0){
					DateI = LastInventaire.getString("dateInv");
					QteArtInv   = LastInventaire.getInt("qteArt");
				}
			}
			// Adding inventory with latest date to arrayList<Inventaire>
			lastInventaire.add(new Inventaire(0,article.get(i).codeArt,article.get(i).nomArt,article.get(i).descArt,QteArtInv,article.get(i).prixArt,DateI ));
			QteArtInv   = 0;
			DateI = "0000-00-00";
		}
		
		 
		for(int i = 0; i <lastInventaire.size(); ++i ){
			
			// Getting Purchase
			LastPrurchase = CDB.Acess_donner.selection("SELECT * FROM `achats` WHERE `codeArt` = '"+lastInventaire.get(i).codArt+"'", "g_stock");
			while(LastPrurchase.next()){
				if(LastPrurchase.getString("dateReception").compareTo(lastInventaire.get(i).dateInv)>0 && LastPrurchase.getString("dateReception").compareTo(DateX)<=0){
					QteArtAch   += LastPrurchase.getInt("qteAchete");
				}
			}

		
			// Getting Sales 	
			lastSale = CDB.Acess_donner.selection("SELECT * FROM `commandes` WHERE `codeArt` = '"+lastInventaire.get(i).codArt+"'", "g_vente");
			while(lastSale.next()){
				if(lastSale.getString("dateCmd").compareTo(lastInventaire.get(i).dateInv)>0 && lastSale.getString("dateCmd").compareTo(DateX)<=0){
					QteArtVte   += lastSale.getInt("qteCmd");
				}
			}
			
			// Updating amount in arrayList<Inventaires>
			lastInventaire.get(i).setQteArt( lastInventaire.get(i).qteArt + QteArtAch - QteArtVte );
			
			//
			QteArtAch  = 0; QteArtVte  =0 ;
		}
		
		// Saving inventory data into the session ...
		HttpSession Session = request.getSession();
		Session.setAttribute("invHistorique", lastInventaire);
		Session.setAttribute("date", DateX);
		
		
		
		return mapping.findForward("success");
	}
}