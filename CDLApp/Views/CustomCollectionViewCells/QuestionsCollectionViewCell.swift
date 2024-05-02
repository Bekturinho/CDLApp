//
//  QuestionsCollectionViewCell.swift
//  CDLApp
//
//  Created by fortune cookie on 4/30/24.
//

import UIKit

class QuestionsCollectionViewCell: UICollectionViewCell{
    private lazy var questionsNuMLabel: UILabel = {
        let label = UILabel()
        label.text = "QUESTION N1"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        return label
    }()
    
    private lazy var questionsLabel: UILabel = {
        let label = UILabel()
        label.text = "All air brake equipped vehicles have:"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    private lazy var chooseAnswerA : UIButton = {
        let button = UIButton()
        button.setTitle("A", for: .normal)
        button.backgroundColor = .systemYellow
        return button
    }()
    
    private lazy var chooseAnswerB : UIButton = {
        let button = UIButton()
        button.setTitle("B", for: .normal)
        button.backgroundColor = .systemPurple
        return button
    }()
    
    private lazy var chooseAnswerC : UIButton = {
        let button = UIButton()
        button.setTitle("C", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addAllSubs()
        addAllConstaints()
    }
    
    
    
    private func addAllSubs(){
        let uiElements =  [questionsLabel,questionsNuMLabel,chooseAnswerA,chooseAnswerB,chooseAnswerC]
        uiElements.forEach({addSubview($0)})
        uiElements.forEach({$0.translatesAutoresizingMaskIntoConstraints = false})

    }
    
    private func addAllConstaints(){
        NSLayoutConstraint.activate([
            questionsNuMLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            questionsNuMLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionsNuMLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            questionsLabel.topAnchor.constraint(equalTo: questionsNuMLabel.bottomAnchor, constant: 20),
            questionsLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            questionsLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            chooseAnswerA.topAnchor.constraint(equalTo: questionsLabel.bottomAnchor, constant: 40),
            chooseAnswerA.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chooseAnswerA.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            chooseAnswerB.topAnchor.constraint(equalTo: chooseAnswerA.bottomAnchor, constant: 20),
            chooseAnswerB.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chooseAnswerB.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            chooseAnswerC.topAnchor.constraint(equalTo: chooseAnswerB.bottomAnchor, constant: 20),
            chooseAnswerC.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            chooseAnswerC.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
        
        ])
    }
    
    func customizeAllData(number: String, question: String, a: String, b: String, c: String){
        questionsNuMLabel.text = number
        questionsLabel.text = question
        chooseAnswerA.setTitle(a, for: .normal)
        chooseAnswerB.setTitle(b, for: .normal)
        chooseAnswerC.setTitle(c, for: .normal)

        
    }
    
    
    
}

