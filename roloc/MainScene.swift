//
//  MainMenu.swift
//  roloc
//
//  Created by Hoang, Alex on 12/17/19.
//  Copyright © 2019 hmdwc. All rights reserved.
//

import SpriteKit

class MainMenu: SKScene {
    
    func loadGame() {
        /* 1) Grab reference to our SpriteKit view */
        guard let skView = self.view as SKView? else {
            print("Could not get Skview")
            return
        }

        /* 2) Load Game scene */
        guard let scene = GameScene(fileNamed:"GameScene") else {
            print("Could not make GameScene, check the name is spelled correctly")
            return
        }

        /* 3) Ensure correct aspect mode */
        scene.scaleMode = .aspectFill

        /* Show debug */
        skView.showsPhysics = true
        skView.showsDrawCount = true
        skView.showsFPS = true

        /* 4) Start game scene */
        skView.presentScene(scene)
    }

/* UI Connections */
var buttonPlay: MSButtonNode!

    override func didMove(to view: SKView) {
        /* Setup your scene here */

        /* Set UI connections */
        buttonPlay = self.childNode(withName: "buttonPlay") as? MSButtonNode
        buttonPlay.selectedHandler = {
            self.loadGame()
        }
    }
}
