package Logica;

import persistencia.UsuarioDAO;

public class ColeccionUsuario {
    
    public boolean guardarUsuario(Usuario j) {
        UsuarioDAO dao = new UsuarioDAO();
        if (j.getId()== 0) {
            int id = dao.guardarNuevoUsuario(j);
            if (id >= 0) {
                return true;
            } else {
                return false;
            }
        }else{
            int filas = dao.guardarUsuarioExistente(j);
            if (filas == 1){
                return true;
            } else{
                return false;
            }
        }
    }
    
    
    
}
