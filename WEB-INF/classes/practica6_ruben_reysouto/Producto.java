package practica6_ruben_reysouto;

public class Producto {
    private String nombre;
    private double precio;
    private int cantidad;

    public Producto(String desc, int cantidad) {
        String[] partes = desc.split("\\|");
        this.nombre = partes[0].trim();
        this.precio = Double.parseDouble(partes[3].trim().replace("$", ""));
        this.cantidad = cantidad;
    }

    public double getPrecioTotal() {
        return cantidad * precio;
    }
    
    public String getNombre() {
    	return this.nombre;
    }
    
    public int getCantidad() {
    	return this.cantidad;
    }
}

