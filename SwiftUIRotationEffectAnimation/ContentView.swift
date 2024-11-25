//
//  ContentView.swift
//  SwiftUIRotationEffectAnimation
//
//  Created by Angelos Staboulis on 25/11/24.
//

import SwiftUI

struct ContentView: View {
    @State private var moveOnCircularPath: Bool = false
    @State private var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var thesi = 360
    var body: some View {
        ZStack {
            Color.black.overlay {
                ZStack{
                    VStack{
                        Text("SwiftUI Animation")
                            .font(.largeTitle)
                            .foregroundColor(.red)
                    }.frame(maxWidth:.infinity,maxHeight:.infinity,alignment: .top)
                }
                Image(.earth).resizable().frame(width:350,height:350)
                Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundColor(.red)
                .offset(y:-150)
                .rotationEffect(.degrees(Double(thesi)))
                .onReceive(timer, perform: { output in
                    withAnimation(.linear(duration: 5)) {
                        thesi = thesi + 60
                    }
                })
            }

        }
    }
}

#Preview {
    ContentView()
}
