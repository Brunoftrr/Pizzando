import java.sql.*;
import java.util.ArrayList;

public class PizzaDAO {

    public int insert(Pizza p){

        try {
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO pizza (nome, preco, sabor) VALUES (?,?,?)",
                    Statement.RETURN_GENERATED_KEYS);

            ps.setString(1, p.getNome());
            ps.setDouble(2, p.getPreco());
            ps.setString(3, p.getSabor());

            int linhas = ps.executeUpdate();

            conn.close();
            return linhas;

        }catch (SQLException e){
            System.out.println("Erro ao inserir PIZZA: " + e.getMessage());
            return 0;
        }
    }

    public Pizza read(int id){
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM pizza WHERE cod_pizza = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if(rs.next()){
                String nome = rs.getString(2);
                Double preco = rs.getDouble(3);
                String sabor = rs.getString(4);
                Pizza p = new Pizza(id, nome, preco, sabor);
                return p;
            }
            conn.close();

        }catch (SQLException e){
            System.out.println("Erro ao consultar produto: " + e.getMessage());
        }
        return null;
    }
}
