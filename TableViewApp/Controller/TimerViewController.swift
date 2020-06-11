//
//  TimerViewController.swift
//  TableViewApp
//
//  Created by kita kensuke on 2020/06/11.
//  Copyright © 2020 kita kensuke. All rights reserved.
//

import UIKit
import SpriteKit

class TimerViewController: UIViewController {
    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var msLabel: UILabel!
    @IBOutlet weak var gameover: UILabel!
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    var timer: Timer!
        var startTime = Date()
        var sec: Int = 0
        var ms: Int = 0
        var colon: String = ":"
        
        var imageView:UIImageView!
        var scale: Int = 100
        var width:CGFloat = 0
        var height:CGFloat = 0
        var screenWidth:CGFloat = 0
        var screenHeight:CGFloat = 0
        
        
         
        var skView: SKView?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
            stopButton.isHidden = true
            restartButton.isHidden = true
            
            startButton.layer.cornerRadius = 10.0
            stopButton.layer.cornerRadius = 10.0
            restartButton.layer.cornerRadius = 10.0
            
            secLabel.isHidden = true
            msLabel.isHidden = true
            gameover.alpha = 0.0
            
            
            // Screen Size の取得
            screenWidth = self.view.bounds.width
            screenHeight = self.view.bounds.height
               
            // UIImage インスタンスの生成
            let image = UIImage(named:"bom")!
               
            // 画像の幅・高さの取得
            width = image.size.width
            height = image.size.height
           
            // UIImageView インスタンス生成
            imageView = UIImageView(image:image)
           
            // 画像サイズをスクリーン幅に合わせる
            //scale = screenWidth / width
            let rect:CGRect = CGRect(x:0, y:0, width:scale, height:scale)
           
            // ImageView frame をCGRectで作った矩形に合わせる
            imageView.frame = rect;
           
            // 画像の中心をスクリーンの中心位置に設定
            imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
           
            // view に ImageView を追加する
            self.view.addSubview(imageView)
            
            
        }

        @IBAction func pushStart(_ sender: Any) {
            startButton.isHidden = true
            stopButton.isHidden = false
            
            timer = Timer.scheduledTimer(
                timeInterval: 0.01,
                target: self,
                selector: #selector(self.timerCounter),
                userInfo: nil,
                repeats: true)
            
            startTime = Date()
        }
        
    @IBAction func pushStopButton(_ sender: Any) {
        timer.invalidate()
            
        secLabel.isHidden = false
        msLabel.isHidden = false
            
        stopButton.isHidden = true
        restartButton.isHidden = false
    }
        
    @IBAction func pushRestartButton(_ sender: Any) {
        restartButton.isHidden = true
        startButton.isHidden = false
        
        secLabel.isHidden = true
        msLabel.isHidden = true
        
        let rect:CGRect = CGRect(x:0, y:0, width:100, height:100)
        imageView.frame = rect;
        imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
        self.view.addSubview(imageView)
        }
        
        @objc func timerCounter() {
            
            let currentTime = Date().timeIntervalSince(startTime)
            
            sec = (Int)(fmod(currentTime, 60))
            ms = (Int)((currentTime - floor(currentTime))*100)
            
            let sSecond = String(format:"%02d", sec)
            let sMsec = String(format:"%02d", ms)
            
            secLabel.text = sSecond
            msLabel.text = sMsec
            
            scale = 100 + (Int)((currentTime - floor(currentTime))*50) + Int(currentTime) * 50
            let rect:CGRect = CGRect(x:0, y:0, width:scale, height:scale)
            imageView.frame = rect;
            imageView.center = CGPoint(x:screenWidth/2, y:screenHeight/2)
            self.view.addSubview(imageView)
            
            if Int(currentTime) >= 5 && (Int)((currentTime - floor(currentTime))*100) > 0{
                timer.invalidate()
                imageView.isHidden = true
                stopButton.isHidden = true
                
                createSKView()
                
                setupParticle()
                
                restartButton.alpha = 0.0
                restartButton.isHidden = false
                
                
                UIView.animate(withDuration: 2.0,
                               delay: 2.0,
                               options: [.curveLinear],
                               animations: {
                                self.gameover.alpha = 1.0
                                })
                UIView.animate(withDuration: 2.0,
                                delay: 2.0,
                                options: [.curveLinear],
                                animations: {
                                 self.restartButton.alpha = 1.0
                                 })

            }
            
    }
  
        
    func createSKView() {
        self.skView = SKView(frame: self.view.frame)
        self.skView!.allowsTransparency = true
    }
    
    func setupParticle() {
        let scene = SKScene(size: self.view.frame.size)
        scene.backgroundColor = UIColor.clear
        
        let path = Bundle.main.path(forResource: "MyParticle", ofType: "sks")
        let particle = NSKeyedUnarchiver.unarchiveObject(withFile: path!) as! SKEmitterNode
        particle.name = "MyParticle"
        particle.position = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        particle.numParticlesToEmit = 2000
        scene.addChild(particle)
        
        self.skView!.presentScene(scene)
        self.view.addSubview(self.skView!)
    }
        
}
