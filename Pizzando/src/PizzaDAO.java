import javax.xml.transform.Result;
import java.sql.*;
import java.util.ArrayList;

public class PizzaDAO {

    public int insert(Pizza p){

        try {
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("INSERT INTO pizza (preco, sabor) VALUES (?,?)",
                    Statement.RETURN_GENERATED_KEYS);

            ps.setDouble(1, p.getPreco());
            ps.setString(2, p.getSabor());

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
                Double preco = rs.getDouble(2);
                String sabor = rs.getString(3);
                Pizza p = new Pizza(id, preco, sabor);
                return p;
            }
            conn.close();

        }catch (SQLException e){
            System.out.println("Erro ao consultar produto: " + e.getMessage());
        }
        return null;
    }

    public ArrayList<Pizza> list(){
        ArrayList<Pizza> pizzaArrayList = new ArrayList<Pizza>();
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("SELECT * FROM Pizza ORDER BY cod_pizza");
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                int id = rs.getInt(1);
                Double preco = rs.getDouble(2);
                String sabor = rs.getString(3);
                Pizza p = new Pizza(id,preco,sabor);
                pizzaArrayList.add(p);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Erro ao listar Pizza: " + e.getMessage());
        }
        return pizzaArrayList;
    }
    public int Update(Pizza p){
        try {
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("UPDATE Pizza SET preco = ?, sabor = ? WHERE cod_pizza = ?");

            ps.setInt(1, p.getId());
            ps.setString(2, p.getSabor());
            ps.setDouble(3, p.getPreco());

            int linhas = ps.executeUpdate();

            conn.close();
            return linhas;

        } catch (Exception e) {
            System.out.println("Erro ao alterar o produto: " + e.getMessage());
            return 0;
        }
    }
    public int Delete(int id){
        try{
            Connection conn = Conexao.conectar();
            PreparedStatement ps = conn.prepareStatement("DELETE Pizza SET preco = ?, sabor = ? WHERE cod_pizza = ?");

            ps.setInt(1,id);

            int linha = ps.executeUpdate();
            conn.close();
            return linha;

        } catch (Exception e) {
            System.out.println("Erro ao deletar: " + e.getMessage());
            return 0;
        }
    }
}
