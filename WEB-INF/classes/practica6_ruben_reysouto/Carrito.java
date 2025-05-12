package practica6_ruben_reysouto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Carrito implements Serializable {
	private List<Producto> productos;
	
	public Carrito(){
		productos = new ArrayList<>();
	}
	
	public List<Producto> getProductos() {
		return this.productos;
	}
	
	public void addProducto(Producto p) {
    		boolean encontrado = false;
    		for (Producto prod : productos) {
        		if (prod.getNombre().equals(p.getNombre())) {
            			// Si ya existe, aumenta la cantidad
			        prod.setCantidad(prod.getCantidad() + p.getCantidad());
            			encontrado = true;
            			break;
        		}
    		}
	    	if (!encontrado) {
        		productos.add(p);
   	 	}
	}

	
	public void removeProducto(int indice){
		if(indice >= 0 && indice < productos.size()){
			productos.remove(indice);
		}
	}
	
	public double getTotal() {
		double total = 0;
		for(Producto p : productos){
			total += p.getPrecioTotal();
		}
		return total;
	}
	
	public boolean isEmpty(){
		return productos.isEmpty();
	}
	
	public String getTotalFormateado() {
    		return String.format("%.2f", getTotal());
	}
	
}
