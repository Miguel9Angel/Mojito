package Logica;


public class Productos {
    
    int idIngredients;
    String nombre;
    String descripcion;
    String fecha;
    int Cantidad;

    //------------------------ Constructores---------------------------------------------
    public Productos() {
    }

    public Productos(String nombre, String descripcion, int Cantidad, String fecha) {
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.Cantidad = Cantidad;
        this.fecha = fecha;
    }
    
    public Productos(int idIngredients, String nombre, String descripcion, int Cantidad, String fecha) {
        this.idIngredients = idIngredients;
        this.nombre = nombre;
        this.descripcion = descripcion;
        this.Cantidad = Cantidad;
        this.fecha = fecha;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCantidad() {
        return Cantidad;
    }

    public void setCantidad(int Cantidad) {
        this.Cantidad = Cantidad;
    }
    
    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    @Override
    public String toString() {
        return "Productos{" + "nombre=" + nombre + ", descripcion=" + descripcion + ", Cantidad=" + Cantidad + '}';
    }

}
