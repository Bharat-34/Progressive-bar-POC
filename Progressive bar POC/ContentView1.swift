//
//  mmmmm.swift
//  Progressive bar POC
//
//  Created by Bharat on 14/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ContentView1: View {
    @State var progressValue: Float = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            HStack{
                
                ZStack{
                    
                    Circle()
                        .trim(from: 0.5, to: 1.0)
                        .stroke(style: StrokeStyle(lineWidth: 30,lineCap: .round, lineJoin: .round))
                        .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .trailing, endPoint: .leading))
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(-90))
                    Circle()
                        .trim(from: 0.5, to: 10.0)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                        .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .trailing, endPoint: .leading))

                        .frame(width: 230, height: 280)
                        .rotationEffect(.degrees(-90))
                    
                }.offset(x: 240, y: 0)
                
                ZStack{
                Circle()
                    .stroke(style: .init(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [0.5,6], dashPhase: 1))
                    .frame(width: 200, height: 180)
                    .foregroundColor(.green)
                    
                    HStack{
                        VStack{
                            Text("62")
                            Text("@Score")
                            Text("average")
                        }
                        Divider()
                        .frame(width:2, height: 80)
                            .background(Color.black)
                       
                        VStack{
                            Text("73")
                            Text("Qpower")
                            Text("average")
                        }
                        
                    }
                    
                }
                
                
            ZStack{
                
                Circle()
                    .trim(from: 0.5, to: 1.0)
                    .stroke(style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .trailing, endPoint: .leading))

                    .frame(width: 300, height: 300)
                    .rotationEffect(.degrees(90))
                
                Circle()
                    .trim(from: 0.5, to: 10.0)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .trailing, endPoint: .leading))

                    .frame(width: 230, height: 300)
                    .rotationEffect(.degrees(90))

                
                }.offset(x: -240, y: 0)
                
            }.frame(width: 300, height: 400)
            .padding(.leading, 250)
                .padding(.trailing, 250)

          Spacer()
            
        }.padding()
    }
    
   
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView1()
    }
}

