
package br.uninove.poo;

import java.util.List;

public class Curso {
    private String nomeCurso;
    private List<Disciplina> disciplinas;

    public Curso(String nomeCurso) {
        this.nomeCurso = nomeCurso;
    }

    public Curso(String nomeCurso, List<Disciplina> disciplinas) {
        this.nomeCurso = nomeCurso;
        this.disciplinas = disciplinas;
    }
    
    public Curso() {}
    
    public String getNomeCurso() {
        return nomeCurso;
    }

    public void setNomeCurso(String nomeCurso) {
        this.nomeCurso = nomeCurso;
    }

    public int getCargaHoraria() {
        int cargaHoraria = 0;
        for(Disciplina disc : disciplinas) {
            cargaHoraria += disc.getCargaHoraria();
        }
        return cargaHoraria;
    }

    //O set CH do curso deixa de existir poir agora a CH 
    //é calculada pela CH do conjunto de disciplinas
//    public void setCargaHoraria(int cargaHoraria) {
//        this.cargaHoraria = cargaHoraria;
//    }

    public List<Disciplina> getDisciplinas() {
        return disciplinas;
    }

    public void setDisciplinas(List<Disciplina> disciplinas) {
        this.disciplinas = disciplinas;
    }
    
    
}
