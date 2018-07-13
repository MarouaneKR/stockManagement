
package login;

import java.sql.ResultSet;

import javax.faces.context.FacesContext;
import javax.servlet.http.HttpSession;

/**
 * @author M-KR
 *
 */
public class UserLogin {
	private String userName;
	private String password;

	public UserLogin() {
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String login() throws Exception{
		
		// Getting session
		FacesContext facesContext = FacesContext.getCurrentInstance();
		HttpSession session = (HttpSession) facesContext.getExternalContext().getSession(true);
		
		// Checking if the informations exists in the database 
		ResultSet connexion = CDB.Acess_donner.selection("SELECT * FROM `users` WHERE `login` = '"+this.getUserName()+"' AND `pass` = '"+this.getPassword()+"'", "g_vente");
		if(connexion.next()){
			session.setAttribute("Connected", this.getUserName());
			return "Success";
		}
		
		// If not shows message error ! 
		session.setAttribute("Error", "Le nom utilisateur ou mot de passe est incorrect !");

		return "Fail";
	}
}
