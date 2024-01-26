//
//  ViewController.swift
//  SpringAnimationView
//
//  Created by Dmitry Parhomenko on 25.01.2024.
//

import UIKit
import SpringAnimation

final class ViewController: UIViewController {
    
    var forseDouble: Double = 0.0
    var durationDouble: Double = 0.0
    var delayDouble: Double = 0.0
    
    private let app = SpringApp.getSpringApp()
    
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var forseValueLabel: UILabel!
    @IBOutlet var durationValueLabel: UILabel!
    @IBOutlet var delayValeeLabel: UILabel!
    
    
    @IBOutlet var forseSlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var delaySlider: UISlider!
    
    @IBOutlet var curveButton: SpringButton!
    @IBOutlet var animationButton: SpringButton!
    
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

    @IBAction func moveSlider(_ sender: UISlider) {
        switch sender {
        case forseSlider:
            setValueLabel(for: forseValueLabel)
            forseDouble = Double(forseValueLabel.text ?? "") ?? 0.0
            //print(forseDouble)
        case durationSlider:
            setValueLabel(for: durationValueLabel)
            durationDouble = Double(durationValueLabel.text ?? "") ?? 0.0
        default:
            setValueLabel(for: delayValeeLabel)
            delayDouble = Double(delayValeeLabel.text ?? "") ?? 0.0
        }
    }
    
    @IBAction func tapAnimationButton(_ sender: SpringButton) {
    
        sender.setTitle("animation: \(app.present[0])", for: .normal)
        
        springAnimationView.animation = app.present[0]
        springAnimationView.force = forseDouble
        springAnimationView.duration = durationDouble
        springAnimationView.delay = delayDouble
        springAnimationView.animate()
    }
    
    @IBAction func tapCurveButton(_ sender: SpringButton) {
        sender.setTitle("curve: \(app.curve[0])", for: .normal)
    }

    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValueLabel(for labels: UILabel...) {
        labels.forEach { label in
            switch label {
            case forseValueLabel: label.text = string(from: forseSlider)
            case durationValueLabel: label.text = string(from: durationSlider)
            default: label.text = string(from: delaySlider)
            }
        }
    }
    
}

