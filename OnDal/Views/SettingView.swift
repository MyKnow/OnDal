//
//  SettingView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

struct SettingView: View {
    var body: some View {
        List {
            Section(header: Text("First Header")){
                Text("First Content")
            }
            Section(header: Text("Second Header")) {
                Text("Second Content")
            }
            Section(header: Text("Third Header")) {
                Text("Third Content")
            }
        }
        .navigationTitle("설정")
    }
}

#Preview {
    SettingView()
}
