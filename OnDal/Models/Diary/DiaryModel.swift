//
//  DiaryModel.swift
//  OnDal
//
//  Created by MyKnow on 7/17/25.
//

import Foundation

class DiaryModel: Identifiable {
    var id: UUID
    var timestamp: Date
    var qna: [QnAModel]
    
    init(id: UUID = UUID(), timestamp: Date = Date(), qna: [QnAModel] = []) {
        self.id = id
        self.timestamp = timestamp
        self.qna = qna
    }
    
    func addDefaultQna() {
        self.qna.append(
            QnAModel(question: "오늘 기억에 남을 일이 있었나요?")
        )
        
    }
    
    func addNewQna(_ qna: QnAModel) {
        self.qna.append(qna)
    }
}
