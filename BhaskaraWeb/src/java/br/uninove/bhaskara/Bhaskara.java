
package br.uninove.bhaskara;

public class Bhaskara {
    private int a;
    private int b;
    private int c;
    private double delta;
    private double raizPositiva;
    private double raizNegativa;

    public int getA() {
        return a;
    }

    public void setA(int a) {
        this.a = a;
    }

    public int getB() {
        return b;
    }

    public void setB(int b) {
        this.b = b;
    }

    public int getC() {
        return c;
    }

    public void setC(int c) {
        this.c = c;
    }

    public double getDelta() {
        return delta;
    }

    public double getRaizPositiva() {
        return raizPositiva;
    }

    public double getRaizNegativa() {
        return raizNegativa;
    }
    
    public double calculaDelta() {
        delta = (b * b) - 4 * a * c;
        if(delta >= 0)
            calculaRaizes();
        
        return delta;
    }
    
    public void calculaRaizes() {
        raizPositiva = ((-1 * b) + Math.sqrt(delta)) / (2 * a);
        raizNegativa = ((-1 * b) - Math.sqrt(delta)) / (2 * a);
    }
}
