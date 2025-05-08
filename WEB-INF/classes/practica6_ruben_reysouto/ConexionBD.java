package practica6_ruben_reysouto;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConexionBD {
    private static final String URL = "jdbc:postgresql://localhost:5432/minitienda";
    private static final String USER = "postgres";
    private static final String PASSWORD = "clave";

    public static Connection getConnection() throws Exception {
        Connection connection = null;
        try {
            Class.forName("org.postgresql.Driver"); // CON ESTA LÍNEA FUNCIONA ---- NO SÉ SI HACE FALTA SINO NO ME IBA :(
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos.");
        } catch (Exception e) {
            System.err.println("Error al conectar a la base de datos: " + e.getMessage());
            throw e;
        }
        return connection;
    }

    /* public static void main(String[] args) {
        try {
            Connection conn = getConnection();
            if (conn != null && !conn.isClosed()) {
                System.out.println("¡Conexión establecida correctamente!");
            } else {
                System.out.println("No se pudo establecer la conexión.");
            }
        } catch (Exception e) {
            System.err.println("Error al conectar: " + e.getMessage());
        }
    } */
}
