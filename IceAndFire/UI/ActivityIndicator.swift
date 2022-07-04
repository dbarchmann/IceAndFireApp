//
//  ActivityIndicator.swift
//  IceAndFire
//
//  Created by DIDBARCH on 05.07.22.
//

import SwiftUI

struct DelayedActivityIndicator: ViewModifier {
    
    @Binding var isActive: Bool
    let delayedBy: TimeInterval
    
    @State private var showSpinner = false
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if showSpinner {
                SpinnerView()
            }
        }
        .onChange(of: isActive) { isActive in
            if isActive {
                DispatchQueue.main.asyncAfter(deadline: .now() + delayedBy) {
                    if self.isActive {
                        showSpinner = true
                    }
                }
            } else {
                showSpinner = false
            }
        }
    }
}

struct SpinnerView: View {
    @State private var animate = false
    
    private let color = Color.blue
    
    var body: some View {
        ZStack {
            Image("Loader")
                .rotationEffect(Angle(degrees: animate ? 360 : 0))
                .animation(Animation.linear(duration: 2.0).repeatForever(autoreverses: false))
                .frame(width: 120, height: 120, alignment: .center)
                .onAppear {
                    animate = true
                }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.black.opacity(0.75))
        .edgesIgnoringSafeArea(.vertical)
    }
}


extension View {
    func delayedActivityIndicator(isActive: Binding<Bool>, delayedBy: TimeInterval = 0.5) -> some View {
        modifier(DelayedActivityIndicator(isActive: isActive, delayedBy: delayedBy))
    }
}

