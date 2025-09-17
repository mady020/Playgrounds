//
//  new-toDoTableViewController.swift
//  Todo
//
//  Created by student on 01/09/25.
//

import UIKit

class new_toDoTableViewController: UITableViewController {

    
    var isDatePickerHidden = true
    let dateLabelIndexPath = IndexPath(row: 0, section: 1)
    let datePickerIndexPath = IndexPath(row: 1, section: 1)
    let notesIndexPath = IndexPath(row: 0, section: 2)
    
    var toDo : ToDo?
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var isComplete: UIButton!
    
    @IBOutlet weak var dueDateLabel: UILabel!
    
    @IBOutlet weak var dueDatedatePicker: UIDatePicker!
    
    @IBOutlet weak var notesTextView: UITextField!
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    
    
    func updateSaveButtonState(){
        let shouldEnableSaveButton = titleTextField.text?.isEmpty == false
             saveButton.isEnabled = shouldEnableSaveButton
    }
    
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad ( )
        let currentDueDate: Date
        if let toDo = toDo {
            navigationItem.title = "To-Do"
            titleTextField.text = toDo.title
            isComplete.isSelected = toDo.inComplete
            currentDueDate = toDo.dueDate
            notesTextView.text = toDo.notes
        } else {
            currentDueDate = Date() .addingTimeInterval (24*60*60)
        }
        dueDatedatePicker.date = currentDueDate
        updateDueDateLabel(date: currentDueDate)
        updateSaveButtonState ()
    }

    @IBAction func returnPressed(_ sender : UITextField)
    {
        sender.resignFirstResponder()
    }

    @IBAction func isCompleteButton(_ sender: Any) {
        isComplete.isSelected.toggle()
    }
    
    
    
    
    func updateDueDateLabel(date : Date)
    {
        dueDateLabel.text = date.formatted(.dateTime.month(.defaultDigits).day().year(.twoDigits).hour().minute())
    }
    
    @IBAction func datePeckerChanged(_ sender: UIDatePicker) {
        updateDueDateLabel(date: sender.date)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath
        {
        case datePickerIndexPath where isDatePickerHidden == true:
            return 0
        case notesIndexPath:
            return 200
        default :
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath
        {
        case datePickerIndexPath:
            return 216
        case notesIndexPath :
            return 200
            
        default:
            return UITableView.automaticDimension
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath == dateLabelIndexPath
        {
            isDatePickerHidden.toggle()
            updateDueDateLabel(date: dueDatedatePicker.date)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let title = titleTextField.text ?? ""
        let isCompleteValue = isComplete.isSelected
        let dueDate = dueDatedatePicker.date
        let notes = notesTextView.text
        
        if var existingToDo = toDo {
            // ✅ Update existing ToDo instead of creating new
            existingToDo.title = title
            existingToDo.inComplete = isCompleteValue
            existingToDo.dueDate = dueDate
            existingToDo.notes = notes
        } else {
            // ✅ Only create a new ToDo if none exists
            toDo = ToDo(title: title,
                        isComplete: isCompleteValue,
                        dueDate: dueDate,
                        notes: notes)
        }
    }

    


}
