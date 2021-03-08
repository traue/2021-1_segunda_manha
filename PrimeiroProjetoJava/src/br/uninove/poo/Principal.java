package br.uninove.poo;

import java.util.Scanner;

public class Principal {

    public static void main(String[] args) {
//        System.out.println("Texto \"1\""); //Texo com aspas internas
//        System.out.println("Texto \"2\""); //Idem
//        System.out.println("Texto \"3\"\n\tCom quebra de linha e tabulado"); //Quebrando linha e tabulando
//        System.out.println("Hoje é dia 08/03/2021\\Dia das muilheres. Parabéns!"); //Mais carcteres de escape

        //----------------
        //Variáveis em Java:
//        int idade = 33;
//        String nome = "Josefino";
//        System.out.println("Olá " + nome + ", nossa, você tem " + idade + " anos. Que legal!");
//        
        
        //Brincando com entrada pelo console:
//        Scanner sc = new Scanner(System.in);
//        int anos;
//        System.out.print("Informe sua idade: ");
//        anos = sc.nextInt();
//        System.out.println("Você informou que possui " + anos + " anos de idade!");
//        System.out.print("Informe seu nome: ");
//        String nomeCompleto = sc.next();
//        System.out.println("Você se chama " + nomeCompleto);
//        
        //--------
        //Começando a trabalhar com objetos...
        Pessoa p1 = new Pessoa();
        p1.nome = "Debora";
        p1.idade = 18;
        p1.cpf = "123.123.123-12";
        
        System.out.println("Nome: " + p1.nome);
        System.out.println("Idade: " + p1.idade);
        System.out.println("CPF: " + p1.cpf);
    }
}
