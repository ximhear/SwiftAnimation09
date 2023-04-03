//
//  WaveShape.swift
//  SwiftUIAnimation09
//
//  Created by gzonelee on 2023/04/04.
//

import SwiftUI

struct WaveShape: Shape {
    var waveTop: Double = 0
    var amplitude = 100.0
    var frequency = 1.0
    var phase = 0.0
    
    var animatableData: Double {
        get { waveTop }
        set { waveTop = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            for x in 0..<Int(rect.width) {
                let angle = Double(x) / rect.width * 360.0 * frequency + phase
                let y = sin(Angle(degrees: angle).radians) * amplitude
                if x == 0 {
                    path.move(to: .init(x: Double(x), y: waveTop - y))
                }
                else {
                    path.addLine(to: .init(x: Double(x), y: waveTop - y))
                }
            }
            path.addLine(to: .init(x: rect.width, y: rect.height))
            path.addLine(to: .init(x: 0, y: rect.height))
            path.closeSubpath()
        }
    }
}

struct WaveShape_Previews: PreviewProvider {
    static var previews: some View {
        WaveShape(waveTop: 200, amplitude: 15, frequency: 4, phase: 90)
            .fill(.green)
            .offset(y: 200)
    }
}
