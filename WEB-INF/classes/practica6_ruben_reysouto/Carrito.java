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
	
	public void addProducto(Producto p){
		productos.add(p);
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
}
