//
//  ViewController.swift
//  BullsEye
//
//  Created by Hamidreza Zebardast on 2024-05-24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var sLabel: UILabel!
    @IBOutlet var roundLabel: UILabel!
    @IBOutlet var scoreLabel: UILabel!
    
    var currentValue = 0
    var targetValue = 0
    var round = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSlider()
        startNewGame()
    }
    
    @IBAction func showAlert() {
        let difference = abs(targetValue - currentValue)
        var points = 100 - difference
        
        let title: String
        if difference == 0 {
            title = "You read my mind!\nMy number Was \(targetValue)"
            points += 100
        } else if difference < 5 {
            title = "Nearly there!\nMy Number was \(targetValue)"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Close-ish.\nMy Number was \(targetValue)"
        } else {
            title = "Not even close...\n My number was \(targetValue)"
        }
        
        score += points
        let message = "You scored \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "try your luck!", style: .default) { _ in
            self.startNewRound()
        })
        present(alert, animated: true)
        
        startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        currentValue = Int(slider.value)
        sLabel.text = "\(currentValue)"
    }
    
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        addTransition()
    }
    
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 1
        slider.value = Float(currentValue)
        sLabel.text = "\(currentValue)"
        updateLabels()
    }
    
    func updateLabels() {
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
    
    private func setupSlider() {
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    private func addTransition() {
        let transition = CATransition()
        transition.type = .fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: .easeOut)
        view.layer.add(transition, forKey: nil)
    }
}
