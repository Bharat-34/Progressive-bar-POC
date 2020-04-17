//
//  mmmmm.swift
//  Progressive bar POC
//
//  Created by Bharat on 14/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct mainView: View {
    
    @State var percentage: CGFloat = 0
    @State var percentage1: CGFloat = 0

    var body: some View {
        ZStack{
            
        VStack{
            Spacer()

            ZStack{

                HStack{
                ZStack{
                    trackLine(linewidth: 25)
                        .frame(width: 300, height: 300)
                    OutlineTrack(percentage: percentage, linewidth: 25)
                        .frame(width: 300, height: 300)

                    trackLine(linewidth: 18)
                        .frame(width: 230, height: 230)
                    OutlineTrack(percentage: percentage, linewidth: 18)
                        .frame(width: 230, height: 230)
                    
                    trackLine(linewidth: 12)
                        .frame(width: 150, height: 150)
                    OutlineTrack(percentage: percentage, linewidth: 12)
                        .frame(width: 150, height: 150)

                    }.offset(x: 200)
                    
                    ZStack{
                    Circle()
                        .fill(Color.white)
                        .frame(width: 110)
                        
                        Ticks(inset: 1, minTickHeight: 5, maxTickHeight: 8)
                        .stroke(lineWidth: 1)
                        .foregroundColor(Color.grass)
                        
                        HStack{
                            VStack(alignment: .trailing){
                                Text("69")
                                    .font(.system(size: 18))
                                    .fontWeight(.heavy)
                                Text("QScore")
                                    .font(.system(size: 8))
                                    .fontWeight(.heavy)
                                Text("average")
                                    .font(.system(size: 8))
                                    .fontWeight(.light)
                                
                            }
                            
                            Divider()
                                .frame(width: 2, height: 50)
                                .background(Color.grass)
                            
                            VStack(alignment: .leading){
                                Text("73")
                                    .font(.system(size: 18))
                                    .fontWeight(.heavy)
                                Text("QPower")
                                    .font(.system(size: 8))
                                    .fontWeight(.heavy)
                                Text("average")
                                    .font(.system(size: 8))
                                    .fontWeight(.light)
                                
                            }
                        }
                        
                    }
                    
                
                ZStack{
                    trackLine(linewidth: 25)
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))
                    OutlineTrack(percentage: percentage, linewidth: 25)
                        .frame(width: 300, height: 300)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))
                    
                    trackLine(linewidth: 18)
                        .frame(width: 230, height: 230)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))
                    OutlineTrack(percentage: percentage, linewidth: 18)
                        .frame(width: 230, height: 230)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))

                    trackLine(linewidth: 12)
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))
                    OutlineTrack(percentage: percentage, linewidth: 12)
                        .frame(width: 150, height: 150)
                        .rotationEffect(.degrees(-180), anchor: .center)
                        .rotation3DEffect(.degrees(-180), axis: (x: 10, y: 0, z: 0))

                    
                }.offset(x: -200)
                }
            }
            
            Spacer()
            
            HStack{
            Button(action: {
                self.percentage = 50
            }){
                Text("50")
                    .font(.title)
                    .foregroundColor(.white)
                    .fontWeight(.heavy)
                .padding()
                .background(Color.red)

            }
                
                Button(action: {
                          self.percentage = 100
                      }){
                          Text("100")
                              .font(.title)
                            .foregroundColor(.white)
                              .fontWeight(.heavy)
                          .padding()
                          .background(Color.red)

                      }
                
                Button(action: {
                          self.percentage = 80
                      }){
                          Text("80")
                              .font(.title)
                            .foregroundColor(.white)
                              .fontWeight(.heavy)
                          .padding()
                          .background(Color.red)

                }
            }.padding()
        }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
    }
}

struct nnn:View {
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.red)
            
            Ticks(inset: 8, minTickHeight: 10, maxTickHeight: 20)
                           .stroke(lineWidth: 2)
                           .foregroundColor(.white)
        }
        
        
    }
        
}

