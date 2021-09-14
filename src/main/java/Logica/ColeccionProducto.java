package Logica;

import java.util.ArrayList;
import persistencia.ProductoDAO;

public class ColeccionProducto {
    private ArrayList<Productos> lista;
    
    public ArrayList<Productos> getLista(){
        return lista;
    }
    
    public boolean cargarProductos(){
        ProductoDAO dao = new ProductoDAO();
        lista = dao.consultaProducto();
        if (lista.size() > 0){
            return true;
        }else {
            return false;
        }
    }
}
