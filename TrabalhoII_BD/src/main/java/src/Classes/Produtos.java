package src.Classes;

import src.database.MySQLConnection;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Scanner;

public class Produtos {
    protected int idProduto;
    protected String nome;
    protected String descricao;
    protected String tipo;
    protected String siglaUnidadeMed;
    public static int idCounter = 13;

    public int getIdProduto() {
        return idProduto;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getSiglaUnidadeMed() {
        return siglaUnidadeMed;
    }

    public void setSiglaUnidadeMed(String siglaUnidadeMed) {
        this.siglaUnidadeMed = siglaUnidadeMed;
    }

    public static int getIdCounter() {
        return idCounter;
    }

    public static void setIdCounter(int idCounter) {
        Produtos.idCounter = idCounter;
    }

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
        ArrayList<Produtos> produtos = new ArrayList<>();
        MySQLConnection db = new MySQLConnection();

        try (Statement cursor = db.connect().createStatement()){
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
                produto.setNome(nome);
                produto.setDescricao(descricao);
                produto.setTipo(tipo);
                produto.setSiglaUnidadeMed(siglaUnidadeMed);
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

        try{
            String query = "INSERT INTO produtos(nome, descricao, tipo, siglaUnidadeMed) VALUES(?, ?, ?, ?)";

            // Build a prepared statement to avoid SQL Injection and insert the new product into the database
            try(PreparedStatement stmt = db.connection.prepareStatement(query)){
                stmt.setString(1, novoProduto.getNome());
                stmt.setString(2, novoProduto.getDescricao());
                stmt.setString(3, novoProduto.getTipo());
                stmt.setString(4, novoProduto.getSiglaUnidadeMed());


                int rowsAffected = stmt.executeUpdate();
                System.out.println("Inserido com sucesso, linhas afetadas: " + rowsAffected);
                db.connection.close();


            } catch (SQLException e){
                System.out.println("Não foi possível executar a query de inserção de produto. erro: " + e);
            }

            return("Novo produto inserido com sucesso!");
        } catch (Exception e){
            System.out.println("Não foi possível inserir o novo produto. Verifique os dados e tente novamente.");
            return null;
        }
    }

    public void update(int idProduto){
        Scanner scan = new Scanner(System.in);
        System.out.println("===== ATUALIZAR CAMPO =====");
        System.out.println("1- Nome");
        System.out.println("2- Descrição");
        int opcaoSelecionada = scan.nextInt();
        try{
            if(opcaoSelecionada == 1){
                break;
            }
            else if (opcaoSelecionada == 2){
                break;
            }
            else{
                throw new Exception("Opção inválida!");
            }
        } catch(Exception e){
            System.out.println("Erro ao atualizar: " + e);
        }

    }

    public void updateNome(int idProduto, String novoNome){
        break;
    }
}
