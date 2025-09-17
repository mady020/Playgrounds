//
//  BookStorage.swift
//  FavoriteBooksLab
//
//  Created by Student on 26/08/25.
//


import Foundation

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("emojis_test").appendingPathExtension("plist")

func saveEmojis(_ emojis: [Emoji]) {
    let propertyListEncoder = PropertyListEncoder()
    do {
        let encodedEmojis = try propertyListEncoder.encode(emojis)
        try encodedEmojis.write(to: archiveURL, options: .noFileProtection)
        print("Emojis saved successfully to: \(archiveURL.path)")
    } catch {
        print("Error saving emojis: \(error.localizedDescription)")
    }
}

func loadEmojis() -> [Emoji]? {
    let propertyListDecoder = PropertyListDecoder()
    do {
        let retrievedData = try Data(contentsOf: archiveURL)
        let decodedEmojis = try propertyListDecoder.decode([Emoji].self, from: retrievedData)
        return decodedEmojis
    } catch {
        print("Error loading emojis: \(error.localizedDescription)")
        return nil
    }
}


func sampleEmojis() -> [Emoji] {
    return [
        Emoji(symbol: "😊", name: "Happy", description: "used when a person is happy", usage: "Happiness"),
        Emoji(symbol: "😢", name: "Sad", description: "used when a person is sad", usage: "Sadness"),
        Emoji(symbol: "😂", name: "Laugh", description: "used when something is funny", usage: "Laughter"),
        Emoji(symbol: "😡", name: "Angry", description: "used when a person is angry", usage: "Anger"),
        Emoji(symbol: "😱", name: "Surprised", description: "used when something is shocking", usage: "Surprise"),
        Emoji(symbol: "😍", name: "Love", description: "used when a person loves something", usage: "Love"),
        Emoji(symbol: "🤔", name: "Thinking", description: "used when someone is thinking", usage: "Thoughtfulness"),
        Emoji(symbol: "😴", name: "Sleepy", description: "used when a person is tired or sleepy", usage: "Tiredness"),
        Emoji(symbol: "🤗", name: "Hug", description: "used to express a hug or warm feelings", usage: "Affection"),
        Emoji(symbol: "🙄", name: "Eye Roll", description: "used when annoyed or unimpressed", usage: "Annoyance"),
        Emoji(symbol: "🤩", name: "Star-Struck", description: "used when amazed or impressed", usage: "Amazement"),
        Emoji(symbol: "😎", name: "Cool", description: "used when someone feels cool or confident", usage: "Confidence"),
        Emoji(symbol: "🤪", name: "Silly", description: "used when someone is goofy or silly", usage: "Playfulness")
]
}
