package src.Classes;

public class Doces extends Produtos {
    protected float peso;
    protected String origem;

    public Doces(int idProduto, String nome, String descricao, String tipo, String siglaUnidadeMed, float peso, String origem){
        super.SetProduto(idProduto, nome, descricao, tipo, siglaUnidadeMed);
        this.peso = peso;
        this.origem = origem;
    }
}

