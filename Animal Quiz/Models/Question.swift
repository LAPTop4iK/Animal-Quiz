//
//  Question.swift
//  Animal Quiz
//
//  Created by Nikita Laptyonok on 13.03.2021.
//

import Foundation

enum ResponceType {
    case single
    case multiply
    case range
}

struct Question {
    let text: String
    let type: ResponceType
    let answer: [Answer]
    
}

extension Question {
    static func getQuestion() -> [Question] {
        return [
            Question(text: "Какую пищу вы предпочитаете?",
                     type: .single,
                     answer: [
                        Answer(text: "Стейк", type: .dog),
                        Answer(text: "Рыба", type: .cat),
                        Answer(text: "Морковь", type: .rabbit),
                        Answer(text: "Кукуруза", type: .turtle)
                     ]
            ),
            Question(text: "Что вы любите делать?",
                     type: .multiply,
                     answer: [
                        Answer(text: "Плавать", type: .dog),
                        Answer(text: "Спать", type: .cat),
                        Answer(text: "Обниматься", type: .rabbit),
                        Answer(text: "Есть", type: .turtle)
                     ]
            ),
            Question(text: "Любите ли вы поездки на машине?",
                     type: .range,
                     answer: [
                        Answer(text: "Обожаю", type: .dog),
                        Answer(text: "Люблю", type: .cat),
                        Answer(text: "Безразлична", type: .rabbit),
                        Answer(text: "Ненавижу", type: .turtle)
                     ]
            ),
        ]
    }
}
