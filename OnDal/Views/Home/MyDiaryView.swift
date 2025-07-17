//
//  MyDiaryView.swift
//  OnDal
//
//  Created by MyKnow on 7/16/25.
//

import SwiftUI

struct MyDiaryView: View {
    @State private var isSearching: Bool = false
    @State private var searchText: String = ""
    @State private var showDiaryEditView: Bool = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                List {
                    // 추세를 나타내는 Section
                    Section {
                        HStack(spacing: 16) {
                            // 연속으로 일기 쓴 기간
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "note")
                                        .foregroundStyle(.red)
                                    Text("5")
                                        .bold()
                                }
                                Text("연속으로 일기 쓴 기간")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            Divider()
                            // 최근 감정 동향 표시 (0~10점 사이에서 LLM이 평가한 행복 수치, 예정)
                            VStack(alignment: .leading) {
                                HStack {
                                    Image(systemName: "chart.bar.fill")
                                        .foregroundStyle(.blue)
                                    Text("10.0")
                                        .bold()
                                }
                                Text("일주일 평균 행복지수")
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                        }
                    }
                    .listRowBackground(Color.clear)
                    
                    Section(header: Text("오늘의 일기")) {
                        Button("일기 쓰기") {
                            showDiaryEditView = true
                        }
//                        .foregroundStyle(.gray)
                    }
                    Section(header: Text("이전까지의 일기")) {
                        Text("일기가 없습니다.")
                            .foregroundStyle(.gray)
                    }
                }
                .navigationTitle(Text("내 일기"))
            }
        }
        .sheet(isPresented: $showDiaryEditView) {
            DiaryEditView()
                .presentationDetents([.large])
                .presentationDragIndicator(.visible)
        }
    }
}

#Preview {
    MyDiaryView()
}
