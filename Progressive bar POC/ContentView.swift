//
//  ContentView.swift
//  Progressive bar POC
//
//  Created by Bharat on 13/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var percentage: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer()
                ZStack{
                    
                    Track()
                    Label(percentage: percentage)
                    Outline(percentage: percentage)
                }
                
                Spacer()
                
                HStack{
                    
                Button(action: {
                    self.percentage = CGFloat(50)
                }){
                    
                    Text("50")
                        .font(.title)
                        .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }
                    
                Button(action: {
                    self.percentage = CGFloat(30)
                }){
                    
                    Text("30")
                        .font(.title)
                        .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }

                Button(action: {
                    self.percentage = CGFloat(60)
                }){
                    
                    Text("60")
                        .font(.title)
                        .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }

                Button(action: {
                    self.percentage = CGFloat(80)
                }){
                    
                    Text("80")
                        .font(.title)
                        .foregroundColor(.red)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                }

                }
            }
        }
    }
}

struct Label: View {
    var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage))
                .font(.system(size: 65))
                .fontWeight(.heavy)
                .colorInvert()
        }
    }
}

struct Outline: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.outlineColor]
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.clear)
                .frame(width: 200, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: percentage * 0.01)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.outlineColor, .red]), startPoint: .zero, endPoint: .trailing))
            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
    
}

struct Track: View {
    var colors: [Color] = [Color.trackColor]
    var percentage: CGFloat = 50
    
    var body: some View {
        ZStack{
            Circle()
                .fill(Color.clear)
                .frame(width: 200, height: 250)
            .overlay(
                Circle()
                    .trim(from: 0.0, to: percentage / 2)
                    .stroke(style: StrokeStyle(lineWidth: 20))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
            )
        }
    }
}



//struct Pulsation: View {
//    @State private var pulsate = false
//    var colors: [Color] = [Color.pulsatingColor]
//    var body: some View {
//        ZStack{
//            Circle()
//                .fill(Color.pulsatingColor)
//                .frame(width: 245, height: 245)
//                .scaleEffect(pulsate ? 1.3 : 1.1)
//                .animation(Animation.easeInOut(duration: 1.1).repeatForever(autoreverses: true))
//                .onAppear{
//                    self.pulsate.toggle()
//            }
//        }
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
