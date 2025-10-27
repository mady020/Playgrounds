//
//  AddRegistrationTableViewController.swift
//  ComplexInputScreens
//
//  Created by Student on 27/08/25.
//

import UIKit

class AddRegistrationTableViewController: UITableViewController, SelectRoomTypeTableViewControllerDelegate {
    
    func selectRoomTypeTableViewController(
        _ controller: SelectRoomTypeTableViewController,
        didSelect roomType: RoomType
    ) {
        self.roomType = roomType
        updateRoomType()
    }
    
    @IBSegueAction func selectRoomType(_ coder: NSCoder) -> SelectRoomTypeTableViewController? {
        let selectRoomTypeTableViewController = SelectRoomTypeTableViewController(coder: coder)
        selectRoomTypeTableViewController?.delegate = self
        selectRoomTypeTableViewController?.roomType = roomType
        return selectRoomTypeTableViewController
    }
    

    
    var roomType: RoomType?
    var registrationData: Registration?
    let checkInDatePickerCellIndexPath = IndexPath(row: 1, section: 1)
    let checkOutDatePickerCellIndexPath = IndexPath(row: 3, section: 1)
    
    let checkInDateLabelCellIndexPath = IndexPath(row: 0, section: 1)
    let checkOutDateLabelCellIndexPath = IndexPath(row: 2, section : 1)
    
    var registration: Registration? {
        guard let roomType else {return nil}
        let firstName = firstNameTextField.text ?? ""
        let lastName = lastNameTextField.text ?? ""
        let email = emailTextField.text ?? ""
        let checkInDate = checkInDatePicker.date
        let checkOutDate = checkOutDatePicker.date
        let numberOfAdults = Int(numberOfAdultsStepper.value)
        let numberOfChildren = Int(numberOfChildrenStepper.value)
        let hasWifi = wifiSwitch.isOn
        if numberOfAdults < 1 { return nil}
        return Registration(
            firstName: firstName,
            lastName: lastName,
            emailAddress: email,
            checkInDate: checkInDate,
            checkOutDate: checkOutDate,
            numberOfAdults: numberOfAdults,
            numberOfChildren: numberOfChildren,
            wifi: hasWifi,
            roomType: roomType
        )
    }
    
    
    
    var isCheckInDatePickerVisible: Bool = false {
        didSet {
            checkInDatePicker.isHidden = !isCheckInDatePickerVisible
        }
    }
    var isCheckOutDatePickerVisible: Bool = false {
        didSet {
            checkOutDatePicker.isHidden = !isCheckOutDatePickerVisible
        }
    }
    
    

    @IBOutlet var firstNameTextField: UITextField!
    @IBOutlet var lastNameTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var checkInDateLabel: UILabel!
    @IBOutlet var checkInDatePicker: UIDatePicker!
    
    @IBOutlet var checkOutDateLabel: UILabel!
    @IBOutlet var checkOutDatePicker: UIDatePicker!
    
    
    @IBOutlet var numberOfAdultsLabel: UILabel!
    @IBOutlet var numberOfAdultsStepper: UIStepper!
    
    @IBOutlet var numberOfChildrenLabel: UILabel!
    @IBOutlet var numberOfChildrenStepper: UIStepper!
    
    
    @IBOutlet var wifiSwitch: UISwitch!
    
    @IBOutlet var roomTypeLabel: UILabel!
   
    
    // charges section
    @IBOutlet var numberOfDays: UILabel!
    @IBOutlet var checkInCheckOutDate: UILabel!
    
    @IBOutlet var roomTypePrice: UILabel!
    @IBOutlet var roomTypeInfo: UILabel!
    
    @IBOutlet var wifiPrice: UILabel!
    @IBOutlet var wifiStatus: UILabel!
    
    @IBOutlet var totalPrice: UILabel!
    
    
    func updateDateViews(){
        if  registrationData == nil{
            checkOutDatePicker.minimumDate = Calendar.current
                .date(byAdding: .day, value: 1, to: checkInDatePicker.date)
        }
    
        
        checkInDateLabel.text = checkInDatePicker.date
            .formatted(date: .abbreviated, time: .omitted)
        checkOutDateLabel.text = checkOutDatePicker.date
            .formatted(date: .abbreviated, time: .omitted)
    }
    
