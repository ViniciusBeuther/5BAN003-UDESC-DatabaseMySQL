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
            System.out.println("3- Listar clientes");
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
                String tipoToInsert;
                String doceOrigem="";
                float volumeBebida = 0;
                float pesoDoce = 0;
                boolean temCafeina = false;

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
                        tipoToInsert = "doces";
                    } else if (tempTipo.equals("2")){
                        tipoToInsert = "bebidas";
                    }
                    else{
                        throw new IllegalArgumentException("Tipo inválido de produto");
                    }

                    if (tipoToInsert.equals("bebidas")) {
                        System.out.println("Qual é o volume da embalagem: ");
                        volumeBebida = scanner.nextFloat();
                        scanner.nextLine(); // Consome a quebra de linha após nextFloat()

                        System.out.println("A bebida possui cafeína (0-não / 1-sim): ");
                        String tempTemCafeina = scanner.nextLine();

                        if (tempTemCafeina.equals("1")) {
                            temCafeina = true;
                        } else if (tempTemCafeina.equals("0")) {
                            temCafeina = false;
                        } else {
                            throw new Exception("Resposta se possui cafeína é inválida! Aceito somente 0 ou 1!");
                        }
                    } else {
                        System.out.println("Qual é a origem do doce: ");
                        doceOrigem = scanner.nextLine();
                        System.out.println("Qual é o peso do doce: ");
                        pesoDoce = scanner.nextFloat();
                        scanner.nextLine();

                    }

                    System.out.println("Qual é a unidade de medida (L/ML/G/KG/UN): ");
                    String tempMedida = scanner.nextLine().toUpperCase();

                    if (!List.of("L", "ML", "G", "KG", "UN").contains(tempMedida)) {
                        throw new IllegalArgumentException("Unidade de medida inválida!");
                    }

                    Produtos novoProduto = new Produtos();
                    novoProduto.setNome(tempNome);
                    novoProduto.setDescricao(tempDescricao);
                    novoProduto.setTipo(tipoToInsert);
                    novoProduto.setSiglaUnidadeMed(tempMedida);
                    System.out.println(novoProduto.getSiglaUnidadeMed());

                    // novoProduto.insert(novoProduto);
                    if( tipoToInsert.equals("bebidas") ){
                        var novaBebida = new Bebidas(novoProduto.getIdProduto(), volumeBebida, temCafeina);
                        novaBebida.insertIntoDb(novoProduto, novaBebida.getVolume(), novaBebida.getTemCafeina());
                    } else {
                        var novoDoce = new Doces(pesoDoce, doceOrigem);
                        novoDoce.insertIntoDb(novoProduto);
                    }

                } catch (Exception e){
                    System.out.println("Algo deu errado, tente novamente.");
                }
                break;

            // Show all products saved on MySQL
            case 2:
                Produtos produtos = new Produtos();
                ArrayList<Produtos> data = produtos.get();

                System.out.println("---------------------------------------------------------------------------------------------------------------------------");
                System.out.printf("| %-12s | %-20s | %-50s | %-15s | %-10s |%n", "ID", "Nome", "Descrição", "Tipo", "Unidade");
                System.out.println("---------------------------------------------------------------------------------------------------------------------------");

                for (Produtos item : data) {
                    System.out.printf("| %-12d | %-20s | %-50s | %-15s | %-10s |%n", item.getIdProduto(), item.getNome(), item.getDescricao(), item.getTipo(), item.getSiglaUnidadeMed());
                }
                System.out.println("---------------------------------------------------------------------------------------------------------------------------");

                break;
            case 3:
              Clientes clientes = new Clientes();
              ArrayList<Clientes> dataClientes = clientes.get();

              for(Clientes c : dataClientes){
                  System.out.println(clientes.getNome());
              }

        }


    }
}

