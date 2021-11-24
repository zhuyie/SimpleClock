//
//  ContentView.swift
//  SimpleClock
//
//  Created by zhuyie on 2021/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var tickCount = 0
    @State var timeString = "."
    @State var viewOffset = CGSize(width: 0, height: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let dateFormatter = DateFormatter()
 
    init() {
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .medium
    }
    
    var body: some View {
        HStack {
        Text(timeString)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.green)
            .font(.system(size: 36, weight: .light, design: .monospaced))
            .offset(viewOffset)
            .onReceive(timer) { input in
                tickCount += 1
                
                if tickCount <= 2 {
                    timeString += "."
                } else {
                    timeString = dateFormatter.string(from: input)
                }
                
                if tickCount % 15 == 0 {
                    let x = Int.random(in: -500..<501)
                    let y = Int.random(in: -500..<501)
                    viewOffset.width = CGFloat(x)
                    viewOffset.height = CGFloat(y)
                }
            }
        }.background(Color.black)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
