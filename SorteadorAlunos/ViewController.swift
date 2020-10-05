//
//  ViewController.swift
//  SorteadorAlunos
//
//  Created by Matheus B. Grigoletto on 03/10/20.
//  Copyright © 2020 Matheus B. Grigoletto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var alunos: [Aluno] = []
    var grupos: [Grupo] = []
    var currentIndex: Int = 0
    var qtdAlunosPorGrupo: Int = 6
    
    @IBOutlet weak var sortearButton: UIButton!
    @IBOutlet weak var paginacaoSteper: UIStepper!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var grupoLabel: UILabel!
    @IBOutlet weak var aluno1Label: UILabel!
    @IBOutlet weak var aluno2Label: UILabel!
    @IBOutlet weak var aluno3Label: UILabel!
    @IBOutlet weak var aluno4Label: UILabel!
    @IBOutlet weak var aluno5Label: UILabel!
    @IBOutlet weak var aluno6Label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.initialization()
    }
    
    private func initialization() {
        self.initUIElements()
        self.initLogic()
    }
    
    private func initUIElements() {
        self.sortearButton.layer.cornerRadius = 6
        self.paginacaoSteper.layer.cornerRadius = 6
        
        self.aluno1Label.text = ""
        self.aluno2Label.text = ""
        self.aluno3Label.text = ""
        self.aluno4Label.text = ""
        self.aluno5Label.text = ""
        self.aluno6Label.text = ""
        
        self.paginacaoSteper.minimumValue = 0;
        self.paginacaoSteper.stepValue = 1;
    }
    
    private func initLogic() {
        for nome in alunosData {
            self.alunos.append(Aluno(nome))
        }
        
        self.sortear()
    }
    
    private func sortear() {
        self.grupos = Sorteador(comAlunos: self.alunos).sortear(quantidadeAlunos: self.qtdAlunosPorGrupo)
        self.paginacaoSteper.maximumValue = Double(grupos.count) - 1
        self.atualiza(numGrupo: 0)
    }

    @IBAction func handleSortearTouch(_ sender: UIButton) {
        sender.isHidden = true
        self.stackView.isHidden = false
        self.paginacaoSteper.isHidden = false
    }
    
    @IBAction func handlePaginacaoSteperChange(_ sender: UIStepper) {
        self.atualiza(numGrupo: Int(sender.value))
    }
    
    func atualiza(numGrupo: Int) {
        let grupo: Grupo = self.grupos[numGrupo]
        let alunos = grupo.obterAlunos()
        
        self.grupoLabel.text = "Grupo \(numGrupo + 1)"
        self.aluno1Label.text = alunos.count > 0 ? alunos[0].nome : ""
        self.aluno2Label.text = alunos.count > 1 ? alunos[1].nome : ""
        self.aluno3Label.text = alunos.count > 2 ? alunos[2].nome : ""
        self.aluno4Label.text = alunos.count > 3 ? alunos[3].nome : ""
        self.aluno5Label.text = alunos.count > 4 ? alunos[4].nome : ""
        self.aluno6Label.text = alunos.count > 5 ? alunos[5].nome : ""
        
    }
}

