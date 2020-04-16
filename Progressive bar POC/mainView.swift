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
                        .stroke(style: .init(lineWidth: 3, lineCap: .round, lineJoin: .round, dash: [0.5,6], dashPhase: 1))
                        .frame(width: 110)
                        .foregroundColor(.green)
                        
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
                                .frame(width: 2, height: 80)
                                .background(Color.black)
                            
                            VStack(alignment: .leading){
                                Text("69")
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
            }
        }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        mainView()
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
