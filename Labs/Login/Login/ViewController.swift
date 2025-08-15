//
//  ViewController.swift
//  Login
//
//  Created by Student on 18/07/25.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    override func viewDidLoad() {
        infoLabel.text = ""
        super.viewDidLoad()
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        if username.text == "mady" && password.text == "pass" {
            performSegue(withIdentifier: "changeView", sender: nil)
        }else {
            infoLabel.textColor = .red
            infoLabel.text = "Invalid Email or password!"
        }
    }
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var password: UITextField!
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "forgotUsername" {
            segue.destination.navigationItem.title = "Forgot Username"
        }else if segue.identifier == "forgotPassword"{
            segue.destination.navigationItem.title = "Forgot Password"
        }else if segue.identifier == "changeView" {
            let name = username.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            segue.destination.navigationItem.title = "Welcome, \(name ?? "User")!"
        }
    }
}
