package practica6_ruben_reysouto;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class TarjetaDAO {
    public static void insertarTarjeta(int usuarioId, String tipo, String numero) {
        try (Connection conn = ConexionBD.getConnection()) {
            String sql = "INSERT INTO tarjetas (usuario_id, tipo, numero) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuarioId);
            stmt.setString(2, tipo);
            stmt.setString(3, numero);
            stmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
