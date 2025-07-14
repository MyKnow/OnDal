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
    @State private var isRecording = false
    @State private var messages: [Message] = [
        Message(text: "test", timestamp: Date()),
        Message(text: "test", timestamp: Date()),
        Message(text: "test", timestamp: Date()),
        Message(text: "test", timestamp: Date()),
        Message(text: "test", timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
        Message(text: String(repeating: "testMessage", count: 15), timestamp: Date()),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(messages) { message in
                    HStack {
                        Spacer()
                        VStack(alignment: .trailing, spacing: 4) {
                            Text(message.text)
                                .padding(10)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(12)
                            Text(message.timestamp, style: .time)
                                .font(.caption2)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
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
                                .foregroundStyle(.red)
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
