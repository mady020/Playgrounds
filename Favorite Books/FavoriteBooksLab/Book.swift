//
//  Book.swift
//  FavoriteBooksLab
//
//  Created by Student on 25/08/25.
//

import Foundation

struct Book : Codable {
    var title: String
    var author: String
    var genre: String
    var length: String
    
    func description() -> String {
        return "\"\(title)\" by \(author), Genre: \(genre), Length: \(length) pages"
    }
}


