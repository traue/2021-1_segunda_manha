package br.uninove.poo;

public class Pessoa {
    
    //Atributos
    private String nome;
    private String cpf;
    private int idade;    

    //construtores
    public Pessoa(String nome, String cpf, int idade) {
        this.nome = nome;
        this.cpf = cpf;
        this.idade = idade;
    }
    
    //cosntrutor vazio
    public Pessoa() { 
    
    }
    
    //construtor com apenas dois parâmetros (outra assinatura)
    public Pessoa(String nome, String cpf) {
        this.nome = nome;
        this.cpf = cpf;
        this.idade = 0;
    }

    //Modificadores de acesso (sets e gets)
    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public int getIdade() {
        return idade;
    }

    public void setIdade(int idade) {
        this.idade = idade;
    }
}


    /*
    Encapsulamento é composto por três etapas
        1. Private nos atributos
        2. Get para cada atrubuto
        3. Set para cada atributo
    */