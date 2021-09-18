package persistencia;

import java.util.ArrayList;
import java.sql.SQLException;
import Logica.Productos;
import java.sql.ResultSet;

public class ProductoDAO {
    
    public ArrayList<Productos> consultaProducto(){
        ArrayList<Productos> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT idMateriaPrima, idTipoMateriaPrima, nombreMateriaPrima, cantidadMateiaPrima, idUnidadMedida FROM tblmateriaprima;");
        try{
            while (rs.next()){
                int idIngredients = rs.getInt("idMateriaPrima");
                String nombre = rs.getString("nombreMateriaPrima");
                int undidadMedida = rs.getInt("idUnidadMedida");
                int cantidad = rs.getInt("cantidadMateiaPrima");
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
    
    public boolean guardarNuevoProducto(Productos j){
        ConexionBD con = new ConexionBD();
        int idIngredients = j.getIdIngredients();
        String nombre = j.getNombre();
        int unidadMedida = j.getUnidadMedida();
        int cantidad = j.getCantidad();
        int tipoMateria = j.getUnidadMedida();
        
        String sql = "INSERT INTO tblmateriaprima(idTipoMateriaPrima, nombreMateriaPrima, cantidadMateiaPrima, idUnidadMedida) VALUES ('"+tipoMateria+"','"+nombre+"','"+cantidad+"','"+unidadMedida+"');";
        System.out.println(sql);
        con.ejecutarUpdate(sql);
        con.desconectar();
        return true;
    }
    
    
}




