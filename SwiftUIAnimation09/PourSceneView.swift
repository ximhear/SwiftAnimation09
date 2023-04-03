//
//  PourSceneView.swift
//  SwiftUIAnimation09
//
//  Created by gzonelee on 2023/04/04.
//

import SwiftUI
import SpriteKit

class PouringLiquidScene: SKScene {
    static let shared = PouringLiquidScene()
    let dropEmitter = SKEmitterNode(fileNamed: "PourParticle")
    
    override func didMove(to view: SKView) {
        self.backgroundColor = .clear
        if let dropEmitter, !self.children.contains(dropEmitter) {
            addChild(dropEmitter)
        }
        dropEmitter?.position.x = 100
        dropEmitter?.position.y = self.frame.maxY
    }
}

struct PourSceneView: View {
    var pouringScene: SKScene {
        let scene = PouringLiquidScene.shared
        scene.size = UIScreen.main.bounds.size
        scene.scaleMode = .fill
        return scene
    }
    var body: some View {
        SpriteView(scene: pouringScene,
                   options: [.allowsTransparency])
    }
}

struct PourSceneView_Previews: PreviewProvider {
    static var previews: some View {
        PourSceneView()
    }
}
