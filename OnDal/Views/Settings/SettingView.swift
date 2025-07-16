//
//  SettingView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

//struct

struct SettingView: View {
    @State private var selectedBackgroundColor: Color = .blue
    @State private var selectedForegroundColor: Color = .blue
    @State private var selectedOption: String = "default"
    
    @State private var password: String?
    @State private var passwordSheetIsPresented: Bool = false
    @State private var isNeedPassword: Bool = false
    @State private var isEnableBiometricRecognition: Bool = false
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("일기장 기본 테마")){
                    NavigationLink(destination: BackgroundSettingView(selectedBackgroundColor: $selectedBackgroundColor, selectedOption: $selectedOption)) {
                        HStack {
                            Text("배경")
                            Spacer()
                            Text(selectedOption)
                                .foregroundStyle(selectedBackgroundColor)
                        }
                    }
                    ColorPicker("글자색", selection: $selectedForegroundColor)
                }
                Section(header: Text("개인정보")) {
                    if password == nil {
                        Button("비밀번호 추가") {
                            passwordSheetIsPresented = true
                        }
                    }
                    else {
                        Button("비밀번호 변경") {
                            passwordSheetIsPresented = true
                        }
                        Toggle("앱 잠금", isOn: $isNeedPassword)
                        Toggle("Face ID / Touch ID 활성화", isOn: $isEnableBiometricRecognition)
                        Button("비밀번호 삭제") {
                            password = nil
                        }
                        .foregroundStyle(.red)
                    }
                    Button("iCloud 연동") {}
                    Button("데이터 내보내기") {}
                    Button("데이터 삭제") {
                        
                    }
                    .foregroundStyle(.red)
                }
                Section(header: Text("알림")) {
                    Menu("일기 쓰기 제안") {
                    }
                }
            }
            .navigationTitle("설정")
            .sheet(isPresented: $passwordSheetIsPresented) {
                PasscodeEntryView(isPresented: $passwordSheetIsPresented, password: $password)
                    .presentationDragIndicator(.visible)
            }
        }
    }
}



#Preview {
    SettingView()
}
