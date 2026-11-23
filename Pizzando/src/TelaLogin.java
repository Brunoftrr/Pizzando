import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class TelaLogin extends JFrame {
    public TelaLogin() {
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setSize(300,300);
        setLocationRelativeTo(null);
        setTitle("Pizzando - Login");

        JPanel grid_panel = new JPanel();
        grid_panel.setLayout(new GridLayout(5,1));

        JLabel email_label = new JLabel("Email: ");
        grid_panel.add(email_label);
        JTextField email_area = new JTextField();
        grid_panel.add(email_area);

        JLabel senha_label = new JLabel("Senha: ");
        grid_panel.add(senha_label);
        JTextField senha_area = new JTextField();
        grid_panel.add(senha_area);

        JButton entrar_button = new JButton("Entrar");
        grid_panel.add(entrar_button);

        add(grid_panel);

        entrar_button.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                dispose();
                new TelaPrincipal();
            }
        });

        setVisible(true);
    }
}