package persistencia;

import Logica.Usuario;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public class UsuarioDAO {
    /**
     * 
     * Enviar la sentencia SQL para obtener la lista de todos los usuarios y estructura
     * la respuesta en una estructura de datos
     */
   
    public ArrayList<Usuario> consultarUsuarios(){
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT idUsuario, UsNombre, UsUsuario, UsClave, UsRol, UsEmail FROM tblusuarios;";
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery(sql);
        try{
            while (rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("idUsuario"));
                u.setNombre(rs.getString("UsNombre"));
                u.setUsuario(rs.getString("UsUsuario"));
                u.setClave(rs.getString("UsClave"));
                u.setRol(rs.getString("UsRol"));
                u.setEmail(rs.getString("UsEmail"));
                lista.add(u);
            }
        }catch(Exception e){
            e.printStackTrace();
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
     public Usuario consultarUsuario(int idAConsultar){
        Usuario u = null;
        String sql = "SELECT idUsuarios, usuario, clave, rol FROM tblusuarios WHERE idUsuarios = "+ idAConsultar +" ";
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery(sql);
        try{
            if (rs.next()){
                u = new Usuario();
                u.setId(rs.getInt("idUsuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
            }
        }catch(Exception e){
            e.printStackTrace();
            con.desconectar();
            return null;
        }
        con.desconectar();
        return u;
    }
     
     
    public ArrayList<Usuario> consultarUsuariosPorFiltro(String filtro){
        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT idUsuarios, usuario, clave, rol FROM tblusuarios " +
                "WHERE usuario LIKE '%"+filtro+ "%' ";
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery(sql);
        try{
            while (rs.next()){
                Usuario u = new Usuario();
                u.setId(rs.getInt("idUsuario"));
                u.setUsuario(rs.getString("usuario"));
                u.setClave(rs.getString("clave"));
                u.setRol(rs.getString("rol"));
                lista.add(u);
            }
        }catch(Exception e){
            e.printStackTrace();
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
    public int guardarNuevoUsuario(Usuario u) {
        int id = 0;
        String sql = "INSERT INT tblusuarios(UsNombre, UsUsuario, UsClave, UsRol, UsEmail) "+
                "VALUES ('"+ u.getNombre() +"','"+ u.getUsuario()+"','"+ u.getClave() +"','"+ u.getRol() +"','"+ u.getEmail() +"') ";
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarInsert(sql);
        try {
            if (rs.next()){
                id = rs.getInt(1);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        }
        con.desconectar();
        return id;
    }
    
    public int guardarUsuarioExistente(Usuario u) {
        int filas = 0;
        String sql = "UPDATE tblusuarios SET UsNombre = '"+ u.getNombre() +"', UsUsuario = '"+ u.getUsuario() +"', UsCalve='"+ u.getClave() +"', UsRol = '"+ u.getRol()+"', UsEmail='"+ u.getEmail() +"' "+
                "WHERE isUsuarios = '"+ u.getId()+"' ";
        ConexionBD con = new ConexionBD();
        filas = con.ejecutarUpdate(sql);
        
        return filas;
    }
    
}
