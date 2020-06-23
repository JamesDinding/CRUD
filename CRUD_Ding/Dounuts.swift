//
//  Dounuts.swift
//  CRUD_Ding
//
//  Created by User02 on 2020/6/23.
//  Copyright © 2020 sun. All rights reserved.
//

import SwiftUI

struct Dounuts: View {
    var eventsData : EventsData
        var percentages : [Double]
        var angles : [Angle]
        var types = ["釣魚","抓蟲","化石","傢俱","種鈴錢","其他"]
        var colors :[Color]
        
        init(eventsData : EventsData){
            self.eventsData = eventsData
            if eventsData.events.count == 0{
                self.colors = [Color.white,Color.white,Color.white,Color.white,Color.white,Color.white,Color.white]
                self.percentages = [1.0]
                self.angles = [.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0),.degrees(0)]
            }
            else{
                percentages = [0.0,0.0,0.0,0.0,0.0,0.0]
                angles = [Angle]()
                colors = [Color.blue,Color.yellow,Color.green,Color.orange,Color.purple,Color.gray]
                var totalTime = 0;
                for event in self.eventsData.events{
                    totalTime += event.money;
                    for index in 0...5{
                        if(types[index] == event.type){
                            percentages[index] += Double(event.money)
                        }
                    }
                }
                var startDegree : Double = 0
                for index in 0...5{
                    percentages[index] /= Double(totalTime)
                    angles.append(.degrees(startDegree))
                    startDegree += 360 * percentages[index]
                }
            }
        }
        var body: some View {
            ZStack{
                ForEach(angles.indices){ (index) in
                    ExtractedView(index:index,angles: self.angles,colors: self.colors)
                }
            }
        }
    }

    struct Dounuts_Previews: PreviewProvider {
        static var previews: some View {
            Dounuts(eventsData: EventsData())
        }
    }


    struct ExtractedView: View {
        var index : Int
        var angles : [Angle]
        var colors : [Color]
        var body: some View {
            ZStack{
                if index == (angles.count-1){
                    MyChart(startAngle: angles[index], endAngle: .degrees(360)).fill(colors[index])
                }
                else{
                    MyChart(startAngle: angles[index], endAngle: angles[index+1]).fill(colors[index])
                }
            }
        }
    }

    struct MyChart : Shape{
        var startAngle : Angle
        var endAngle : Angle

        func path(in rect :CGRect)-> Path{
            Path{(path) in
                let center = CGPoint(x:rect.midX,y:rect.midY)
                path.move(to:center)
                path.addArc(center:center,radius:rect.midX,startAngle: startAngle,endAngle: endAngle,clockwise: false)
            }
        }
    }

