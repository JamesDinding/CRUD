//
//  secondpage.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct secondpage: View {
    @ObservedObject var eventsData = EventsData()
    @State private var showEdit: Bool = false
    @State private var selectIndex = 0
    
    var body: some View {
        VStack{
            if selectIndex == 0{
               Dounuts(eventsData: self.eventsData).frame(width:300,height: 300)
            }
            else{
                CircleChart(eventsData: self.eventsData).frame(width:300,height: 300)
            }
            Picker(selection: $selectIndex, label: Text("choose type")){
                Text("圓餅圖").tag(0)
                Text("甜甜圈").tag(1)
            }.pickerStyle(SegmentedPickerStyle()).background(Color.white)
            
            
            classIcons()
            
            
            
            
            NavigationView{
                List{
                    ForEach(eventsData.events){ (index) in
                        NavigationLink(destination: EventEditor(eventsData: self.eventsData, editEvent: index)){EventRow(event : index)}
                    }.onDelete{(indexSet) in
                        self.eventsData.events.remove(atOffsets: indexSet)
                        
                    }.onMove { (indexSet, index) in
                        self.eventsData.events.move(fromOffsets: indexSet,
                                        toOffset: index)
                    }
                }.navigationBarTitle("收入項目")
                    .navigationBarItems(leading: EditButton(),trailing: Button(action:{self.showEdit = true},label:{Image(systemName:"plus.circle.fill")}))
                    .sheet(isPresented: $showEdit){NavigationView{EventEditor(eventsData: self.eventsData)}
                }
            }
            
        }.background(Image("BG").opacity(0.1))
    }
}
//"釣魚","抓蟲","化石","傢俱","種鈴錢","其他"
//[Color.blue,Color.yellow,Color.green,Color.orange,Color.purple,Color.gray]
struct classIcons: View
{
    var body: some View
    {
        HStack
        {
            Group {
                Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
                .fill(Color.blue)
                Text("釣魚")
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
                Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
                .fill(Color.yellow)
                Text("抓蟲")
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
                Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
                .fill(Color.green)
                Text("化石")
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
                Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
                .fill(Color.orange)
                Text("傢俱")
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
                Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
                .fill(Color.purple)
                Text("鈴錢")
                .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
                
            }
            Path(ellipseIn: CGRect(x: 0, y: 0, width: 40, height: 30))
            .fill(Color.gray)
            Text("其他")
            .padding(EdgeInsets(top: 0, leading: -30, bottom: 0, trailing: 10))
        }
        .frame(width:300, height: 30)
    }
}

struct secondpage_Previews: PreviewProvider {
    static var previews: some View {
        secondpage()
    }
}
