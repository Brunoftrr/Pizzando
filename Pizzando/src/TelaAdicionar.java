import javax.swing.*;
import java.awt.*;

public class TelaAdicionar extends JFrame {
    public TelaAdicionar() {

        JPanel BorderPanel = new JPanel();
        BorderPanel.setLayout(new BorderLayout());

        JPanel GridPanel = new JPanel();
        GridPanel.setLayout(new GridLayout());

        BorderPanel.add(GridPanel, BorderLayout.NORTH);

        add(BorderPanel);

        setDefaultCloseOperation(DISPOSE_ON_CLOSE);
        setSize(300,300);
        setLocationRelativeTo(null);
        setVisible(true);
    }
}