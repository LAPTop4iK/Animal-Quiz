//
//  QuestionViewController.swift
//  Animal Quiz
//
//  Created by Nikita Laptyonok on 13.03.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var rangeSlider: UISlider!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var singleButtons: [UIButton]!
    @IBOutlet var multipleLabels: [UILabel]!
    @IBOutlet var rangedLabels: [UILabel]!
    
    // MARK: Properties
    private let questions = Question.getQuestion()
    private var questionIndex = 0
    private var currentAnswers : [Answer] {
        questions[questionIndex].answer
    }
    private var answerChosen : [Answer] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    @IBAction func singleButtonPressed(_ sender: UIButton) {
        guard let currentIndex = singleButtons.firstIndex(of: sender) else {
            return }
        let currentAnswer = currentAnswers[currentIndex]
        answerChosen.append(currentAnswer)
        
        newQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
    }
    
    @IBAction func rangedAnswerButtonPressed() {
    }
    
    
    
}





// MARK: Private
extension QuestionViewController {
    private func updateUI() {
        //Hide stacks
        for stackView in [singleStackView, multipleStackView, rangedStackView] {
            stackView?.isHidden = true
        }
        // get current question
        let currentQuestion = questions[questionIndex]
        
        // set current question for label
        questionLabel.text = currentQuestion.text
        
        // calculateProgress
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        // set progress for progressView
        progressView.setProgress(totalProgress, animated: true)
        
        title = "Вопрос № \(questionIndex+1) из \(questions.count)"
        
        // show current StackView
        showCurrentStackView(for: currentQuestion.type)
    }
    
    private func showCurrentStackView(for type: ResponceType) {
        switch type {
        case .single:
            showSingleStackView(with: currentAnswers)
        case .multiply:
            showMultipleStackView(with: currentAnswers)
        case .range:
            showRangeStackView(with: currentAnswers)
        }
    }
    
    private func showSingleStackView(with answers: [Answer]) {
        singleStackView.isHidden = false
        
        for (button, answer) in zip(singleButtons, answers)  {
            button.setTitle(answer.text, for: .normal)
        }
    }
    private func showMultipleStackView(with answers: [Answer]) {
        singleStackView.isHidden = true
        multipleStackView.isHidden = false
        
        for (label, answer) in zip(multipleLabels, answers) {
            label.text = answer.text
        }
    }
    private func showRangeStackView(with answers: [Answer]) {
        multipleStackView.isHidden = true
        rangedStackView.isHidden = false
        rangedLabels.first?.text = answers.first?.text
        rangedLabels.last?.text = answers.last?.text
    }
    
    private func newQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
}




