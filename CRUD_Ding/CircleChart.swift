//
//  Circle.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct circleView: View {
    var index: Int
    var degree: [CGFloat]
    var colors: [Color]
    var body: some View {
        VStack {
            if (index == (self.degree.count-1)) {
                Circle()
                    .trim(from: self.degree[index], to: 1)
                    .stroke(self.colors[index], lineWidth: CGFloat(30))
            } else {
                Circle()
                    .trim(from: self.degree[index], to: self.degree[index+1])
                    .stroke(self.colors[index], lineWidth: CGFloat(30))
            }
        }
    }
}




struct CircleChart: View {
    var eventsData : EventsData
    var percentages : [Double]
    var degree : [CGFloat]
    var types = ["釣魚","抓蟲","化石","傢俱","種鈴錢","其他"]
    var colors : [Color]
    var totalmoney : Int = 0
    init(eventsData : EventsData){
        self.eventsData = eventsData
        if eventsData.events.count == 0{
            colors = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
            percentages = [1.0]
            degree = [0.0,0.0,0.0,0.0,0.0,0.0]
        }
        else{
            percentages = [0.0,0.0,0.0,0.0,0.0,0.0]
            colors = [Color.blue,Color.yellow,Color.green,Color.orange,Color.purple,Color.gray]
            for event in self.eventsData.events{
                totalmoney += event.money;
                for index in 0...5{
                    if(types[index] == event.type){
                        percentages[index] += Double(event.money)
                    }
                }
            }
            for index in 0...5{
                percentages[index] /= Double(totalmoney)
            }
            degree = [0.0,CGFloat(percentages[0])]
            for index in 2...5{
                degree.append(CGFloat(percentages[index-1]) + degree[index-1])
            }
        }
    }
    var body: some View {
        ZStack{
            ForEach(degree.indices){ (index) in
                circleView(index:index,degree:self.degree,colors: self.colors)
            }
            Text("總共有 : \(totalmoney)鈴錢")
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }.frame(width :250,height: 250)
    }
}

struct Circle_Previews: PreviewProvider {
    static var previews: some View {
        CircleChart(eventsData: EventsData())
    }
}


