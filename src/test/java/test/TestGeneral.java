package test;

import org.testng.Assert;
import org.testng.annotations.Test;
import persistencia.ConexionBD;
import persistencia.ProductoDAO;

public class TestGeneral {
    
    @Test
    public void verificarConexion(){
        ConexionBD con = new ConexionBD();
        Assert.assertTrue(con.isConectado(),"No hay conexion creada.");
        con.desconectar();
        Assert.assertFalse(con.isConectado(), "No se cerro conexion.");
    }
    
    @Test
    public void verificarCargaProductos(){
        ProductoDAO dao = new ProductoDAO();
        Assert.assertTrue(dao.consultaProducto().size() > 0 , "No se cargaron datos. ");
    }
    
    @Test
    public void consultarProductosFiltro(){
        ProductoDAO dao = new ProductoDAO();
        String sql = "Libras";
        Assert.assertTrue(dao.consultarProductosFiltro(sql).size() > 0 , "No se cargaron datos. ");
    }
    
    @Test
    public void verificarCargaTipoProductos(){
        ProductoDAO dao = new ProductoDAO();
        Assert.assertTrue(dao.cargarTiposProducto().size()>= 3 , "No se cargaron datos. ");
    }
    
    @Test
    public void verificarCargaUnidMedidas(){
        ProductoDAO dao = new ProductoDAO();
        Assert.assertTrue(dao.cargarUnidadesMedida().size()>= 2 , "No se cargaron datos. ");
    }
}