struct trackLine: View {
    
    var colors: [Color] = [Color.trackColor]
    var percentage: CGFloat = 50
    var linewidth : CGFloat = 0

    var body: some View {
        Circle()
            .trim(from: 0.5, to: 1.0)
            .fill(Color.clear)
            .rotationEffect(.degrees(90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .trim(from: 0.0, to: percentage / 2)
                    .stroke(style: StrokeStyle(lineWidth: linewidth, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                    .rotationEffect(.degrees(90))
            )
    }
}

struct OutlineTrack: View {
    
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.white]
    var linewidth : CGFloat = 0
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.clear)
                .rotationEffect(.degrees(90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .trim(from: 0.0, to: percentage*0.01)
                    .stroke(style: StrokeStyle(lineWidth: linewidth, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.grass, .greenTeal]), startPoint: .leading, endPoint: .trailing))
                    .rotationEffect(.degrees(90))

            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
    
}



struct Ticks: Shape {
    
    let inset: CGFloat
    let minTickHeight: CGFloat
    let maxTickHeight: CGFloat
    let totalTicks = 80
    let hourTickInterval: Int = 4
    
    func path(in rect: CGRect) -> Path {
        
        let rect = rect.insetBy(dx: inset, dy: inset)
        var path = Path()
        for index in 0..<totalTicks {
            let condition = index % hourTickInterval == 0
            let height: CGFloat = condition ? maxTickHeight : minTickHeight
            path.move(to: topPosition(for: angle(for: index), in: rect))
            path.addLine(to: bottomPosition(for: angle(for: index), in: rect, height: height))
        }
        return path
    }
    
    private func angle(for index: Int) -> CGFloat {
        return (2 * .pi / CGFloat(totalTicks)) * CGFloat(index)
    }
    
    private func topPosition(for angle: CGFloat, in rect: CGRect) -> CGPoint {
        let radius = min(rect.height, rect.width)/2
        let xPosition = rect.midX + (radius * cos(angle))
        let yPosition = rect.midY + (radius * sin(angle))
        return CGPoint(x: xPosition, y: yPosition)
    }
    
    private func bottomPosition(for angle: CGFloat, in rect: CGRect, height: CGFloat) -> CGPoint {
        let radius = min(rect.height, rect.width)/2
        let xPosition = rect.midX + ((radius - height) * cos(angle))
        let yPosition = rect.midY + ((radius - height) * sin(angle))
        return CGPoint(x: xPosition, y: yPosition)
    }
}



//struct Arc: Shape {
//
//    var startAngle: Angle
//    var endAngle: Angle
//    var clockWise: Bool
//
//    func path(in rect: CGRect) -> Path {
//
//        var path = Path()
//        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: startAngle, endAngle: endAngle, clockwise: clockWise)
//
//        return path
//    }
//
//}

//struct circleShape: View {
//
//
//    var body: some View {
//        Arc(startAngle: .degrees(90), endAngle: .degrees(90), clockWise: true)
//            .stroke(Color.blue, lineWidth: 20)
//            .frame(width: 300, height: 300)
//    }
//}
//struct latestView: View {
//
//    var body: some View{
//
//        VStack{
//
//            ZStack{
//                HStack{
//                    ZStack{
//                        Track(percentage: 50)
//                                .frame(height: 400)
//                            Outline(percentage: 50)
//                            .frame(height: 400)
//
//                    }.offset(x: 20)
//
//                    ZStack{
//                        Track(percentage: 50)
//                            .frame(height: 400)
//                            .rotationEffect(.degrees(180), anchor: .center)
//                            .rotation3DEffect(.degrees(180), axis: (x: 10, y: 0, z: 0))
//                        Outline(percentage: 50)
//                            .frame(height: 400)
//                            .rotationEffect(.degrees(180), anchor: .center)
//                            .rotation3DEffect(.degrees(180), axis: (x: 10, y: 0, z: 0))
//                    }.offset(x: -20)
//                }
//            }
//        }
//    }
//}
