package persistencia;

import java.util.ArrayList;
import java.sql.SQLException;
import Logica.Productos;
import java.sql.ResultSet;

public class ProductoDAO {
    
    public ArrayList<Productos> consultaProducto(){
        ArrayList<Productos> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT idIngredients, nombre, descripcion, cantidad, fecha FROM materia_prima;");
        try{
            while (rs.next()){
                int idIngredients = rs.getInt("idIngredients");
                String nombre = rs.getString("nombre");
                String descripcion = rs.getString("descripcion");
                int cantidad = rs.getInt("cantidad");
                String fecha = rs.getString("fecha");
                
                Productos j = new Productos(idIngredients, nombre, descripcion, cantidad, fecha);
                lista.add(j);
            }
        }catch(SQLException ex){
            return null;
        }
        return lista;
    }
    
}
