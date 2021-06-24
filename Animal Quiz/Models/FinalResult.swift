//
//  FinalResult.swift
//  Animal Quiz
//
//  Created by Nikita Laptyonok on 18.03.2021.
//

import Foundation

struct FinalResult {
    var resultArrays : [Answer]?
    
    var final: Answer?
    
    func chooseAnswer(answers: [Answer]) {
        var resultsDictionary = [AnimalType : Int]()
        for result in answers {
            resultsDictionary[result.type] = 0
            
        }
        
    }
}
