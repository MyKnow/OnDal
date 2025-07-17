//
//  QnAModel.swift
//  OnDal
//
//  Created by MyKnow on 7/17/25.
//

import Foundation

struct QnAModel: Identifiable {
    let id: UUID
    var question: Question
    var answer: Answer?

    var isNotYetAnswered: Bool {
        answer?.isEmpty ?? true
    }

    init(id: UUID = UUID(), question: String, answer: String? = nil) {
        self.id = id
        self.question = Question(question)
        if let unwrappingAnswer = answer {
            self.answer = Answer(unwrappingAnswer)
        }
    }

    mutating func updateAnswer(_ answer: String) {
        self.answer?.updateContent(answer)
    }
}

