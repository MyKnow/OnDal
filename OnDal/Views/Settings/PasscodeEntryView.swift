//
//  PasscodeEntryView.swift
//  OnDal
//
//  Created by MyKnow on 7/16/25.
//

import SwiftUI

struct PasscodeEntryView: View {
    @Binding var isPresented: Bool
    @Binding var password: String?
    
    @State private var input: String = ""
    @FocusState private var isKeyboardFocused: Bool
    
    let maxDigits = 6

    var body: some View {
        ZStack {
            Color(UIColor.systemBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 36) {
                Text("암호 입력")
                    .font(.title2)
                    .padding(.top, 40)
                
                HStack(spacing: 8*3) {
                    ForEach(0..<maxDigits, id: \.self) { index in
                        Circle()
                            .strokeBorder(Color.gray, lineWidth: 1)
                            .background(Circle().fill(index < input.count ? Color.primary : Color.clear))
                            .frame(width: 20, height: 20)
                    }
                }
                TextField("", text: $input.limit(to: maxDigits))
                    .keyboardType(.numberPad)
                    .focused($isKeyboardFocused)
                    .frame(width: 0, height: 0)
                    .opacity(0.01)
                    .blendMode(.screen)
                    .onChange(of: input, { _, newValue in
                        if newValue.count >= maxDigits {
                            password = newValue
                            isPresented = false
                        }
                    })
            }
            .padding(.bottom, 40)
            .onAppear {
                isKeyboardFocused = true
            }
        }
    }
}

#Preview {
    @Previewable @State var isPresented: Bool = false
    @Previewable @State var password: String? = nil
    PasscodeEntryView(isPresented: $isPresented, password: $password)
}

extension Binding where Value == String {
    func limit(to length: Int) -> Binding<String> {
        return Binding<String>(
            get: { self.wrappedValue },
            set: { self.wrappedValue = String($0.prefix(length)).filter { $0.isNumber } }
        )
    }
}
