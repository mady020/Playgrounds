//
//  BookTableViewController.swift
//  FavoriteBooksLab
//
//  Created by Student on 25/08/25.
//

import UIKit

class BookTableViewController: UITableViewController {
    
    var books:[Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let savedBooks = loadBooks() {
            books = savedBooks
        }else{
            books = [
                Book(title: "To Kill a Mockingbird", author: "Harper Lee", genre: "Fiction", length: "281"),
                Book(title: "1984", author: "George Orwell", genre: "Dystopian", length: "328"),
                Book(title: "The Great Gatsby", author: "F. Scott Fitzgerald", genre: "Classic", length: "180"),
                Book(title: "Moby Dick", author: "Herman Melville", genre: "Adventure", length: "635"),
                Book(title: "Pride and Prejudice", author: "Jane Austen", genre: "Romance", length: "279"),
                Book(title: "The Hobbit", author: "J.R.R. Tolkien", genre: "Fantasy", length: "310"),
                Book(title: "War and Peace", author: "Leo Tolstoy", genre: "Historical", length: "1225"),
                Book(title: "The Catcher in the Rye", author: "J.D. Salinger", genre: "Fiction", length: "214"),
                Book(title: "The Alchemist", author: "Paulo Coelho", genre: "Fiction", length: "208"),
                Book(title: "Harry Potter and the Sorcerer's Stone", author: "J.K. Rowling", genre: "Fantasy", length: "309")
            ]
            
        }
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "cell",
            for: indexPath
        ) as! BookTableViewCell
        
        cell.update(book:books[indexPath.row])
        return cell
    }
    override func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {

        performSegue(withIdentifier: "editBook", sender:indexPath)
    }



    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the rows from the array
            books.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            saveBooks(books)
        }
    }
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let removedBook = books.remove(at: fromIndexPath.row)
        books.insert(removedBook, at: to.row)
        saveBooks(books)
    }
    


    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
       
        guard segue.identifier == "saveSegue",
                 let addEditTVC = segue.source as? BookFormTableViewController,
                 let book = addEditTVC.book else { return }

           if let selectedIndexPath = addEditTVC.indexPath {
               books[selectedIndexPath.row] = book
               tableView.reloadRows(at: [selectedIndexPath], with: .fade)
           } else {
               books.append(book)
               let indexPath = IndexPath(row: books.count - 1, section: 0)
               tableView.insertRows(at: [indexPath], with: .fade)
           }

           saveBooks(books)
    }
    
 

    @IBSegueAction func exitBook(_ coder: NSCoder, sender: Any?) -> BookFormTableViewController? {
        
        guard let indexPath = sender as? IndexPath else {
            return BookFormTableViewController(
                coder:coder,
                indexPath: nil,
                book: nil
            )
        }
        return BookFormTableViewController(
            coder: coder,
            indexPath: indexPath,
            book: books[indexPath.row]
        )
    }

    @IBSegueAction func createBook(_ coder: NSCoder) -> BookFormTableViewController? {

        return BookFormTableViewController(
               coder: coder,
               indexPath: nil,
               book: nil
           )
    }
    
    
}
