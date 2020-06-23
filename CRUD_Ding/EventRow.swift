//
//  EventRow.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct EventRow: View {
    var event: Event
    var colors = [Color.blue,Color.yellow,Color.green,Color.orange,Color.purple,Color.gray]
    var types = ["釣魚","抓蟲","化石","傢俱","種鈴錢","其他"]
    var body: some View {
        HStack{
            Text(event.type)
                .font(.largeTitle)
                .fontWeight(.black)
                .foregroundColor(Color.white)
                .multilineTextAlignment(.center)
            .background(colors[types.firstIndex(of: event.type) ?? 0])
            Spacer()
            Text("金額： \(event.money) 鈴錢")
                .fontWeight(.bold)
        }
    }
}

struct EventRow_Previews: PreviewProvider {
    static var previews: some View {
        EventRow(event: Event(type: "釣魚", money: 0, notice: "gg"))
    }
}