    func updateNumberOfGuests(){
        numberOfAdultsLabel.text = "\(Int(numberOfAdultsStepper.value))"
        numberOfChildrenLabel.text = "\(Int(numberOfChildrenStepper.value))"
    }
    func updateRoomType(){
        guard let roomType else {
            roomTypeLabel.text = "Not Set"
            updateChargesSection()
            return
        }
        roomTypeLabel.text = roomType.name
        updateChargesSection()
    }
    
    func updateDoneButtonState(){

        if self.registration != nil {
            navigationItem.rightBarButtonItem?.isEnabled = true
        }
    }
    
    
    func updateChargesSection() {
        guard let roomType else {
            numberOfDays.text = "0"
            checkInCheckOutDate.text = "N/A"
            roomTypePrice.text = "-"
            roomTypeInfo.text = "Select a room type"
            wifiPrice.text = "-"
            wifiStatus.text = "No WiFi"
            totalPrice.text = "-"
            return
        }
    
        let calendar = Calendar.current
        let start = calendar.startOfDay(for: checkInDatePicker.date)
        let end = calendar.startOfDay(for: checkOutDatePicker.date)
        
        let interval = end.timeIntervalSince(start)
        let days = Int(interval / (60 * 60 * 24))

        
        numberOfDays.text = "\(days)"
        

        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        checkInCheckOutDate.text = "\(dateFormatter.string(from: start)) – \(dateFormatter.string(from: end))"

        let roomPrice = roomType.price
        roomTypePrice.text = String(format: "$%.2f", Double(roomPrice))
        roomTypeInfo.text = roomType.name
        
 
        let wifiCost = wifiSwitch.isOn ? 10.0 * Double(days) : 0.0
        wifiPrice.text = wifiSwitch.isOn ? "$\(wifiCost)" : "$0.00"
        wifiStatus.text = wifiSwitch.isOn ? "Yes" : "No"
        

        let total = (Double(days) * Double(roomPrice)) + wifiCost
        totalPrice.text = String(format: "$%.2f", total)
    }

    
    
    func updateUI(data: Registration){
        firstNameTextField.text  = data.firstName
        lastNameTextField.text  = data.lastName
        emailTextField.text = data.emailAddress
        
        checkInDatePicker.date = data.checkInDate
        checkOutDatePicker.date = data.checkOutDate
        updateDateViews()
        
        numberOfAdultsStepper.value = Double(data.numberOfAdults)
        numberOfChildrenStepper.value = Double(data.numberOfChildren)
        updateNumberOfGuests()
        
        wifiSwitch.setOn(data.wifi,animated: true)
        roomType = data.roomType
        updateRoomType()
    }
    
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        updateDateViews()
        updateChargesSection()
        updateDoneButtonState()
    }
    
    @IBAction func stepperValueChanged(_ sender: Any) {
        updateNumberOfGuests()
        updateChargesSection()
        updateDoneButtonState()
    }
    @IBAction func wifiSwitchChanged(_ sender: Any) {
        updateChargesSection()
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if let registrationData  {
                updateUI(data: registrationData)
            } else {
                navigationItem.rightBarButtonItem?.isEnabled = false
                let midnightToday = Calendar.current.startOfDay(for: Date())
                checkInDatePicker.minimumDate = midnightToday
                checkInDatePicker.date = midnightToday
                updateDateViews()
                updateNumberOfGuests()
                updateRoomType()
                
            }
    }
    override func viewWillAppear(_ animated: Bool) {
        updateDoneButtonState()
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath {
        case checkInDatePickerCellIndexPath where isCheckInDatePickerVisible == false:
            return 0
        case checkOutDatePickerCellIndexPath where
            isCheckOutDatePickerVisible == false:
            return 0
        default:
            return UITableView.automaticDimension
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath{
        case checkInDatePickerCellIndexPath:
            return 190
        case checkOutDatePickerCellIndexPath:
            return 190
        default:
            return UITableView.automaticDimension
        }
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let isCheckInLabelTapped = indexPath == checkInDateLabelCellIndexPath
        let isCheckOutLabelTapped = indexPath == checkOutDateLabelCellIndexPath
        
        tableView.beginUpdates()
        
        if isCheckInLabelTapped {
            isCheckInDatePickerVisible.toggle()
            if isCheckOutDatePickerVisible {
                isCheckOutDatePickerVisible = false
            }
        } else if isCheckOutLabelTapped {
            isCheckOutDatePickerVisible.toggle()
            if isCheckInDatePickerVisible {
                isCheckInDatePickerVisible = false
            }
        }
        
        tableView.endUpdates()
    }
}
