//
//  ContentView.swift
//  SwiftUIAnimation09
//
//  Created by gzonelee on 2023/04/04.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            PourAnimationView()
                .ignoresSafeArea(edges: [.bottom])
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
