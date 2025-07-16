//
//  BackgroundSettingView.swift
//  OnDal
//
//  Created by MyKnow on 7/16/25.
//

import SwiftUI

struct BackgroundSettingView: View {
    @Binding var selectedBackgroundColor: Color
    @Binding var selectedOption: String
    
    var body: some View {
        List {
            Picker("배경 타입", selection: $selectedOption) {
                Text("기본 배경").tag("default")
                Text("단일 색상 배경").tag("color")
                Text("이미지").tag("image")
            }
            .pickerStyle(.inline)
            
            if selectedOption == "default"{
                ColorPicker("색상 선택", selection: $selectedBackgroundColor)
            } else if selectedOption == "image" {
                Text("이미지 선택 기능 추가 예정")
                // Future: ImagePicker()
            }
        }
        .navigationTitle("배경 설정")
    }
}


#Preview {
    @Previewable @State var selectedBackgroundColor: Color = .blue
    @Previewable @State var selectedOption: String = "default"
    
    BackgroundSettingView(selectedBackgroundColor: $selectedBackgroundColor, selectedOption: $selectedOption)
}
