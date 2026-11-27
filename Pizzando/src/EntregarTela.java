import javax.swing.*;
import java.awt.*;

public class EntregarTela extends JFrame {
    public EntregarTela() {

        JPanel BorderPanel = new JPanel();
        BorderPanel.setLayout(new BorderLayout());

        JPanel GridPanel = new JPanel();
        GridPanel.setLayout(new GridLayout(2,2));

        JLabel EnderecoLabel = new JLabel("Endereco");
        JLabel SenhaLabel = new JLabel("Senha");

        JTextField EnderecoField = new JTextField();
        JTextField SenhaField = new JTextField();

        GridPanel.add(EnderecoLabel);
        GridPanel.add(EnderecoField);
        GridPanel.add(SenhaLabel);
        GridPanel.add(SenhaField);

        BorderPanel.add(GridPanel, BorderLayout.CENTER);

        add(BorderPanel);

        setVisible(true);
        setSize(300,300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    }
}