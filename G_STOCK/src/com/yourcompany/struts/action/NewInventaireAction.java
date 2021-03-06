/*
 * Generated by MyEclipse Struts
 * Template path: templates/java/JavaClass.vtl
 */
package com.yourcompany.struts.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import CDB.Acess_donner;

import com.yourcompany.struts.form.NewInventaireForm;

public class NewInventaireAction extends Action {
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
			NewInventaireForm NewInventaireForm = (NewInventaireForm) form;// TODO Auto-generated method stub
		
			// Obtenir les donn�es a partir du formulaire 
			int codeArt = Integer.parseInt(NewInventaireForm.getNom());
			int qteArt = Integer.parseInt(NewInventaireForm.getQuantite());
			String descInv = NewInventaireForm.getDescription();
			String dateInv = NewInventaireForm.getDate();
			
			// Ins�rer les nouveaux donn�es dans la base de donn�es
			int isAdded = CDB.Acess_donner.mise_ajour("INSERT INTO `inventaire`(`codeArt`, `qteArt`, `descInv`, `dateInv`) VALUES ('"+codeArt+"','"+qteArt+"','"+descInv+"','"+dateInv+"')","g_stock");
			
			// Obtention d'une session 
			HttpSession Session = request.getSession();
			
			// Si "added" retourne "success" , afficher "alert"
			if(isAdded != 0){
				Session.setAttribute("alert", "Ajouter");
			} else {
				Session.setAttribute("alert", "AjouterF");
			}
		return mapping.findForward("success");
	}
}