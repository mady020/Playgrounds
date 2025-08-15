//
//  ViewController.swift
//  EventDraftApp
//
//  Created by Student on 12/08/25.
//

import UIKit

class FirstViewController: UIViewController , Test{
    @IBOutlet var newDraftButton: UIButton!
    
    @IBOutlet var noDraftsMessage: UILabel!
    @IBOutlet var editButton: UIButton!
    @IBOutlet var eventStack: UIStackView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
    @IBOutlet var attendeeCount: UILabel!
    
    func passData(title: String?, date: String?, location: String?, attendeeCount: String?) {
        titleLabel.text = title ?? ""
//        event.title = title
        dateLabel.text = date ?? ""
        locationLabel.text = location ?? ""
        self.attendeeCount.text = attendeeCount
    }
    func updateUI(){
        guard let event else {return}
        titleLabel.text = event.title
        dateLabel.text = event.date
        locationLabel.text = event.location
        attendeeCount.text = event.attendeeCount
    }
    
    var event:Event? = Event(title: "Meeting with clients", date: "12-08-2025", location: "conference Hall", attendeeCount: "8")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        noDraftsMessage.isHidden = true
        newDraftButton.isHidden = true
        updateUI()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navigationController = segue.destination as? UINavigationController {
            if let  secondVC = navigationController.topViewController as? SecondViewController {
                secondVC.event = event
                secondVC.delegate = self
            }
           
        }
    }
    
    @IBAction func unwindToFirst(segue: UIStoryboardSegue){
    }
    @IBAction func unwindToFirstAndDelete(segue: UIStoryboardSegue){
        eventStack.isHidden = true
        editButton.isHidden = true
        noDraftsMessage.isHidden = false
        newDraftButton.isHidden = false
        
    }
}
