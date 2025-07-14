//
//  HomeView.swift
//  OnDal
//
//  Created by MyKnow on 7/14/25.
//

import SwiftUI

struct HomeView: View {
    @State private var isSearching: Bool = false
    @State private var searchText: String = ""

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
                        HStack {
                            Text("오늘의 일기가 없습니다.")
                                .foregroundStyle(.gray)
                            Spacer()
                            NavigationLink(destination: DiaryEditView()) {}
                        }
                    }
                    Section(header: Text("이전까지의 일기")) {
                        Text("일기가 없습니다.")
                            .foregroundStyle(.gray)
                    }
                }
                .navigationTitle(Text("일기"))
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    NavigationLink(destination: SettingView()) {
                        Image(systemName: "gearshape.fill")
                    }
                    .accessibilityLabel("설정")
                }
                ToolbarItemGroup(placement: .bottomBar) {
                    if isSearching {
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                            TextField("검색어를 입력하세요", text: $searchText)
                                .transition(.move(edge: .trailing).combined(with: .opacity))
                                .padding(.horizontal, 8)
                        }
                        .animation(.bouncy, value: isSearching)
                        .padding(8)
                        
                        Spacer()
                        
                        Button {
                            // 취소
                            isSearching = false
                            searchText = ""
                        } label: {
                            Text("취소")
                        }
                        .accessibilityLabel("검색 취소")
                    } else {
                        Button {
                            withAnimation {
                                isSearching = true
                            }
                        } label: {
                            Image(systemName: "magnifyingglass")
                        }
                        .accessibilityLabel("검색창 활성화")
                        .transition(.move(edge: .trailing).combined(with: .opacity))
                        
                        Spacer()
                        
                        NavigationLink(destination: DiaryEditView()) {
                            Image(systemName: "square.and.pencil")
                        }
                        .accessibilityLabel("오늘 일기 쓰기")
                    }
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
