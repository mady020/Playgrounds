import UIKit

struct Result {
    var weight: Double
    var height: Double
    var bmi: Double {
        return weight / (height * height)
    }
}

class ViewController: UIViewController {
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var historyText: UITextView!
 

    
    @IBOutlet weak var historyLabel: UILabel!
    var results: [Result] = []

    @IBAction func calculateButton(_ sender: Any) {
  
        guard let weightText = weightTextField.text, let weight = Double(weightText), weight > 0 else {
            resultLabel.text = "Invalid Weight!"
            return
        }
     
        guard let heightText = heightTextField.text, let height = Double(heightText), height > 0 else {
            resultLabel.text = "Invalid Height!"
            return
        }

        let result = Result(weight: weight, height: height)
        results.append(result)


        resultLabel.text = "BMI: " + String(format: "%.2f", result.bmi)

        updateHistory()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateHistory()
       
    }

    func updateHistory() {
        if results.isEmpty {
            historyLabel.text = "No Result Found!"
        } else {
            historyLabel.text = "History"
            var historyString:String = ""
            for result in results {
                historyString += "Height: \(result.height), Weight: \(result.weight), BMI: \(String(format: "%.2f", result.bmi))\n"
            }
            print(historyString)
            historyText.text = historyString
        }
    }
}
