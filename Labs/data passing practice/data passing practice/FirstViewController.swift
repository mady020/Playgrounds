//
//  ViewController.swift
//  data passing practice
//
//  Created by Student on 11/08/25.
//

import UIKit

class FirstViewController: UIViewController, Test {

    
    
    @IBOutlet var firstLabel: UILabel!
    @IBOutlet var firstTextField: UITextField!
    @IBOutlet var firstSlider: UISlider!
    

    
    func passData(sliderData: Float?, textFieldData: String?) {
        firstLabel.text = textFieldData ?? "Label 1"
        firstSlider.setValue(sliderData ?? 0.0, animated: true)
    }
      
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        firstTextField.text = ""
    }
    
    @IBAction func unwindToFirstVC(segue: UIStoryboardSegue){}
    
    // I want SecondViewController to send data back to FirstViewController, so I set secondVC.delegate = self in prepare(for:sender:). This gives the second VC a reference to the first VC via the delegate, so it can call methods on it.
    // Inside SecondViewController, when I want to send data back, I call the delegate method passData(...). This lets the first VC receive the data and update its UI.
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else {return}
        secondVC.delegate = self
        secondVC.sliderData = firstSlider.value
        secondVC.textFieldData = firstTextField.text
    }
}

    
