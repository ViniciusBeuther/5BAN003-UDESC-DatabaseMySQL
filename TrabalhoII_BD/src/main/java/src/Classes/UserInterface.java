package src.Classes;
import src.database.MySQLConnection;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class UserInterface {
    public int option;

    public UserInterface(){
        this.showMenu();
    }

    public void showMenu(){
        Scanner scanner = new Scanner(System.in);

        while(true){
            System.out.println("===== BANCO DE DADOS =====");
            System.out.println("1- Adicionar novo produto");
            System.out.println("2- Listar produtos");
            System.out.println("0- Sair");

            System.out.println("Digite a opção desejada: ");
            this.option = scanner.nextInt();

            if(this.option == 0){
                break;
            } else{
                this.executeOption();
            }
        }

        scanner.close();
    }

    public void executeOption(){

        switch (this.option){
            case 0:
                break;

            case 1:
                Scanner scanner = new Scanner(System.in);
                System.out.println("===== ADICIONAR PRODUTO =====");
                try{
                    System.out.println("Qual o nome do produto: ");
                    String tempNome = scanner.nextLine();

                    System.out.println("Qual a descrição do produto: ");
                    String tempDescricao = scanner.nextLine();

                    System.out.println("Qual o tipo do produto (1-Doces / 2-Bebidas): ");
                    String tempTipo = scanner.nextLine();


                    if(tempTipo.equals("1")){
                        tempTipo = "doces";
                    } else if (tempTipo.equals("2")){
                        tempTipo = "bebidas";
                    }
                    else{
                        throw new IllegalArgumentException("Tipo inválido de produto");
                    }

                    System.out.println("Qual é a unidade de medida (L/ML/G/KG/UN): ");
                    String tempMedida = scanner.nextLine().toUpperCase();


                    if (!List.of("L", "ML", "G", "KG", "UN").contains(tempMedida)) {
                        throw new IllegalArgumentException("Unidade de medida inválida!");
                    }

                    Produtos novoProduto = new Produtos();
                    novoProduto.SetProduto(tempNome, tempDescricao, tempTipo, tempMedida);
                    System.out.println(novoProduto.nome);


                } catch (Exception e){
                    System.out.println("Algo deu errado, tente novamente.");
                }
                break;

            // Show all products saved on MySQL
            case 2:
                Produtos produtos = new Produtos();
                ArrayList<Produtos> data = produtos.get();

                System.out.println("---------------------------------------------------------------------------------------------------------------------------");
                System.out.println(String.format("| %-12s | %-20s | %-50s | %-15s | %-10s |", "ID", "Nome", "Descrição", "Tipo", "Unidade"));
                System.out.println("---------------------------------------------------------------------------------------------------------------------------");

                for(int i = 0; i < data.size(); i++){
                    System.out.println(String.format("| %-12d | %-20s | %-50s | %-15s | %-10s |", data.get(i).idProduto, data.get(i).nome, data.get(i).descricao, data.get(i).tipo, data.get(i).siglaUnidadeMed));
                }
                System.out.println("---------------------------------------------------------------------------------------------------------------------------");

                break;
        }
    }
}

