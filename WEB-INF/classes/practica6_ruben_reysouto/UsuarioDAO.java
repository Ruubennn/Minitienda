package practica6_ruben_reysouto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UsuarioDAO {
    public static int insertarUsuario(String  nombre, String correo, String contrasena) {
        int userId = -1;
        try (Connection conn = ConexionBD.getConnection()) {
            String sql = "INSERT INTO usuarios (nombre, correo, contraseña) VALUES (?, ?, ?) RETURNING id";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, nombre);
            stmt.setString(2, correo);
            stmt.setString(3, contrasena);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }
    

    public static int obtenerUsuario(String email) {
        int userId = -1;
        try(Connection conn = ConexionBD.getConnection()) {

            String consulta = "SELECT id FROM usuarios WHERE correo = ?";
            PreparedStatement stmt = conn.prepareStatement(consulta);
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                userId = rs.getInt("id");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userId;
    }    
}
