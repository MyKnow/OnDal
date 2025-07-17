//
//  DiaryEditView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

struct DiaryEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isRecording = false
    @State private var diaryModel: DiaryModel = DiaryModel()
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    ForEach(diaryModel.qna) { qna in
                        MessageCardView(model: qna.question, isUser: false)
                        if !qna.isNotYetAnswered {
                            if let answer = qna.answer {
                                MessageCardView(model: answer)
                            }
                        }
                    }
                }
                .navigationTitle("오늘의 일기")
                .toolbar {
                    ToolbarItem(placement: .bottomBar){
                        if isRecording {
                            Button {
                                isRecording = false
                                let newQnA = QnAModel(question: "질문")
                                diaryModel.addNewQna(newQnA)
                            } label: {
                                Image(systemName: "square.fill")
                                    .foregroundStyle(.red)
                            }
                        } else {
                            Button {
                                isRecording = true
                            } label: {
                                Image(systemName: "microphone.fill")
                                    .foregroundStyle(.red.opacity(1.0))
                            }
                        }
                    }
                    ToolbarItem(placement: .cancellationAction) {
                        Menu {
                            Button(role: .cancel, action: {
                                dismiss()
                            }) {
                                Label("닫기", systemImage: "xmark")
                            }
                            Button(role: .destructive, action: {
                                dismiss()
                            }) {
                                Label("삭제", systemImage: "trash.fill")
                            }
                        } label: {
                            Image(systemName: "ellipsis")
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("저장", role: .confirm) {
                            dismiss()
                        }
                    }
                }
            }
        }
        .onAppear {
            diaryModel.addDefaultQna()
        }
    }
}

#Preview {
    DiaryEditView()
}
