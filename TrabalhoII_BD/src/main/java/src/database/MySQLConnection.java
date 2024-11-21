package src.database;

import java.sql.*;

public class MySQLConnection {
    // URL do banco de dados
    private String URL;
    private String USER;
    private String PASSWORD;

    public Connection connection = null;
    public Statement cursor;

    // Constructor class
    public MySQLConnection(){
        this.connect();
        this.URL = "jdbc:mysql://localhost:3306/projeto1";
        this.PASSWORD = "V1n1c1us";
        this.USER = "root";
    }

    // Start the connection with MySQL
    public Statement connect(){
        try{
            this.connection = DriverManager.getConnection(this.URL, this.USER, this.PASSWORD);
            this.cursor = this.connection.createStatement();

            return this.cursor;
        } catch(SQLException e){
            System.out.println("Não foi possível conectar ao banco de dados.");
            return null;
        }
    }
}

