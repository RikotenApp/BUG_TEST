//
//  HomeView.swift
//  Rikoten_kumo
//
//  Created by 雲下晃 on 2021/09/21.
//

import SwiftUI



struct HomeView: View {
    @State var selecttag = 1
    
    
    
    var body: some View {
        TabView(selection: $selecttag) {
                    HomeTabView()
                        .tabItem{
                            Image(systemName: "house.fill")
                            Text("HOME")
                        }.tag(1)
                    CollaborationTabView()
                        .tabItem{
                            Image(systemName: "note.text")
                            Text("企画")
                        }.tag(2)
                    ProjectSearchTabView()
                        .tabItem {
                            Image(systemName: "map")
                            Text("マップ")
                        }.tag (3)
                    TimetableTabView()
                        .tabItem {
                            Image(systemName: "network")
                            Text("コラボ")
                        }.tag(4)
                    InformationTabView()
                        .tabItem {
                            Image(systemName: "exclamationmark.circle.fill")
                            Text("インフォ")
                        }.tag(5)
        }
    }
}

struct HomeTabView: View {
    var body: some View {
        Text("HOME")
    }
    
}

struct CollaborationTabView: View {
    
    var body: some View {
        NavigationView{
            List (projectArray) { item in
                NavigationLink(
                    destination: ProjectView(projectdata: item)
                ) {
                    ProjectDataView(projectphoto: item)
                }
            }
            
        }
    }
}

struct ProjectSearchTabView: View {
    var body: some View {
        Text("マップ")
    }
}

struct TimetableTabView: View {
    var body: some View {
        Text("コラボ")
    }
}

struct InformationTabView: View {
    var body: some View {
        Text("インフォメーション")
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeView()
        }
    }
}
