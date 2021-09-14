package persistencia;

import java.util.ArrayList;
import java.sql.SQLException;
import Logica.Productos;
import java.sql.ResultSet;

public class ProductoDAO {
    
    public ArrayList<Productos> consultaProducto(){
        ArrayList<Productos> lista = new ArrayList<>();
        ConexionBD con = new ConexionBD();
        ResultSet rs = con.ejecutarQuery("SELECT nombre FROM materia_prima;");
        try{
            while (rs.next()){
                int id = rs.getInt("idIngredients");
                String nombre = rs.getString("nombre");
                String descipcion = rs.getString("descipcion");
                int cantidad = rs.getInt("cantidad");
                String fecha = rs.getString("fecha");
                
                Productos j = new Productos(nombre, descipcion, cantidad, fecha);
                lista.add(j);
            }
        }catch(SQLException ex){
            return null;
        }
        return lista;
    }
    
}
