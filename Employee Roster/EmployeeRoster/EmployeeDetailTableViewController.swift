
import UIKit

protocol EmployeeDetailTableViewControllerDelegate: AnyObject {
    func employeeDetailTableViewController(_ controller: EmployeeDetailTableViewController, didSave employee: Employee)
}

class EmployeeDetailTableViewController: UITableViewController, UITextFieldDelegate, EmployeeTypeTableViewControllerDelegate {
    
    
    var employeeType: EmployeeType?
    func employeeTypeTableViewController(
        _ controller: EmployeeTypeTableViewController,
        didSelect: EmployeeType
    ) {
        self.employeeType = didSelect
        employeeTypeLabel.textColor = .black
        employeeTypeLabel.text = employeeType?.description
        updateSaveButtonState()
    }

    
    var birthdayDatePickerIndexPath = IndexPath(row: 2, section: 0)
    var isEditingBirthday = false {
        didSet{
            dobDatePicker.isHidden = !isEditingBirthday
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    @IBAction func birthdayDatePickerValueChanged(_ sender: UIDatePicker) {
        
        dobLabel.text = dobDatePicker.date
            .formatted(date: .abbreviated, time: .omitted)
    }
    
    
    @IBOutlet var dobDatePicker: UIDatePicker!
    
    
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var dobLabel: UILabel!
    @IBOutlet var employeeTypeLabel: UILabel!
    @IBOutlet var saveBarButtonItem: UIBarButtonItem!
    
    weak var delegate: EmployeeDetailTableViewControllerDelegate?
    var employee: Employee?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let calendar = Calendar.current
           let today = Date()

           if let maxDate = calendar.date(byAdding: .year, value: -16, to: today),
              let minDate = calendar.date(byAdding: .year, value: -65, to: today) {
               dobDatePicker.maximumDate = maxDate
               dobDatePicker.minimumDate = minDate
           }
        updateView()
        updateSaveButtonState()
    }
    
    func updateView() {
        if let employee = employee {
            navigationItem.title = employee.name
            nameTextField.text = employee.name
            
            dobLabel.text = employee.dateOfBirth.formatted(date: .abbreviated, time: .omitted)
            dobLabel.textColor = .label
            employeeType = employee.employeeType
            employeeTypeLabel.text = employee.employeeType.description
            employeeTypeLabel.textColor = .label
        } else {
            navigationItem.title = "New Employee"
           
        }
    }
    
    private func updateSaveButtonState() {
     
        let nameIsNotEmpty = !(nameTextField.text?.isEmpty ?? true)
           saveBarButtonItem.isEnabled = employeeType != nil && nameIsNotEmpty
        
    }
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let name = nameTextField.text else {
            return
        }
        
        let employee = Employee(
            name: name,
            dateOfBirth: dobDatePicker.date,
            employeeType: .exempt
        )
        delegate?.employeeDetailTableViewController(self, didSave: employee)
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        employee = nil
    }

    @IBAction func nameTextFieldDidChange(_ sender: UITextField) {
        updateSaveButtonState()
    }

    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let dateOfBirthLabelIndexPath = IndexPath(row: 1, section: 0)
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath == dateOfBirthLabelIndexPath{
            isEditingBirthday.toggle()
            dobLabel.textColor = .label
            dobLabel.text = dobDatePicker.date.formatted(
                date: .abbreviated,
                time: .omitted
            )
        }
        if indexPath == IndexPath(row: 0, section: 1){
            performSegue(withIdentifier: "typeSegue", sender: nil)
        }
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath == birthdayDatePickerIndexPath && isEditingBirthday == false{
            return 0
        }
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch(indexPath){
        case birthdayDatePickerIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }

    @IBSegueAction func showEmployeeTypes(_ coder: NSCoder) -> EmployeeTypeTableViewController? {
        let instance = EmployeeTypeTableViewController(coder: coder)
        instance?.delegate = self
        return instance
    }
    
}
