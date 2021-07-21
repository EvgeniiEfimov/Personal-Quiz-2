//
//  ResultsViewController.swift
//  Personal Quiz
//
//  Created by brubru on 19.07.2021.
//  Copyright © 2021 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    // 1. Передать сюда массив с ответами
    // 2. Определить наиболее часто встерчающийся тип живтоного
    // 3. Отобразить результат в соответсвии с этим животным
    // 4. Избавиться от кнопки возврата назад на экране результатов
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var textResultString: UILabel!
    
    private var newArray = [(Type: AnimalType, TypeCount: Int)]()
    
    var arrayQuestion: [Answer]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        sortedResult()
     
        resultLabel.text = "Вы - \( newArray.first?.Type.rawValue ?? " ")"
        textResultString.text = newArray.first?.Type.definition
    }
    
    func sortedResult() {
        for value in arrayQuestion ?? [] {
            switch value.type{
            case .cat:
               var catType = 0
                catType += 1
                newArray.append((.cat, catType))
            case .dog:
                var dogType = 0
                dogType += 1
                newArray.append((.dog, dogType))
            case .rabbit:
                var rabbitType = 0
                rabbitType += 1
                newArray.append((.rabbit, rabbitType))
            default:
                var turtleType = 0
                turtleType += 1
                newArray.append((.turtle, turtleType))
            }
        }
        newArray.sort(by: {$0.TypeCount > $1.TypeCount})
    }
    }
    
