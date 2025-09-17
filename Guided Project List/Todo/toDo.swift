//
//  toDo.swift
//  Todo
//
//  Created by student on 01/09/25.
//

import Foundation


struct ToDo : Equatable , Codable
{
    let id : UUID
    var title : String
    var inComplete : Bool
    var dueDate : Date
    var notes : String?
    
    init(title : String , isComplete : Bool , dueDate : Date , notes : String?)
    {
        self.id = UUID()
        self.title = title
        self.inComplete = isComplete
        self.dueDate = dueDate
        self.notes = notes
    }
    
    
    static func == (lhs : ToDo , rhs : ToDo) -> Bool
    {
        return lhs.id == rhs.id
    }
    
    static func loadToDos () -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else
        {return nil}
        let propertyListDecoder = PropertyListDecoder ()
        return try? propertyListDecoder.decode (Array<ToDo>.self,
                                                from: codedToDos)
    }
    
    static func loadSampleToDos() -> [ToDo]
    {
        let toDo1 = ToDo(title: "To-Do-1", isComplete: false, dueDate: Date() , notes : "Notes 1")
        
        let toDo2 = ToDo(title: "To-Do-2", isComplete: false, dueDate: Date() , notes : "Notes 2")
        
        let toDo3 = ToDo(title: "To-Do-3", isComplete: false, dueDate: Date() , notes : "Notes 3")
        
        return [toDo1 , toDo2 , toDo3]
    }
    

    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory,
                                 in: .userDomainMask).first!

    static let archiveURL =
        documentsDirectory.appendingPathComponent("toDos")
                          .appendingPathExtension("plist")

    static func saveToDos(_ toDos: [ToDo]) {
        let propertyListEncoder = PropertyListEncoder()
        do {
            let codedToDos = try propertyListEncoder.encode(toDos)
            try codedToDos.write(to: archiveURL, options: .noFileProtection)
        } catch {
            print("Error saving toDos: \(error)")
        }
    }

}



var toDos = [ToDo]()


