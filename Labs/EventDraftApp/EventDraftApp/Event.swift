//
//  Event.swift
//  EventDraftApp
//
//  Created by Student on 12/08/25.
//

import Foundation


struct Event {
    var title:String?
    var date:String?
    var location:String?
    var attendeeCount:String?
    init(title: String?, date: String?, location: String?, attendeeCount: String?) {
        self.title = title
        self.date = date
        self.location = location
        self.attendeeCount = attendeeCount
    }
}


protocol Test {
    func passData(title: String?, date: String?, location: String?, attendeeCount: String?)
}
