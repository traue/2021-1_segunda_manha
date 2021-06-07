package br.uninove;

public class CaixaEletronico {

    //Não precisa ser necessariamente String... v. pode alterar
    //Sugestão (excelente): Retornar um Map
    public static String sacar(int valorSacado) {
        //MONTAR O ALGORITMO AQUI
        if (valorSacado == 1 || valorSacado == 3) {
            return "Valor de saque inválido";
        }
        return "Montar a string de retorno";
    }
}
