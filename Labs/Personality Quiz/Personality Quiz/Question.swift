//
//  Question.swift
//  Personality Quiz
//
//  Created by Student on 25/07/25.
//

import Foundation

enum ResponseType{
    case single, multiple, ranged
}

enum AnimalType : Character{
    case lion = "🦁", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    var defination: String  {
        switch self {
        case .lion:
            return "You are incredibly outgoing. You surround yourself with the people you love and enjoy activities with your own friends"
        case .cat:
            return "Mischievous, yet mild-tempered, you enjoy doing things on your own terms"
        case .rabbit:
            return "You love everything that's soft. You are healthy and full of energy."
        case .turtle:
            return "You are wise beyond your years, and you focus on the details. Slow and steady wins the race."
        }
    }
}

struct Answer {
    var text:String
    var type: AnimalType
}

struct Question{
    var text:String
    var type: ResponseType
    var answers: [Answer]
}

