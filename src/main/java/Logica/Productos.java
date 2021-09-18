package Logica;


public class Productos {
    
    int idIngredients;
    String nombre;
    int unidadMedida;
    int tipoMateriaPrima;
    int Cantidad;

    //------------------------ Constructores---------------------------------------------
    public Productos() {
    }

    public Productos(String nombre, int unidadMedida, int Cantidad, int tipoMateriaPrima) {
        this.nombre = nombre;
        this.unidadMedida = unidadMedida;
        this.Cantidad = Cantidad;
        this.tipoMateriaPrima = tipoMateriaPrima;
    }
    
    public Productos(int idIngredients, String nombre, int unidadMedida, int Cantidad, int tipoMateriaPrima) {
        this.idIngredients = idIngredients;
        this.nombre = nombre;
        this.unidadMedida = unidadMedida;
        this.Cantidad = Cantidad;
        this.tipoMateriaPrima = tipoMateriaPrima;
    }

    //------------------------ getters and setters --------------------------------------

    public int getIdIngredients() {
        return idIngredients;
    }

    public void setIdIngredients(int idIngredients) {
        this.idIngredients = idIngredients;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getUnidadMedida() {
        return unidadMedida;
    }

    public void setUnidadMedida(int unidadMedida) {
        this.unidadMedida = unidadMedida;
    }

    public int getTipoMateriaPrima() {
        return tipoMateriaPrima;
    }

    public void setTipoMateriaPrima(int tipoMateriaPrima) {
        this.tipoMateriaPrima = tipoMateriaPrima;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }

    @Override
    public String toString() {
        return "Productos{" + "idIngredients=" + idIngredients + ", nombre=" + nombre + ", unidadMedida=" + unidadMedida + ", tipoMateriaPrima=" + tipoMateriaPrima + ", Cantidad=" + Cantidad + '}';
    }
    
}
