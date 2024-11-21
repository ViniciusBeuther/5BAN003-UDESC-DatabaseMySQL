package src.Classes;

public class Bebidas extends Produtos{
    protected int volume;
    protected int temCafeina;

    // Constructor for "bebidas"
    public Bebidas( int idProduto, String nome, String descricao, String tipo, String siglaUnidadeMed, int volume, int temCafeina ){
        super.SetProduto(idProduto, nome, descricao, tipo, siglaUnidadeMed);
        this.volume = volume;
        this.temCafeina = temCafeina;
    }

    public void getBebida(){
        System.out.println(volume);
        System.out.println(temCafeina);
    }
}