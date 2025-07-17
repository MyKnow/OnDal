//
//  MessageCardView.swift
//  OnDal
//
//  Created by MyKnow on 7/16/25.
//

import SwiftUI

struct MessageCardView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var model: TimestampableStringModel
    var isUser: Bool = true
    
    init(model: TimestampableStringModel, isUser: Bool = true) {
        _model = .constant(model)
        self.isUser = isUser
    }
    
    var body: some View {
        HStack {
            isUser ? Spacer() : nil
            VStack(alignment: isUser ? .trailing : .leading, spacing: 4) {
                Text(model.content)
                    .foregroundColor(isUser ? .white : (colorScheme == .dark ? .white : .black.mix(with: .white, by: 0.2)))
                    .padding(16)
                    .background(
                        RoundedRectangle(cornerRadius: 24, style: .continuous)
                            .fill(isUser ? Color.blue : Color.gray.opacity(0.4))
                    )
                Text(model.createdAt, style: .time)
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
    @Previewable @Environment(\.colorScheme) var colorScheme
    @Previewable @State var model: TimestampableStringModel = TimestampableStringModel(String(repeating: "testMessage", count: 15))
    
    MessageCardView(model: model, isUser: false)
}
