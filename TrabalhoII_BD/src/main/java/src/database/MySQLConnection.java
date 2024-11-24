package src.database;

import java.sql.*;

public class MySQLConnection {
    // URL do banco de dados
    private final String URL;
    private final String USER;
    private final String PASSWORD;

    public Connection connection = null;
    public Statement cursor;

    // Constructor class
    public MySQLConnection(){
        this.URL = "jdbc:mysql://localhost:3306/projeto1";
        this.PASSWORD = "V1n1c1us";
        this.USER = "root";
        this.connect();
    }

    // Start the connection with MySQL
    public Connection connect() {
        try {
            this.connection = DriverManager.getConnection(this.URL, this.USER, this.PASSWORD);
            return this.connection;

        } catch (SQLException e) {
            System.out.println("Não foi possível conectar ao banco de dados.");
            return null;
        }
    }
}

