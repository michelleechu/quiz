//
//  ViewController.swift
//  quiz
//
//  Created by Michelle Chu on 7/19/18.
//  Copyright © 2018 bnr. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1;
        if currentQuestionIndex == questions.count { //count is a method for arrays, returns num of elements in array
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex] //initiating new const question
        nextQuestionLabel.text = question //text is method for text in label
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answers[currentQuestionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    
    //chapter 8


    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        nextQuestionLabel.alpha = 0
    }
    
    func animateLabelTransitions() {
//        UIView.animate(withDuration: 0.5, animations: {
//            self.currentQuestionLabel.alpha = 0
//            self.nextQuestionLabel.alpha = 1
//        })
        UIView.animate(withDuration: 0.5,
            delay: 0,
            options: [],
            animations: {
                self.currentQuestionLabel.alpha = 0
                self.nextQuestionLabel.alpha = 1
            },
            completion: { _ in
                swap(&self.currentQuestionLabel,
                    &self.nextQuestionLabel)
        })
    }
    
 
    

}

