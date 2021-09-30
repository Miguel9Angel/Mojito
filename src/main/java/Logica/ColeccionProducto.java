package Logica;

import java.util.ArrayList;
import java.util.TreeMap;
import persistencia.ProductoDAO;

public class ColeccionProducto {

    private ArrayList<Productos> lista;

    public ArrayList<Productos> getLista() {
        return lista;
    }

    public String getTipoProducto(int key) {
        ProductoDAO dao = new ProductoDAO();
        TreeMap<Integer, String> listaTiposProductos = dao.cargarTiposProducto();
        String value = listaTiposProductos.get(key);
        return value;
    }

    public TreeMap getTipoProducto() {
        ProductoDAO dao = new ProductoDAO();
        TreeMap<Integer, String> listaTiposProductos = dao.cargarTiposProducto();
        return listaTiposProductos;
    }

    public String getUnidadesMedida(int key) {
        ProductoDAO dao = new ProductoDAO();
        TreeMap<Integer, String> listaUnidMedidas = dao.cargarUnidadesMedida();
        String value = listaUnidMedidas.get(key);
        return value;
    }

    public TreeMap getUnidadesMedida() {
        ProductoDAO dao = new ProductoDAO();
        TreeMap<Integer, String> listaUnidMedidas = dao.cargarUnidadesMedida();
        return listaUnidMedidas;
    }

    public boolean cargarProductos() {
        ProductoDAO dao = new ProductoDAO();
        lista = dao.consultaProducto();
        if (lista.size() > 0) {
            return true;
        } else {
            return false;
        }
    }

    public boolean guardarProducto(Productos j) {
        ProductoDAO dao = new ProductoDAO();
        if (j.getIdIngredients() == 0) {
            int id = dao.guardarNuevoProducto(j);
            if (id >= 0) {
                return true;
            } else {
                return false;
            }
        }else{
            int filas = dao.guardarProductoExistente(j);
            if (filas == 1){
                return true;
            } else{
                return false;
            }
        }
    }
    
    public boolean cargarProductosFiltro(String filtro) {
        ProductoDAO dao = new ProductoDAO();
        lista = dao.consultarProductosFiltro(filtro);
        return lista.size() > 0;
    }

    public Productos cargarUnProducto(int a) {
        ProductoDAO dao = new ProductoDAO();
        Productos j = dao.editarProducto(a);
        if (j != null) {
            return j;
        } else {
            return null;
        }
    }
}
