//
//  SecondViewController.swift
//  data passing practice
//
//  Created by Student on 11/08/25.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var secondLabel: UILabel!
    
    @IBOutlet var secondSlider: UISlider!
        
    @IBOutlet var secondTextField: UITextField!
    
    var sliderData: Float?
    var textFieldData: String?

    var delegate: Test?
    func updateUI(){
        secondLabel.text = textFieldData ?? "Label 2"
        secondSlider.setValue(sliderData ?? 0.0, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI();

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        sliderData = secondSlider.value
        textFieldData = secondTextField.text
        delegate?.passData(sliderData: sliderData, textFieldData: textFieldData);
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
