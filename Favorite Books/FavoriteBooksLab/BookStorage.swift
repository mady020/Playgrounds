//
//  BookStorage.swift
//  FavoriteBooksLab
//
//  Created by Student on 26/08/25.
//


import Foundation

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("books_test").appendingPathExtension("plist")

func saveBooks(_ books: [Book]) {
    let propertyListEncoder = PropertyListEncoder()
    do {
        let encodedBooks = try propertyListEncoder.encode(books)
        try encodedBooks.write(to: archiveURL, options: .noFileProtection)
        print("Books saved successfully to: \(archiveURL.path)")
    } catch {
        print("Error saving books: \(error.localizedDescription)")
    }
}

func loadBooks() -> [Book]? {
    let propertyListDecoder = PropertyListDecoder()
    do {
        let retrievedData = try Data(contentsOf: archiveURL)
        let decodedBooks = try propertyListDecoder.decode([Book].self, from: retrievedData)
        return decodedBooks
    } catch {
        print("Error loading books: \(error.localizedDescription)")
        return nil
    }
}
