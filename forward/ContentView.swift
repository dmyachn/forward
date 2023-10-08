//
//  ContentView.swift
//  forward
//
//  Created by Dmitiy Myachin on 05.10.2023.
//

import SwiftUI

struct SmallRoundButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(
                        Circle()
                            .foregroundColor(.yellow)
                            .opacity(configuration.isPressed ? 0.7 : 0)
                            .frame(width: 180, height: 180)
                )
                .scaleEffect(configuration.isPressed ? 0.5 : 1.0)
                .animation(.easeOut(duration: 0.22), value: configuration.isPressed)
    }
}

struct RightSmallRoundButton: PrimitiveButtonStyle {
    @State var isAnimationSmallOn = false
    
    func makeBody(configuration: Configuration) -> some View {
            configuration.label
                .background(
                        Circle()
                            .foregroundColor(.yellow)
                            .opacity(isAnimationSmallOn ? 0.7 : 0)
                            .frame(width: 180, height: 180)
                )
                .gesture(
                    TapGesture()
                        .onEnded { _ in
                            configuration.trigger()
                            withAnimation(.easeInOut(duration: 0.2)) {
                                isAnimationSmallOn = true
                            } completion: {
                                withAnimation(.easeInOut) {
                                    isAnimationSmallOn = false
                                }
                            }
                        }
                        .simultaneously(with:
                    LongPressGesture()
                            .onEnded { _ in
                                configuration.trigger()
                                withAnimation(.easeInOut(duration: 0.2)) {
                                    isAnimationSmallOn = true
                                } completion: {
                                    withAnimation(.easeInOut) {
                                        isAnimationSmallOn = false
                                    }
                                }
                                
                            }
                            .onChanged({ value in
                                withAnimation(.easeInOut(duration: 0.1)) {
                                    isAnimationSmallOn = value
                                }
                            }))
            )
                .scaleEffect(isAnimationSmallOn ? 0.6 : 1.0)
    }
}

struct ContentView: View {
    var body: some View {
        HStack{
            Spacer()
            ForvardButton()
                .buttonStyle(SmallRoundButton())
            Spacer()
            ForvardButton()
                .buttonStyle(RightSmallRoundButton())
            Spacer()
        }
    }
}

struct ForvardButton: View {
    @State var isAnimationOn = false
    var body: some View {
        Button {
            if !isAnimationOn {
                withAnimation(.interpolatingSpring(stiffness: 150, damping: 15, initialVelocity: 2)) {
                    isAnimationOn = true
                } completion: {
                    isAnimationOn = false
                }
            }
        } label: {
            HStack(spacing: 5){
                    GeometryReader{ proxi in
                        
                        let width = proxi.size.width / 2
                        let imageName = "play.fill"
                        
                        HStack(alignment: .center, spacing: 0){
                            Image(systemName: imageName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: isAnimationOn ? width : .zero)
                                .opacity(isAnimationOn ? 1 : .zero)
                            Image(systemName: imageName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: width)
                            Image(systemName: imageName)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(width: isAnimationOn ? .zero : width)
                                .opacity(isAnimationOn ? .zero : 1)
                        }
                    }
            }
        }
        .frame(width: 140, height: 70)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
