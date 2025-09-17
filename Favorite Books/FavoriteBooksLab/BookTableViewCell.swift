//
//  BookTableViewCell.swift
//  FavoriteBooksLab
//
//  Created by Student on 25/08/25.
//

import UIKit

class BookTableViewCell: UITableViewCell {
    

    @IBOutlet weak var title: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func update(book: Book){
        title.text = book.title
    }

}
