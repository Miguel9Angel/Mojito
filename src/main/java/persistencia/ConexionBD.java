package persistencia;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class ConexionBD {
    private String conectoriInstalado = "jdbc:mysql:";
    private String host = "localHost:3306";
    private String baseDatos = "materiaprima";
    private String username = "root";
    private String password = "admin";
    private Connection conexion;
    private Statement ejecutor;
    
    public ConexionBD(){
        connectar();
    }
    
    public boolean isConectado(){
        return (this.conexion != null);
    }
    
    public void connectar(){
        
        try{
            String cadenaConexion = conectoriInstalado + "//" + host + "/" + baseDatos;
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexion = DriverManager.getConnection(cadenaConexion, username, password);
            ejecutor = conexion.createStatement();
            ejecutor.setQueryTimeout(30);
        }
        catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    public ResultSet ejecutarQuery(String sql){
        
        ResultSet rs = null;
        try{
            rs = ejecutor.executeQuery(sql);
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    public ResultSet ejecutarUpdate(String sql){
        
        ResultSet rs = null;
        try{
            int cant = ejecutor.executeUpdate(sql);
            if (cant >0) {
                rs = ejecutor.executeQuery(sql);
            }
            
        }
        catch (Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    public void desconectar(){
        try{
            conexion.close();
            conexion = null;
        }catch(Exception e){
            System.out.println(e);
        }
    }
}
