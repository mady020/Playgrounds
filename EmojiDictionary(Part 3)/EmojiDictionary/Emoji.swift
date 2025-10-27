import Foundation

struct Emoji: Codable, Identifiable, Equatable {
    var id:  UUID
    var symbol: String
    var name: String
    var description: String
    var usage: String
    
    
    
    var sectionTitle : String {
        String(name.uppercased().first ?? "?")
    }
    static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.id == rhs.id
    }
    
 
        init(id: UUID = UUID(),
             symbol: String,
             name: String,
             description: String,
             usage: String) {
            
            self.id = id
            self.symbol = symbol
            self.name = name
            self.description = description
            self.usage = usage
        }
}
