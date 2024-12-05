import javax.swing.*;
import java.awt.*;
import java.io.*;
import java.nio.file.*;
import java.util.HashMap;
import java.util.Map;

public class FileMoverApp {

    private static Map<String, String> destinationPaths = new HashMap<>();
    private static String intermediatePath = "c:\\users\\vinic\\downloads\\testes\\"; // Caminho intermediário

    public static void main(String[] args) {
        // Configurar tipos e destinos
        destinationPaths.put("Queue", "C:\\Users\\vinic\\Downloads\\testes\\queue");
        destinationPaths.put("HotFolder2", "C:\\Users\\vinic\\Downloads\\testes\\initialPath");

        SwingUtilities.invokeLater(FileMoverApp::createGUI);
    }

    private static void createGUI() {
        JFrame frame = new JFrame("File Mover");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(400, 200);
        frame.setLayout(new FlowLayout());

        // Campo de seleção de arquivo
        JTextField filePathField = new JTextField(20);
        JButton browseButton = new JButton("Browse");
        browseButton.addActionListener(e -> {
            JFileChooser fileChooser = new JFileChooser();
            int result = fileChooser.showOpenDialog(null);
            if (result == JFileChooser.APPROVE_OPTION) {
                File selectedFile = fileChooser.getSelectedFile();
                filePathField.setText(selectedFile.getAbsolutePath());
            }
        });

        // Dropdown para tipos
        JComboBox<String> typeDropdown = new JComboBox<>(destinationPaths.keySet().toArray(new String[0]));

        // Botão para mover o arquivo
        JButton moveButton = new JButton("Move");
        moveButton.addActionListener(e -> {
            String filePath = filePathField.getText();
            String selectedType = (String) typeDropdown.getSelectedItem();

            if (filePath.isEmpty() || selectedType == null) {
                JOptionPane.showMessageDialog(frame, "Please select a file and a type.");
                return;
            }

            moveFile(filePath, destinationPaths.get(selectedType));
        });

        // Adicionar componentes à interface
        frame.add(new JLabel("File:"));
        frame.add(filePathField);
        frame.add(browseButton);
        frame.add(new JLabel("Type:"));
        frame.add(typeDropdown);
        frame.add(moveButton);

        frame.setVisible(true);

        // Iniciar monitoramento
        new Thread(FileMoverApp::monitorIntermediateFolder).start();
    }

    private static void moveFile(String sourcePath, String destinationPath) {
        try {
            Path source = Paths.get(sourcePath);
            Path destination = Paths.get(destinationPath);

            // Criar diretório de destino, se necessário
            Files.createDirectories(destination.getParent());

            Files.move(source, destination.resolve(source.getFileName()), StandardCopyOption.REPLACE_EXISTING);
            System.out.println("File moved to " + destinationPath);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void monitorIntermediateFolder() {
        try (WatchService watchService = FileSystems.getDefault().newWatchService()) {
            Path path = Paths.get(intermediatePath);
            path.register(watchService, StandardWatchEventKinds.ENTRY_CREATE);

            while (true) {
                WatchKey key = watchService.take();
                for (WatchEvent<?> event : key.pollEvents()) {
                    if (event.kind() == StandardWatchEventKinds.ENTRY_CREATE) {
                        Path fileName = (Path) event.context();
                        System.out.println("File detected: " + fileName);

                        // Mover de volta ao original
                        moveFile(intermediatePath + "/" + fileName.toString(), "C:\\Users\\vinic\\Downloads\\testes\\initialPath");
                    }
                }
                key.reset();
            }
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
