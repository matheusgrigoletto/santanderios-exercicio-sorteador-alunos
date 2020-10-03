//
//  Grupo.swift
//  SorteadorAlunos
//
//  Created by Matheus B. Grigoletto on 03/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import Foundation

class Grupo {
    private var alunos: [Aluno] = []
    
    func adicionarAluno(_ aluno: Aluno) {
        self.alunos.append(aluno)
    }
    
    func obterAlunos() -> [Aluno] {
        return self.alunos
    }
}
