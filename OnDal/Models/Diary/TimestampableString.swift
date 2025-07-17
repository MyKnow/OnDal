//
//  TimestampableString.swift
//  OnDal
//
//  Created by MyKnow on 7/17/25.
//

import Foundation

class TimestampableStringModel: Identifiable {
    let id = UUID()
    var createdAt: Date = Date()
    var content: String = ""
    
    init(_ content: String) {
        self.content = content
    }
    
    func updateContent(_ content: String) {
        self.content = content
    }
}


class Question: TimestampableStringModel {
    override init(_ content: String) {
        super.init(content)
    }
}

class Answer: TimestampableStringModel {
    var updatedAt: Date?
    
    var isEmpty: Bool {
        content.isEmpty
    }

    var isModified: Bool {
        updatedAt != nil
    }
    
    override init(_ content: String) {
        super.init(content)
    }

    override func updateContent(_ content: String) {
        self.updatedAt = Date()
        super.updateContent(content)
    }
}
