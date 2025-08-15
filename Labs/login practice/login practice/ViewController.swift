//
//  ViewController.swift
//  login practice
//
//  Created by Student on 30/07/25.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var forgotUsernameButton: UIButton!
    @IBOutlet var forgotPasswordButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let sender = sender as? UIButton else {
            return
        }
        if sender == forgotPasswordButton {
            segue.destination.title = "Forgot Password?"
        }else if sender == forgotUsernameButton {
            segue.destination.title = "Forgot Username?"
        }else {
            segue.destination.title = "Welcome Back, \(userName.text ?? "")"
        }
    }

    @IBAction func forgotUsernameButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "viewControllerSegue" , sender: sender)
    }
    
    @IBAction func forgotPasswordButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "viewControllerSegue" , sender: sender)
    }
}

