//
//  RegistrationStorage.swift
//  ComplexInputScreens
//
//  Created by Student on 28/08/25.
//

import Foundation

let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("registrations").appendingPathExtension("plist")

func saveRegistration(_ registrations: [Registration]) {
    let propertyListEncoder = PropertyListEncoder()
    do {
        let encodedRegistrations = try propertyListEncoder.encode(registrations)
        try encodedRegistrations.write(to: archiveURL, options: .noFileProtection)
        print("Registrations saved successfully to: \(archiveURL.path)")
    } catch {
        print("Error saving registrations: \(error.localizedDescription)")
    }
}

func loadRegistrations() -> [Registration] {
    let propertyListDecoder = PropertyListDecoder()
    guard FileManager.default.fileExists(atPath: archiveURL.path) else {
        return []
    }
    do {
        let retrievedData = try Data(contentsOf: archiveURL)
        let decodedRegistrations = try propertyListDecoder.decode(
            [Registration].self,
            from: retrievedData
        )
        return decodedRegistrations
    } catch {
        print("Error loading registrations: \(error.localizedDescription)")
        return []
    }
}
