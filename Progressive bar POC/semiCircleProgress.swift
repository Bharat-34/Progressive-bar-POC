//
//  semiCircleProgress.swift
//  Progressive bar POC
//
//  Created by Bharat on 13/04/20.
//  Copyright © 2020 Bharat. All rights reserved.
//

import SwiftUI

struct ValLabel: View {
    
    var percentage: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            Circle()
                .trim(from: 0.5, to: 1.0)
                .stroke(Color.pink, lineWidth: 20)
                .frame(width:300,height: 300)
                .rotationEffect(.degrees(90))
                .padding()
                
        }
    }
}


struct semiCircleProgress: View {
    
    @State var percentage: CGFloat = 0
    
    var body: some View {
        
        ZStack{
            
            LinearGradient(gradient: Gradient(colors: [Color.orange, Color.blue]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                Spacer()
                ZStack{
                    
                    Track1()
                    Label1(percentage: percentage)
                    Outline1(percentage: percentage)
                }
                
                Spacer()
                
                Button(action: {
                    self.percentage = CGFloat(80)
                }){
                    
                    Text("Hit me")
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

struct Label1: View {
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

struct Outline1: View {
    var percentage: CGFloat = 50
    var colors: [Color] = [Color.outlineColor]
    var body: some View {
        ZStack{
                Circle()
                    .trim(from: 0.0, to: 0.5)
                    .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
                    .fill(LinearGradient(gradient: Gradient(colors: [.outlineColor, .blue]), startPoint: .zero, endPoint: .trailing))
                    .animation(.spring(response: 2.0, dampingFraction: 1.0, blendDuration: 0.5))
                    .rotationEffect(.degrees(90))
            .padding()
        }
    }
    
}

struct Track1: View {
    var colors: [Color] = [Color.trackColor]
    var percentage: CGFloat = 50
    
    var body: some View {
        ZStack{
                Circle()
                    //.trim(from: 0.0, to: percentage / 2)
//                    .stroke(style: StrokeStyle(lineWidth: 20))
                    .trim(from: 0.5, to: percentage / 2)
                    .stroke(style: StrokeStyle(lineWidth: 20))
                    .frame(width:300,height: 300)
                    .rotationEffect(.degrees(90))
//                    .fill(AngularGradient(gradient: .init(colors: colors), center: .center))
                    
        }
    }
}


struct ValLabel_Previews: PreviewProvider {
    
    static var previews: some View {
        semiCircleProgress()
    }
}



