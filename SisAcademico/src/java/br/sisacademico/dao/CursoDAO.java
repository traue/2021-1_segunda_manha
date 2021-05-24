package br.sisacademico.dao;

import br.sisacademico.model.Curso;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class CursoDAO {
    
    private static Statement stm = null;
    
    public Map<Curso, Integer> getTodosCursosCountAlunos() throws SQLException {
        Map<Curso, Integer> relatorio = new HashMap<Curso, Integer>();
        
        String query = "SELECT  curso.\"idCurso\", \n" +
                        "        curso.\"nome_curso\", \n" +
                        "        curso.\"tipo_curso\",\n" +
                        "        (SELECT COUNT(*) \n" +
                        "           FROM \"tb_aluno\" \n" +
                        "          WHERE \"idCurso\" = curso.\"idCurso\") as alunos\n" +
                        "FROM \"tb_curso\" as curso";
        
        stm = ConnectionFactory.getConnection().createStatement(
                ResultSet.TYPE_SCROLL_INSENSITIVE, 
                ResultSet.CONCUR_READ_ONLY);
        
        ResultSet resultados = stm.executeQuery(query);
        
        while(resultados.next()) {
            Curso c = new Curso();
            c.setIdCurso(resultados.getInt("idCurso"));
            c.setNomeCurso(resultados.getString("nome_curso"));
            c.setTipoCurso(resultados.getString("tipo_curso"));
            int qtdAlunos = resultados.getInt("alunos");
            
            relatorio.put(c, qtdAlunos);
        }
        
        stm.getConnection().close();
        
        return relatorio;
    }
    
}