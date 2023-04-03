//
//  PourAnimationView.swift
//  SwiftUIAnimation09
//
//  Created by gzonelee on 2023/04/04.
//

import SwiftUI

struct PourAnimationView: View {
    @State var shapeTop = 500.0
    @State var wavePhase = 90.0
    @State var wavePhase2 = 0.0
    @State var showPour = true
    @State var screenSize: CGSize = .zero
    var waveHeight: Double {
        min(shapeTop / 10.0, 20.0)
    }
    let fillColor = Color(red: 0.180, green: 0.533, blue: 0.78)
    let waveColor2 = Color(red: 0.129, green: 0.345, blue: 0.6)
    var body: some View {
        ZStack {
            if showPour {
                PourSceneView()
            }
            WaveShape(waveTop: shapeTop,
                      amplitude: waveHeight * 1.2,
                      frequency: 5,
                      phase: wavePhase2)
            .fill(waveColor2)
            WaveShape(waveTop: shapeTop,
                      amplitude: waveHeight,
                      frequency: 4,
                      phase: wavePhase)
                .fill(fillColor)
                .onAppear {
                    withAnimation(.easeInOut(duration: 0.5).repeatForever()) {
                        wavePhase = -90
                    }
                    withAnimation(.easeInOut(duration: 0.3).repeatForever()) {
                        wavePhase2 = 270
                    }
                    withAnimation(.linear(duration: 6.0).delay(1)) {
                        shapeTop = 0
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 7) {
                        showPour = false
                    }
            }
        }
        .overlay {
            GeometryReader { proxy in
                Color.clear.preference(key: SizePreferenceKey.self, value: proxy.size)
            }
        }
        .onPreferenceChange(SizePreferenceKey.self) { value in
            screenSize = value
            shapeTop = value.height - 100
        }
    }
}

struct PourAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        PourAnimationView()
    }
}
struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}
