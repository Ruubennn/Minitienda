package practica6_ruben_reysouto;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class PedidoDAO {
    public static void insertarPedido(int usuarioId, double importeTotal){
        try (Connection conn = ConexionBD.getConnection()) {
            String sql = "INSERT INTO pedidos (usuario_id, importe_total) VALUES (?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuarioId);
            stmt.setDouble(2, importeTotal);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
