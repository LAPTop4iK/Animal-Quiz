//
//  FinalViewController.swift
//  Animal Quiz
//
//  Created by Nikita Laptyonok on 13.03.2021.
//

import UIKit

class FinalViewController : UIViewController {
    var answerArray : [Answer]!
    @IBOutlet weak var mainResultLabel: UILabel!
    @IBOutlet weak var descriptionResultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        let resultAnimalType = getMaxAnimal()
        updateUI(with: resultAnimalType)
        //        print(findAnswer(array: answerArray!))
    }
    
}
// MARK: - Private metods
extension FinalViewController {
    
    private func getMaxAnimal() -> AnimalType? {
        return Dictionary(grouping: answerArray, by: { $0.type })
            .sorted(by: {$0.value.count > $1.value.count})
            .first?.key
    }
    
    private func updateUI(with animal: AnimalType?) {
        mainResultLabel.text = "Вы – \(animal?.rawValue ?? "🐶")!"
        descriptionResultLabel.text = animal?.definition ?? ""
    }
}
//    private func updateResult() {
//        var frequencyOfAnimals: [AnimalType: Int] = [:]
//        let animals = answerArray.map { $0.type }
//
//    }


        
        //        for animal in animals {
        //            if let animalTypeCount = frequencyOfAnimals[animal] {
        //                frequencyOfAnimals.updateValue(animalTypeCount + 1, forKey: animal)
        //            } else {
        //                frequencyOfAnimals[animal] = 1
        //            }
        //        }
        //        for animal in animals {
        //            frequencyOfAnimals[animal] = (frequencyOfAnimals[animal] ?? 0 ) + 1
        //        }
        //        let sortedFrequencyOfAnimals = frequencyOfAnimals.sorted { $0.value > $1.value }
        //        guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
        //     }
        
//        let mostFrequencyAnimal = Dictionary(grouping: answerArray, by: { $0.type })
//            .sorted(by: {$0.value.count > $1.value.count})
//            .first?.key
        
        //    private func findAnswer(array : [Answer]) -> AnimalType {
        ////        [AnimalType : Int]
        //        var dictionary = [AnimalType : Int]()
        //        for answer in array {
        //            if dictionary.index(forKey: answer.type) == nil {
        //                dictionary[answer.type] = 0
        //            } else {
        //                dictionary[answer.type]! += 1
        //            }
        //        }
        //        let result = dictionary.max { a, b in a.value < b.value }
        //        return result!.key
        ////        return dictionary
        //    }
        //    // 1. Передать сюда массив с овтетами
        //    // 2. Определить наиболее часто встречающийся тип животного
        //    // 3. Отобразить результат на экране
        //    // 4. Избавиться от кнопки возврата на предыдущий экран
 
