//
//  Sorteador.swift
//  SorteadorAlunos
//
//  Created by Matheus B. Grigoletto on 03/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Sorteador {
    private var grupos: [Grupo] = []
    private var alunos: [Aluno] = []
    
    init(comAlunos alunos: [Aluno]) {
        self.alunos = alunos
    }
    
    func sortear(quantidadeAlunos: Int) -> [Grupo] {
        self.grupos = []
        
        var alunosEmbaralhados: [Aluno] = self.alunos.shuffled()
        
        var grupo: Grupo = Grupo()
        
        while alunosEmbaralhados.count > 0 {
            if (grupo.obterAlunos().count == quantidadeAlunos) {
                grupos.append(grupo)
                grupo = Grupo()
            }
            
            if let ultimoAlunoDoArray = alunosEmbaralhados.popLast() {
                grupo.adicionarAluno(ultimoAlunoDoArray)
            }
        }
        
        self.grupos.append(grupo)
        
        return self.grupos
    }
}
