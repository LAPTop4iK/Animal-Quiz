//
//  Answer.swift
//  Animal Quiz
//
//  Created by Nikita Laptyonok on 13.03.2021.
//

import Foundation

struct Answer {
    let text: String
    let type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶"
    case cat = "🐱"
    case rabbit = "🐰"
    case turtle = "🐢"
    
    var definition : String {
        switch self {
        case .dog:
            return "Вам нравится быть с друзбями. Вы окружаете себя людьми, которые вам нравятся и всегда готовы помочь."
        case .cat:
            return "Вы себе на уме. Любите гулять сами по себе. Вы цените одиночество."
        case .rabbit:
            return "Вам нравится всё мягкое. Вы здоровы и полны энергии."
        case .turtle:
            return "Ваша сила - в мудрости. Медлительный и вдумчивый выигрывает на большой дистанции."
        }
    }
}

