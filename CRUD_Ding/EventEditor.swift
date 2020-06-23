//
//  EventEditor.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct EventEditor: View {
    var types = ["釣魚","抓蟲","化石","傢俱","種鈴錢","其他"]
    @Environment(\.presentationMode) var preMode
    @State private var selectIndex = 0
    @State private var one = 0
    @State private var ten = 0
    @State private var hundred = 0
    @State private var thousand = 0
    @State private var ten_thousand = 0
    @State private var text = ""
    var eventsData : EventsData
    var editEvent : Event?
    var body: some View {
            Form{
                Picker(selection: $selectIndex, label: Text("choose type")){
                    Text(self.types[0]).tag(0)
                    Text(self.types[1]).tag(1)
                    Text(self.types[2]).tag(2)
                    Text(self.types[3]).tag(3)
                    Text(self.types[4]).tag(4)
                    Text(self.types[5]).tag(5)
                }
                Stepper("1元:   \(one)",value: $one, in:0...9)
                Stepper("10元:   \(ten)",value: $ten, in:0...9)
                Stepper("100元:   \(hundred)",value: $hundred, in:0...9)
                Stepper("1000元:   \(thousand)",value: $thousand, in:0...9)
                Stepper("10000元:   \(ten_thousand)",value: $ten_thousand, in:0...99)
                TextField("備註", text: $text)
            }.navigationBarTitle(editEvent == nil ?"新增事件":"修改事件")
                .navigationBarItems(trailing: Button("save"){
                    let event = Event(type: self.types[self.selectIndex], money: self.one+self.ten*10+self.hundred*100+self.thousand*1000+self.ten_thousand*10000, notice: self.text)
                    if let editEvent = self.editEvent{
                        let index = self.eventsData.events.firstIndex{
                            return $0.id == editEvent.id
                            }!
                        self.eventsData.events[index] = event
                    }
                    else{
                        self.eventsData.events.insert(event,at:0)
                    }
                    self.preMode.wrappedValue.dismiss()})
                .onAppear{
                    if let editEvent = self.editEvent{
                        self.selectIndex = self.types.firstIndex(of: editEvent.type) ?? 0
                        self.one = editEvent.money%10
                        self.ten = editEvent.money/10%10
                        self.hundred = editEvent.money/100%10
                        self.thousand = editEvent.money/1000%10
                        self.ten_thousand = editEvent.money/10000%10
                        self.text = editEvent.notice
                    }
            }
                    
    }
}

struct EventEditor_Previews: PreviewProvider {
    static var previews: some View {
        EventEditor(eventsData: EventsData())
    }
}
