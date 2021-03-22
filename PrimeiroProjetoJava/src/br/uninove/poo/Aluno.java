package br.uninove.poo;

public class Aluno extends Pessoa {

    //Popdemos suprimir estes atributos pois a Pessoa já os possui
    //String nome;
    //int idade;
    //String cpf;
    
    private int ra;
    private Curso curso;

    public Aluno() {
    }

    public Aluno(String nome, String cpf, int idade, int ra, Curso curso) {
        super(nome, cpf, idade);
        this.curso = curso;
        this.ra = ra;
    }

    public int getRa() {
        return ra;
    }

    public void setRa(int ra) {
        this.ra = ra;
    }

    public Curso getCurso() {
        return curso;
    }

    public void setCurso(Curso curso) {
        this.curso = curso;
    }
}
