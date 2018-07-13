

package CDB;

import java.sql.*;
import javax.swing.JOptionPane;


public class Acess_donner {

    public static Connection Getconnect(String db){
    Connection cn=null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        cn=DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/"+db,"root","");
        
    } catch (Exception e) {
        JOptionPane.showMessageDialog(null, e.getMessage());
    }
    
    return cn;
}

    public static int mise_ajour(String sql, String db){
   int t=0;
    try {
        Connection cn=Getconnect(db);
        Statement st=cn.createStatement();
        t=st.executeUpdate(sql);
      
    } catch (Exception e) {
         JOptionPane.showMessageDialog(null, e.getMessage());
    }
 
       return t;
   }
    
    public static int update(String sql,String db){
    	   int t=0;
    	    try {
    	        Connection cn=Getconnect(db);
    	        Statement st=cn.createStatement();
    	        t=st.executeUpdate(sql);
    	      
    	    } catch (Exception e) {
    	         JOptionPane.showMessageDialog(null, e.getMessage());
    	    }
    	 
    	       return t;
    	   }
    
    
    
    
public static ResultSet selection(String sql, String db){
  ResultSet rs=null;
    try {
        Connection cn=Getconnect(db);
        Statement st=cn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
      rs=st.executeQuery(sql);
       
    } catch (Exception e) {
         JOptionPane.showMessageDialog(null, e.getMessage());
    }
  return rs;
 }


    
}
