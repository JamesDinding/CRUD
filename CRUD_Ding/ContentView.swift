//
//  ContentView.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            informationView()
                .tabItem {
                    VStack {
                        Image("first")
                        Text("Information")
                    }
                }
                .tag(0)
            secondpage()
                .tabItem {
                    VStack {
                        Image("second")
                        Text("Analysis")
                    }
                }
                .tag(1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
