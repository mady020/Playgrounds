//
//  EditEmojiTableViewController.swift
//  tableViewDemo
//
//  Created by Student on 15/09/25.
//

import UIKit

class AddEditEmojiTableViewController: UITableViewController {

    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    
    var emoji: Emoji? = nil
    var indexPath: IndexPath? = nil
 
    @IBAction func doneButtonTapped(_ sender: UIBarButtonItem) {
        let emoji = Emoji(
           symbol: symbolTextField.text ?? "",
            name: nameTextField.text ?? "",
           description: descriptionTextField.text ?? "",
            usage: usageTextField.text ?? ""
        )
        self.emoji = emoji
        performSegue(withIdentifier: "saveSegue", sender: nil)
    }
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
            title = "Edit Emoji"
        }else{
            title = "Add Emoji"
        }
    }
}
