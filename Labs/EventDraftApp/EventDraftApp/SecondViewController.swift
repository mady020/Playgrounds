//
//  SecondViewController.swift
//  EventDraftApp
//
//  Created by Student on 12/08/25.
//

import UIKit

class SecondViewController: UIViewController {
    
    var event:Event?
    var delegate:Test?
    
    @IBOutlet var titleField: UITextField!
    
    @IBOutlet var dateField: UITextField!
    
    @IBOutlet var locationField: UITextField!
    
    @IBOutlet var attendeeCountField: UITextField!
    
    func updateUI(){
        guard let event else {return}
        titleField.text = event.title
        dateField.text = event.date
        locationField.text = event.location
        attendeeCountField.text = event.attendeeCount
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        delegate?.passData(title: titleField.text, date: dateField.text, location: locationField.text, attendeeCount: attendeeCountField.text)
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
