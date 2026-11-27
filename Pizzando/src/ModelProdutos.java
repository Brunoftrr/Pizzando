import javax.swing.table.AbstractTableModel;
import java.util.ArrayList;
import java.util.Arrays;

public class ModelProdutos extends AbstractTableModel {

    private ArrayList<Produto> produtos;

    private ArrayList<String> colunas = new ArrayList<>(
            Arrays.asList("Preco", "Nome", "cod_pizza")
    );

    public ModelProdutos(ArrayList<Produto> produtos){
        this.produtos = produtos;
    }

    @Override
    public int getRowCount() {
        return produtos.size();
    }

    @Override
    public int getColumnCount() {
        return colunas.toArray().length;
    }

    @Override
    public Object getValueAt(int rowIndex, int columnIndex) {

        Produto produto = produtos.get(rowIndex);

        switch (columnIndex) {
            case 0:
                return produto.getPreco();
            case 1:
                return produto.getNome();
            case 2:
                return produto.getCod_pizza();
            default:
                return null;
        }
    }
}
