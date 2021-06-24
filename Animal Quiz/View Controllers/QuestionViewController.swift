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
    @IBOutlet weak var rangeSlider: UISlider! {
        didSet {
            let answerCount = Float(currentAnswers.count - 1)
            rangeSlider.value = answerCount
            //            let answersCount = Float(questions[questionIndex].answer.count - 1)
            //            rangeSlider.maximumValue = answersCount
        }
    }
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var rangedStackView: UIStackView!
    
    @IBOutlet var multipleSwitches: [UISwitch]!
    
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
        
        nextQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed() {
        for (multipleSwitch, answer) in zip(multipleSwitches, currentAnswers) {
            if multipleSwitch.isOn {
                answerChosen.append(answer)
            }
        }
        nextQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed() {
        //        let index = Int(rangeSlider.value)
        switch rangeSlider.value {
        case 0...0.3:
            let index = 3
            answerChosen.append(currentAnswers[index])
        case 0.31...0.6:
            let index = 2
            answerChosen.append(currentAnswers[index])
        case 0.61...0.85:
            let index = 1
            answerChosen.append(currentAnswers[index])
        case 0.86...1:
            let index = 0
            answerChosen.append(currentAnswers[index])
        default:
            break
        }
        nextQuestion()
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
        rangedLabels.first?.text = answers.last?.text
        rangedLabels.last?.text = answers.first?.text
    }
    
    private func nextQuestion() {
        questionIndex += 1
        if questionIndex < questions.count {
            updateUI()
            print(answerChosen)
            return
        }
        performSegue(withIdentifier: "showResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showResult" {
            let finalVC = segue.destination as! FinalViewController
            finalVC.answerArray = answerChosen
        }
    }
}




