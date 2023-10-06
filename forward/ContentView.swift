//
//  ContentView.swift
//  forward
//
//  Created by Dmitiy Myachin on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Namespace var animation
    @State var isAnimationOn = true
    @State var count = 0
    var body: some View {
        Button {
            withAnimation(.interpolatingSpring(stiffness: 150, damping: 15, initialVelocity: 2)) {
                isAnimationOn = false
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isAnimationOn = true
            }
        } label: {
            HStack(spacing: 5){
                if isAnimationOn{
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "zero", in: animation)
                        .frame(width: 0, height: 0)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "first", in: animation)
                        .frame(width: 25, height: 30)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "second", in: animation)
                        .frame(width: 25, height: 30)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "third", in: animation)
                        .frame(width: 0, height: 0)
                }
                else{
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "third", in: animation)
                        .frame(width: 0, height: 0)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "zero", in: animation)
                        .frame(width: 25, height: 30)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "first", in: animation)
                        .frame(width: 25, height: 30)
                    Image(systemName: "play.fill")
                        .resizable()
                        .matchedGeometryEffect(id: "second", in: animation)
                        .frame(width: 0, height: 0)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
