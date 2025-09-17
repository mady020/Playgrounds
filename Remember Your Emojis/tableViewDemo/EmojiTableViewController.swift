//
//  TableViewController.swift
//  tableViewDemo
//
//  Created by Student on 18/08/25.
//

import UIKit

class EmojiTableViewController: UITableViewController {
    
    // UITableViewDataSource : populate the data ()
    // UITableViewDelegate   : customize the table

    var emojis:[Emoji] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedEmojis = loadEmojis() {
            emojis = savedEmojis
            }else{
                emojis = sampleEmojis()
            
        }
        tableView.reloadData()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

      // MARK: - Table view data source

      override func numberOfSections(in tableView: UITableView) -> Int {
          return 1
      }

    
    /*
     When is it called?
     Called by the table view once per section to determine how many rows (cells) are in that section.
     Purpose:
     Specifies how many rows are in each section. For example, if your emojis array has 13 items, and you have 1 section, this will return 13.
     Example:
     Your code returns emojis.count, so it tells the table view to make one row per emoji.
     */
    
      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//          // for each section define number
//          if section == 0 {
//              return 3
//          }
//          return emojis.count - 8
          return emojis.count
      }

      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

          let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

          
          let emoji = emojis[indexPath.row]

          var content = cell.defaultContentConfiguration()
          content.text = "\(emoji.symbol) - \(emoji.name)"
          content.secondaryText = emoji.description
          cell.contentConfiguration = content
          
        
          return cell
      }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
       
        performSegue(withIdentifier: "editEmoji", sender: emoji)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let navVC = segue.destination as? UINavigationController else {return}
        guard let secondVC = navVC.topViewController as? AddEditEmojiTableViewController else {return}
        guard let emoji = sender  as? Emoji else {return}
        
        if segue.identifier == "editEmoji" {
            secondVC.emoji = emoji
        }else if segue.identifier == "createEmoji" {
            secondVC.emoji = nil
        }
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the rows from the array
            emojis.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveEmojis(emojis)
        }
    }
    


    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedBook = emojis.remove(at: fromIndexPath.row)
        emojis.insert(removedBook, at: to.row)
        saveEmojis(emojis)
    }
    


    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
       
        guard segue.identifier == "saveSegue",
              let addEditTVC = segue.source as? AddEditEmojiTableViewController,
                 let emoji = addEditTVC.emoji else { return }

           if let selectedIndexPath = addEditTVC.indexPath {
               emojis[selectedIndexPath.row] = emoji
               tableView.reloadRows(at: [selectedIndexPath], with: .fade)
           } else {
               emojis.append(emoji)
               let indexPath = IndexPath(row: emojis.count - 1, section: 0)
               tableView.insertRows(at: [indexPath], with: .fade)
           }

        saveEmojis(emojis)
    }
    
 



    
   

    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> UINavigationController? {
        let navController = UINavigationController(coder: coder)
        

        if let addEditVC = navController?.topViewController as? AddEditEmojiTableViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                let emoji = emojis[indexPath.row]
                addEditVC.indexPath = indexPath
                addEditVC.emoji = emoji
            } else {
                addEditVC.indexPath = nil
                addEditVC.emoji = nil
            }
        }

        return navController
    }

  }



