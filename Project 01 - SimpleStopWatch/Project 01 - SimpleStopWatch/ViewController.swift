//
//  ViewController.swift
//  Project 01 - SimpleStopWatch
//
//  Created by michael on 2019/1/29.
//  Copyright © 2019 michael. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer? = Timer()
    var playButton: UIButton!
    var pauseButton: UIButton!
    var timeLabel: UILabel!
    var isPlaying = false {
        didSet {
            playButton.isEnabled = !isPlaying
            pauseButton.isEnabled = isPlaying
        }
    }
    var counter: Float = 0.0 {
        // 属性观察器
        didSet {
            self.timeLabel?.text = String(format: "%.1f", counter)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        timer = Timer.scheduledTimer(timeInterval: 0.1, target:self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        timer!.fireDate = Date.distantFuture
        RunLoop.current.add(timer!, forMode: RunLoop.Mode.common)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
}

extension ViewController {
    
    func setupUI() {
        
        timeLabel = UILabel.init()
        timeLabel.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 260)
        timeLabel.text = "0.0"
        timeLabel.backgroundColor = UIColor.black
        timeLabel.textAlignment = NSTextAlignment.center
        timeLabel.textColor = UIColor.white
        timeLabel.font = UIFont.boldSystemFont(ofSize: 100)
        view.addSubview(timeLabel)
        
        playButton = UIButton(type: UIButton.ButtonType.custom)
        playButton.frame = CGRect(x: 0, y: timeLabel.bounds.height, width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height - 260)
        playButton.backgroundColor = UIColor.blue
        playButton.setImage(UIImage(named: "play"), for: UIControl.State.normal)
        playButton.addTarget(self, action: #selector(self.playButtonDidTouch), for: UIControl.Event.touchUpInside)
        view.addSubview(playButton)
        
        pauseButton = UIButton(type: UIButton.ButtonType.custom)
        pauseButton.frame = CGRect(x: playButton.bounds.width, y: timeLabel.bounds.height, width: UIScreen.main.bounds.width * 0.5, height: UIScreen.main.bounds.height - 260)
        pauseButton.backgroundColor = UIColor.green
        pauseButton.setImage(UIImage(named: "pause"), for: UIControl.State.normal)
        pauseButton.addTarget(self, action: #selector(self.pauseButtonDidTouch), for: UIControl.Event.touchUpInside)
        view.addSubview(pauseButton)
    }
}

extension ViewController {
    @objc func updateTimer() {
        counter = counter + 0.1
    }
    
    @objc func playButtonDidTouch() {
        isPlaying = true
        timer?.fire()
        timer?.fireDate = Date.distantPast
    }
    
    @objc func pauseButtonDidTouch() {
        isPlaying = false
        timer!.fireDate = Date.distantFuture
    }
}


