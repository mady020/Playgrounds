//
//  ViewController.swift
//  segue
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {
       
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var textField: UITextField!
    @IBAction func unwindToRed(_ unwindSegue: UIStoryboardSegue) {
    }
    @IBAction func goToYellowButtonTapped(_ sender: Any) {
        if switchButton.isOn {
            performSegue(withIdentifier: "yellow", sender: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            segue.destination.navigationItem.title = textField.text
    }
}
