//
//  DiaryEditView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let text: String
    let timestamp: Date
}

struct DiaryEditView: View {
    @Environment(\.dismiss) var dismiss
    @State private var isRecording = false
    @State private var messages: [Message] = [
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
    ]
    
    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            NavigationStack {
                ScrollView {
                    ForEach($messages) { message in
                        MessageCardView(message: message, isUser: false)
                        MessageCardView(message: message)
                    }
                }
                .navigationTitle("오늘의 일기")
                .toolbar {
                    ToolbarItem(placement: .bottomBar){
                        if isRecording {
                            Button {
                                isRecording = false
                                let newMessage = Message(text: "녹음된 텍스트", timestamp: Date())
                                messages.append(newMessage)
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
                }
                .toolbar {
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
    }
}

#Preview {
    DiaryEditView()
}
