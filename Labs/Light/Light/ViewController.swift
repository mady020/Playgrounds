//
//  ViewController.swift
//  Light
//
//  Created by Student on 22/07/25.
//

import UIKit

class ViewController: UIViewController {
    var lightOn = true
    fileprivate func updateUI() {
        view.backgroundColor = lightOn ? .white : .black
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        lightOn.toggle()
        updateUI()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

