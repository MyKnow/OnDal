//
//  MessageCardView.swift
//  OnDal
//
//  Created by MyKnow on 7/16/25.
//

import SwiftUI

struct MessageCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var message: Message
    var isUser: Bool = true
    
    var body: some View {
        HStack {
            isUser ? Spacer() : nil
            VStack(alignment: isUser ? .trailing : .leading, spacing: 4) {
                Text(message.text)
                    .foregroundColor(isUser ? .white : (colorScheme == .dark ? .white : .black.mix(with: .white, by: 0.2)))
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(isUser ? Color.blue : Color.gray)
                    )
                Text(message.timestamp, style: .time)
                    .padding([.top, .horizontal], 4)
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
            isUser ? nil : Spacer()
        }
        .padding(.horizontal)
        .padding(isUser ? .leading : .trailing, 8)
        .padding(.vertical, 16)
    }
}

#Preview {
    @Previewable @State var message: Message = Message(text: String(repeating: "testMessage", count: 15), timestamp: Date())
    MessageCardView(message: $message, isUser: false)
}
