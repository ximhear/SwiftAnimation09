//
//  PourAnimationView.swift
//  SwiftUIAnimation09
//
//  Created by gzonelee on 2023/04/04.
//

import SwiftUI

struct PourAnimationView: View {
    @State var shapeTop = 900.0
    let fillColor = Color(red: 0.180, green: 0.533, blue: 0.78)
    var body: some View {
        WaveShape(waveTop: shapeTop, amplitude: 15,
        frequency: 4, phase: 90)
            .fill(fillColor)
            .onAppear {
                withAnimation(.linear(duration: 6.0)) {
                    shapeTop = 0
                }
            }
    }
}

struct PourAnimationView_Previews: PreviewProvider {
    static var previews: some View {
        PourAnimationView()
    }
}
