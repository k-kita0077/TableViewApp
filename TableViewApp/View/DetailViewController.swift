//
//  DetailViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/09.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit
import SpriteKit

class DetailViewController: UIViewController, CellContent {

    var tappedRow: Int?
    
    var skView: SKView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let tappedRow = tappedRow else {return}

        print("Row:\(tappedRow)")
        
        let particleName: String
        
        switch tappedRow {
        case 1:
            particleName = self.cellInfo()[1][1]
        case 2:
            particleName = self.cellInfo()[2][1]
        case 3:
            particleName = self.cellInfo()[3][1]
        case 4:
            particleName = self.cellInfo()[4][1]
        case 5:
            particleName = self.cellInfo()[5][1]
        case 6:
            particleName = self.cellInfo()[6][1]
        case 7:
            particleName = self.cellInfo()[7][1]
        case 8:
            particleName = self.cellInfo()[8][1]
        case 9:
            particleName = self.cellInfo()[9][1]
        default:
            particleName = self.cellInfo()[0][1]
        }
        
        createSKView()
        
        setupParticle(particleName: particleName)
    }


    func createSKView() {
        self.skView = SKView(frame: self.view.frame)
        self.skView!.allowsTransparency = true
    }
    
    func setupParticle(particleName: String) {
        let scene = SKScene(size: self.view.frame.size)
        scene.backgroundColor = UIColor.black
        
        let path = Bundle.main.path(forResource: particleName, ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        particle.name = particleName
        particle.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        //particle.numParticlesToEmit = 2000
        scene.addChild(particle)
        
        self.skView!.presentScene(scene)
        self.view.addSubview(self.skView!)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
