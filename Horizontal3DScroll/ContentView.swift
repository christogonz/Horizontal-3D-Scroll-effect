//
//  ContentView.swift
//  Horizontal3DScroll
//
//  Created by Christopher Gonzalez on 2024-07-27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 16) {
                ForEach(0 ..< 5) { item in
                    GeometryReader { geometry in
                        ZStack {
                            
                            RoundedRectangle(cornerRadius: 30)
                                .fill(LinearGradient(
                                    gradient: Gradient(colors: [Color.blue, Color.purple]),
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing))
                                
                            
                            Image(systemName: "person")
                                .font(.system(size: 100))
                        }
                        .rotation3DEffect(
                            Angle(
                                degrees: geometry.frame(
                                in: .global).minX - 16) / -20,
                            axis: (x: 0.0, y: 1.0, z: 0.0),
                            anchor: .center,
                            anchorZ: 0,
                            perspective: 1
                        )
                        
                        
                    }
                    .frame(width: 300, height: 300)
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .preferredColorScheme(.dark)
}
