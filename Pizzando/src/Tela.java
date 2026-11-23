import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Tela extends JFrame {
    public Tela() {
        JPanel border = new JPanel();
        border.setLayout(new BorderLayout());

        JPanel south_panel = new JPanel();
        south_panel.setLayout(new GridLayout(1,3));

        JButton ver_produtos = new JButton("Ver Produtos");
        south_panel.add(ver_produtos);

        JButton adicionar_produto = new JButton("Adicionar Produto");
        south_panel.add(adicionar_produto);

        JButton entregar_pedido = new JButton("Entregar");
        south_panel.add(entregar_pedido);

        border.add(south_panel, BorderLayout.SOUTH);
        add(border);

        setVisible(true);
        setSize(500,400);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(EXIT_ON_CLOSE);

        ver_produtos.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                new TelaProdutos();
            }
        });
    }
}
