//
//  ResultsViewController.swift
//  Personality Quiz
//
//  Created by Student on 23/07/25.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var resultAnswerLabel: UILabel!
    @IBOutlet var resultDefinationLabel: UILabel!
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
        // Do any additional setup after loading the view.
    }
    
    func calculatePersonalityResult(){
        var frequencyOfAnswers: [AnimalType : Int] = [:]
        for answer in responses{
            if let existingCount = frequencyOfAnswers[answer.type] {
                frequencyOfAnswers[answer.type] = existingCount + 1
            }else {
                frequencyOfAnswers[answer.type] = 1
            }
        }
//        let test = responses.reduce(into:
//            [AnimalType: Int]()) { (counts, answer) in
//            if let existingCount = counts[answer.type] {
//                counts[answer.type] = existingCount + 1
//            }else {
//                counts[answer.type] = 1
//            }
//        }
        
        // sort them based on their values
        // $0.1 , $1.1 , here $0 and $1 means the two answers we are comparing, and .1 is means the value, .0 means the key
        let mostCommonAnswer = frequencyOfAnswers.sorted { $0.1 > $1.1 }.first!.key
        
        resultAnswerLabel.text = "You are a \(mostCommonAnswer.rawValue)!"
        resultDefinationLabel.text = mostCommonAnswer.defination
    }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
