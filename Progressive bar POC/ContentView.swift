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
//            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.8), Color.white]), startPoint: .top, endPoint: .bottom)
                
            Color.red
                .edgesIgnoringSafeArea(.all)
            VStack{
                Spacer(minLength: 50)
                                    
                ZStack{
                    
                    Track()
                        .frame(width: 5)
                    
                    Outline(percentage: percentage)
                    .frame(width: 5)

                }.padding(.leading,100)
                .offset(x: -80, y: 0)
                
                ZStack{
                    
                    Track1()
                        .frame(width: 5)
                                        
                    Outline1(percentage: percentage)
                        .frame(width: 5)

                }.padding(.trailing,100)
                .offset(x: 70, y: -259)
                
                
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
                    self.percentage = CGFloat(100)
                }){
                    
                    Text("100")
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
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .colorInvert()
        }
    }
}

struct Track: View {
    var colors: [Color] = [Color.trackColor]
    var percentage: CGFloat = 50
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.clear)
                .frame(width: 200, height: 250)
                .rotationEffect(.degrees(90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .trim(from: 0.0, to: percentage / 2)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                    .rotationEffect(.degrees(90))
            )
        }
    }
}



struct Outline: View {
    
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.white]
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.clear)
                .frame(width: 200, height: 250)
                .rotationEffect(.degrees(90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .trim(from: 0.0, to: percentage*0.01)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .leading, endPoint: .trailing))
                    .rotationEffect(.degrees(90))
            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
    
}

struct Label1: View {
    var percentage: CGFloat = 0
    var body: some View {
        ZStack {
            Text(String(format: "%.0f", percentage))
                .font(.system(size: 16))
                .fontWeight(.heavy)
                .colorInvert()
        }
    }
}

struct Outline1: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.white]
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.clear)
                .frame(width: 200, height: 250)
                .rotationEffect(.degrees(-90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .trim(from: 0.0, to: percentage*0.01)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.white, .green]), startPoint: .zero, endPoint: .trailing))
                    .rotationEffect(.degrees(-90))
            ).animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 1.0))
        }
    }
}

struct Track1: View {
    var colors: [Color] = [Color.trackColor]
    var percentage: CGFloat = 50
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.0, to: 0.5)
                .fill(Color.clear)
                .frame(width: 200, height: 250)
                .rotationEffect(.degrees(-90))
            .overlay(
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                    .rotationEffect(.degrees(-90))
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
