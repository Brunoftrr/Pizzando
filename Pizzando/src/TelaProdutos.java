import javax.swing.*;
import java.awt.*;

public class TelaProdutos extends JFrame{
    public TelaProdutos(){

        JPanel BorderPanel = new JPanel();
        BorderPanel.setLayout(new BorderLayout());

        JPanel GridPanel = new JPanel();
        BorderPanel.setLayout(new GridLayout());

        setVisible(true);
        setSize(300,300);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
    }
}