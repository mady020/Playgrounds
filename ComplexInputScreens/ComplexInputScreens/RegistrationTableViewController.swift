//
//  RegistrationTableViewController.swift
//  ComplexInputScreens
//
//  Created by Student on 27/08/25.
//

import UIKit

class RegistrationTableViewController: UITableViewController {
    
    var registrations: [Registration] = loadRegistrations()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = self.editButtonItem
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return registrations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RegistrationCell", for: indexPath)
        let registration = registrations[indexPath.row]
        var content = cell.defaultContentConfiguration()
        
        content.text = "\(registration.firstName) \(registration.lastName)"
        content.secondaryText = (registration.checkInDate..<registration.checkOutDate)
            .formatted(
                date: .numeric,
                time: .omitted
            ) + ": " + registration.roomType.name
        cell.contentConfiguration = content
        return cell
    }
    
    
    @IBAction func  unwindFromAddRegistration(segue: UIStoryboardSegue) {
        // if the data from the form is nil, return earlier
        guard let addRegistrationTableViewController = segue.source as? AddRegistrationTableViewController, let registration = addRegistrationTableViewController.registration else {
            return
        }
        // if no cell was selected, append in the array and insert rows
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else{
            registrations.append(registration)
            let indexPath = IndexPath(row: registrations.count - 1, section: 0)
            tableView.insertRows(at: [indexPath], with: .fade)
            saveRegistration(registrations)
            return
        }
        // if a cell was selected, update in the array and reload Rows
        registrations[selectedIndexPath.row] = registration
        tableView.reloadRows(at: [selectedIndexPath], with: .fade)
        
        saveRegistration(registrations)
    }
    
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        performSegue(withIdentifier: "editRegistration", sender: registrations[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let registration = sender as? Registration else {return}
        
        guard let destNC = segue.destination as? UINavigationController, let destTVC = destNC.topViewController as? AddRegistrationTableViewController else {
            return
        }
        destTVC.registrationData = registration
    }
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
        
    override func tableView(
        _ tableView: UITableView,
        moveRowAt sourceIndexPath: IndexPath,
        to destinationIndexPath: IndexPath
    ) {
        let removedRegistration = registrations.remove(at: sourceIndexPath.row)
        registrations.insert(removedRegistration, at: destinationIndexPath.row)
        saveRegistration(registrations)
    }
    
    override func tableView(
        _ tableView: UITableView,
        commit editingStyle: UITableViewCell.EditingStyle,
        forRowAt indexPath: IndexPath
    ) {
        if editingStyle  == .delete {
            // remove from array
            registrations.remove(at: indexPath.row)
            // remove from table
            tableView.deleteRows(at: [indexPath], with: .fade)
            // save
            saveRegistration(registrations)
        }
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
}
