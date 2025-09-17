//
//  BookFormTableViewController.swift
//  FavoriteBooksLab
//
//  Created by Student on 25/08/25.
//

import UIKit


class BookFormTableViewController: UITableViewController {
    
    @IBOutlet weak var titleOutlet: UITextField!
    
    @IBOutlet weak var authorOutlet: UITextField!
    
    @IBOutlet weak var genreOutlet: UITextField!
    
    @IBOutlet weak var lengthOutlet: UITextField!
    
    

    
    @IBAction func saveButtonTapped(_ sender: UIButton) {
        let book = Book(
            title: titleOutlet.text ?? "",
            author: authorOutlet.text ?? "",
            genre: genreOutlet.text ?? "",
            length: lengthOutlet.text ?? ""
        )
        self.book = book
        performSegue(withIdentifier: "saveSegue", sender: nil)
    }
    
    var book:Book?
    var indexPath: IndexPath?
    
    init?(
        coder: NSCoder,
        indexPath: IndexPath?,
        book: Book?
    ) {
        self.indexPath = indexPath
        self.book = book
        super.init(coder: coder)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateUI(){
        titleOutlet.text = book?.title
        authorOutlet.text = book?.author
        genreOutlet.text = book?.genre
        lengthOutlet.text = book?.length
    }
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI();
    }
}
