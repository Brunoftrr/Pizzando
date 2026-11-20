import java.sql.*;

public class Conexao {

    public static Connection conectar() throws SQLException{

        Connection conn = null;
        String url = "jdbc:postgresql://localhost:5432/java_aula";
        String usuario = "postgres";
        String senha = "postgres";

        try {
            conn = DriverManager.getConnection(url, usuario, senha);
        }catch (SQLException e){
            e.printStackTrace();
        }
        return conn;
    }
}