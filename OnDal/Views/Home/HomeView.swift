//
//  HomeView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

struct HomeView: View {
    @State var selectedTab: Int = 0
    @State var oldSelectedTab: Int = 0
    @State var showDiaryEditView: Bool = false
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("내 일기장", systemImage: "bubble.and.pencil", value: 0) {
                MyDiaryView()
            }

//            Tab("공유 일기장", systemImage: "person.2.fill", value: 1) {
//                Text("Tab 2")
//            }
            
            Tab("설정", systemImage: "gearshape", value: 2) {
                SettingView()
            }
            
            Tab("일기 쓰기", systemImage: "plus", value: 3, role: .search) {
                EmptyView()
            }
        }
        .onChange(of: selectedTab) {
            if selectedTab == 3 {
                self.showDiaryEditView = true
                self.selectedTab = oldSelectedTab
            } else {
                self.oldSelectedTab = selectedTab
            }
        }
        .tabViewStyle(.tabBarOnly)
        .sheet(isPresented: $showDiaryEditView, onDismiss: {
            self.selectedTab = self.oldSelectedTab
        }) {
            DiaryEditView()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
        
    }
}

#Preview {
    HomeView()
}
