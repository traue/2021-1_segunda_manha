
package br.uninove.pojo;


public class Pessoa {
    private String nome;
    private int idade;
    private boolean fumante;

    public Pessoa() {
    }

    public Pessoa(String nome, int idade, boolean fumante) {
        this.nome = nome;
        this.idade = idade;
        this.fumante = fumante;
    }
    
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }

    public boolean isFumante() {
        return fumante;
    }

    public void setFumante(boolean fumante) {
        this.fumante = fumante;
    }
}
