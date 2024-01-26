//
//  ViewController.swift
//  SpringAnimationView
//
//  Created by Dmitry Parhomenko on 25.01.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    private let app = SpringApp.getSpringApp()
    
    @IBOutlet var forseValue: UILabel!
    @IBOutlet var forseSlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var delaySlider: UISlider!
    
    
    @IBOutlet var curveButton: SpringButton!
    @IBOutlet var animationButton: SpringButton!
    
    @IBOutlet var springAnimationView: SpringView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        springAnimationView.layer.cornerRadius = 10
        animationButton.layer.cornerRadius = 10
        curveButton.layer.cornerRadius = 10
        forseSlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
        durationSlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
        delaySlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
    }

    @IBAction func tapSpringButton(_ sender: SpringButton) {
    
        
        sender.setTitle("Present: '\(app.present[2])'", for: .normal)
        sender.animation = app.curve[5]
        sender.duration = 2
        sender.animate()
        
        springAnimationView.animation = "fadeIn"
        springAnimationView.duration = 3
        springAnimationView.animate()
    }

    
}

