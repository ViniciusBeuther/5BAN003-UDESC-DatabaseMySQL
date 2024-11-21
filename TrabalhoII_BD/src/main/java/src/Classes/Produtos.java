package src.Classes;

import src.database.MySQLConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Produtos {
    protected int idProduto;
    protected String nome;
    protected String descricao;
    protected String tipo;
    protected String siglaUnidadeMed;
    public static int idCounter = 13;

    // Product constructor
    public void SetProduto( String nome, String descricao, String tipo, String siglaUnidadeMed ){
        this.nome = nome;
        this.descricao = descricao;
        this.tipo = tipo;

        idCounter++;
    }

    public void setIdProduto(int idProduto){
        this.idProduto = idProduto;
    }

    // Get all products from MySQL
    public ArrayList<Produtos> get(){
        ArrayList<Produtos> produtos = new ArrayList<Produtos>();
        MySQLConnection db = new MySQLConnection();

        try (Statement cursor = db.connect()){
            String query = "SELECT * FROM produtos";
            ResultSet dbReturnResults = cursor.executeQuery(query);

            while (dbReturnResults.next()){
                // idProduto, nome, descricao, tipo, siglaUnidadeMed
                int idProduto = dbReturnResults.getInt("idProduto");
                String nome = dbReturnResults.getString("nome");
                String descricao = dbReturnResults.getString("descricao");
                String tipo = dbReturnResults.getString("tipo");
                String siglaUnidadeMed = dbReturnResults.getString("siglaUnidadeMed");

                Produtos produto = new Produtos();
                produto.SetProduto( nome, descricao, tipo, siglaUnidadeMed );
                produto.setIdProduto(idProduto);
                produtos.add(produto);
            }

        } catch (SQLException e){
            System.out.println("Não foi possui pegar os dados da tabela Produtos.");
        }

        return produtos;
    }

    // Insert a new product in MySQL table
    public String insert(Produtos novoProduto){
        MySQLConnection db = new MySQLConnection();

        try(Statement cursor = db.connect()){
            String query = "INSERT INTO produtos(nome, descricao, tipo, siglaUnidadeMed) VALUES(?, ?, ?, ?)";

            // Build a prepared statement to avoid SQL Injection and insert the new product into the database
            try(PreparedStatement stmt = db.connection.prepareStatement(query)){
                stmt.setString(1, novoProduto.nome);
                stmt.setString(2, novoProduto.descricao);
                stmt.setString(3, novoProduto.tipo);
                stmt.setString(4, novoProduto.siglaUnidadeMed);

                int rowsAffected = stmt.executeUpdate();
                System.out.println("Inserido com sucesso, linhas afetadas: " + rowsAffected);

            } catch (SQLException e){
                System.out.println("Não foi possível executar a query de inserção de produto. erro: " + e);
            }


            return("Novo produto inserido com sucesso!");
        } catch (SQLException e){
            System.out.println("Não foi possível inserir o novo produto. Verifique os dados e tente novamente.");
            return null;
        }
    }

}
