
package br.uninove.imc;

public class Imc {
    private float peso;
    private float altura;
    private float imc;
    private String classificacao;

    public float getPeso() {
        return peso;
    }

    public void setPeso(float peso) {
        this.peso = peso;
    }

    public float getAltura() {
        return altura;
    }

    public void setAltura(float altura) {
        this.altura = altura;
    }

    public float getImc() {
        return imc;
    }

    public void setImc(float imc) {
        this.imc = imc;
    }

    public String getClassificacao() {
        return classificacao;
    }

    public void setClassificacao(String classificacao) {
        this.classificacao = classificacao;
    }
    
    public float calculaIMC() {
        imc = peso / (altura * altura);
        return imc;
    }
}

//Paramos aqui -> Falta o frontend