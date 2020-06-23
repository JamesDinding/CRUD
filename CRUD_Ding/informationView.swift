//
//  informationView.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct informationView: View {
    var body: some View {
            ScrollView {
                app_intro()
                Image("happy_life")
                    .resizable()
                    .frame(width: 400, height:250)
                usage()
                Image("dark_neek")
                .resizable()
                    .frame(width:400, height:250)
            }
            .background(Image("BG").opacity(0.1))
    }
}


struct app_intro: View {
    var body: some View {
        Text("歡迎來到屬於你的島!!")
            .font(Font.system(size:40))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
            .multilineTextAlignment(.center)
    }
}

struct usage: View {
    var body: some View {
        Text("不過其實你是被騙來幫忙新建工程的\n你以爲是來屬於你的無人島悠閒過活\n不過其實黑心的狸克\n會讓你背負龐大的借貸\n你必須活用島上的資源製造產值\n你得精打細算才行")
            .font(Font.system(size: 20))
            .fontWeight(.bold)
            .foregroundColor(Color(red: 129/255, green: 0, blue: 0))
            .multilineTextAlignment(.center)
    }
}

struct informationView_Previews: PreviewProvider {
    static var previews: some View {
        informationView()
    }
}
