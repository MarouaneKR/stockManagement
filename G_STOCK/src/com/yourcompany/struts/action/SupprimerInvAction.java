package com.yourcompany.struts.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import com.yourcompany.struts.form.SupprimerInvForm;

public class SupprimerInvAction extends Action  {

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception{
		SupprimerInvForm supprimerInvForm = (SupprimerInvForm) form;// TODO Auto-generated method stub
			
			// Deleting from database
			int isDeleted = CDB.Acess_donner.mise_ajour("DELETE FROM `inventaire` WHERE `codeInv`= '"+supprimerInvForm.getCodeInv()+"'","g_stock");
			
			// Getting session
			HttpSession Session = request.getSession();
			
			// if deleted return success else fail
			if(isDeleted != 0){
				Session.setAttribute("alert", "Supprimer");
			} else {
				Session.setAttribute("alert", "SupprimerF");
			}
			System.out.println(Session.getAttribute("alert"));
		return mapping.findForward("success");
	}
}