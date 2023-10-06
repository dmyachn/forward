//
//  ContentView.swift
//  forward
//
//  Created by Dmitiy Myachin on 05.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State var array: [AnyView] = [
        AnyView(Image(systemName: "play")
            .resizable()
            .transition(
                .asymmetric(insertion: .move(edge: .leading).combined(with: .scale),
                                    removal: .move(edge: .trailing).combined(with: .scale)))
        ),

        AnyView(Image(systemName: "play")
            .resizable()
            .foregroundColor(.yellow)
            .transition(
                .asymmetric(insertion: .move(edge: .leading).combined(with: .scale),
                                    removal: .move(edge: .trailing).combined(with: .scale)))
        ),
        
        AnyView(Image(systemName: "play.fill")
            .resizable()
            .foregroundColor(.yellow)
            .transition(
                .asymmetric(insertion: .move(edge: .leading).combined(with: .scale),
                                    removal: .move(edge: .trailing).combined(with: .scale)))
        )
    ]
    
    var body: some View {
        Button {
            withAnimation(.easeInOut){
            let view = array.remove(at: 1)
            array.insert(view , at: 0)
            }
        } label: {
            HStack(spacing: 0){
                ForEach(0..<2) {
                    array[$0]
                }.animation(.easeInOut, value: 10)
            }.frame(width: 50, height: 30)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
