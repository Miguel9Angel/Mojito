package persistencia;

import java.util.ArrayList;
import java.sql.SQLException;
import Logica.Productos;
import java.sql.ResultSet;
import java.util.TreeMap;

public class ProductoDAO {
    
    public ArrayList<Productos> consultaProducto(){
        ArrayList<Productos> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT idMateriaPrima, idTipoMateriaPrima, nombreMateriaPrima, cantidadMateriaPrima, idUnidadMedida FROM tblmateriaprima;");
        try{
            while (rs.next()){
                int idIngredients = rs.getInt("idMateriaPrima");
                String nombre = rs.getString("nombreMateriaPrima");
                int undidadMedida = rs.getInt("idUnidadMedida");
                int cantidad = rs.getInt("cantidadMateriaPrima");
                int tipoMateria = rs.getInt("idUnidadMedida");
                
                Productos j = new Productos(idIngredients, nombre, undidadMedida, cantidad, tipoMateria);
                lista.add(j);
            }
        }catch(SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
    public int guardarNuevoProducto(Productos j){
        ConexionBD con = new ConexionBD();
        int idIngredients = j.getIdIngredients();
        String nombre = j.getNombre();
        int unidadMedida = j.getUnidadMedida();
        int cantidad = j.getCantidad();
        int tipoMateria = j.getUnidadMedida();
        
        String sql = "INSERT INTO tblmateriaprima(idTipoMateriaPrima, nombreMateriaPrima, cantidadMateriaPrima, idUnidadMedida) VALUES ('"+tipoMateria+"','"+nombre+"','"+cantidad+"','"+unidadMedida+"');";
        System.out.println(sql);
        con.ejecutarUpdate(sql);
        con.desconectar();
        return idIngredients;
    }
    
    public TreeMap<Integer, String> cargarTiposProducto(){
        TreeMap<Integer, String> listaTipos= new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT idtipoMateriaPrima, tipoMateriaPrima FROM tbltipomateriaprima;");
        try{
            while (rs.next()){
                int id = rs.getInt("idtipoMateriaPrima");
                String tipo = rs.getString("tipoMateriaPrima");
                listaTipos.put(id, tipo);
            }
        }catch(SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaTipos;
    }
    
    public TreeMap<Integer, String> cargarUnidadesMedida(){
        TreeMap<Integer, String> listaUnidMedida= new TreeMap<Integer, String>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT idUnidadMedida, tipoUnidadMedida FROM tbltipounidadmedida;");
        try{
            while (rs.next()){
                int id = rs.getInt("idUnidadMedida");
                String tipo = rs.getString("tipoUnidadMedida");
                listaUnidMedida.put(id, tipo);
            }
        }catch(SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return listaUnidMedida;
    }
    
    public ArrayList<Productos> consultarProductosFiltro(String filtro){
        ArrayList<Productos> lista = new ArrayList<Productos>();
        ConexionBD con = new ConexionBD();
        String sql = " SELECT j.idMateriaPrima, j.idTipoMateriaPrima, t.tipoMateriaPrima,j.nombreMateriaPrima, j.cantidadMateriaPrima, j.idUnidadMedida, u.tipoUnidadMedida " +
                    "FROM tblmateriaprima j " +
                    "JOIN tbltipomateriaprima t ON (j.idTipoMateriaPrima = t.idtipoMateriaPrima) " +
                    "JOIN tbltipounidadmedida u ON (j.idUnidadMedida = u.idUnidadMedida) " +
                    "WHERE j.nombreMateriaPrima LIKE '%" + filtro + "%' " +
                    "OR t.tipoMateriaPrima LIKE '%" + filtro + "%' " +
                    "OR u.tipoUnidadMedida LIKE '%" + filtro + "%' ";
        ResultSet rs = con.ejecutarQuery(sql);
        try{
            while (rs.next()){
                int idIngredients = rs.getInt("idMateriaPrima");
                String nombre = rs.getString("nombreMateriaPrima");
                int undidadMedida = rs.getInt("idUnidadMedida");
                int cantidad = rs.getInt("cantidadMateriaPrima");
                int tipoMateria = rs.getInt("idUnidadMedida");
                
                Productos j = new Productos(idIngredients, nombre, undidadMedida, cantidad, tipoMateria);
                lista.add(j);
            }
        }catch(Exception e){
            e.printStackTrace();
            con.desconectar();
            return null;
        }
        con.desconectar();
        return lista;
    }
    
    public Productos editarProducto(int id){
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT *FROM tblmateriaprima WHERE idMateriaPrima = '"+id +"';");
        Productos j = new Productos();
        try{
            while (rs.next()){
                int idIngredients = rs.getInt("idMateriaPrima");
                String nombre = rs.getString("nombreMateriaPrima");
                int undidadMedida = rs.getInt("idUnidadMedida");
                int cantidad = rs.getInt("cantidadMateriaPrima");
                int tipoMateria = rs.getInt("idUnidadMedida");
                
                j = new Productos(idIngredients, nombre, undidadMedida, cantidad, tipoMateria);
            }
        }catch(SQLException ex){
            con.desconectar();
            return null;
        }
        con.desconectar();
        return j;
    }

    public int guardarProductoExistente(Productos j){
        ConexionBD con = new ConexionBD();
        int tipoMateriaPrima = j.getTipoMateriaPrima();
        int id = j.getIdIngredients();
        String nombre = j.getNombre();
        int cantidad = j.getCantidad();
        int unidadMedida = j.getUnidadMedida();
        
        String sql = "UPDATE tblmateriaprima SET "+
                "idTipoMateriaPrima = '"+tipoMateriaPrima+"', nombreMateriaPrima = '"+nombre+"',cantidadMateriaPrima='"+cantidad+"', idUnidadMedida='"+unidadMedida+"' WHERE idMateriaPrima='"+id+"';";
        int filas = con.ejecutarUpdate(sql);
        con.desconectar();
        return filas;
    }

}

