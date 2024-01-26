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
    var randomAnimation = ""
    var randomCurve = ""
    
    private let app = SpringApp.getSpringApp()
    
    @IBOutlet var springAnimationView: SpringView!
    
    @IBOutlet var forseValueLabel: UILabel!
    @IBOutlet var durationValueLabel: UILabel!
    @IBOutlet var delayValeeLabel: UILabel!

    @IBOutlet var forseSlider: UISlider!
    @IBOutlet var durationSlider: UISlider!
    @IBOutlet var delaySlider: UISlider!
    
    @IBOutlet var carrentAnimationLabel: UILabel!
    @IBOutlet var currentCurveLabel: UILabel!
    
    @IBOutlet var goButton: SpringButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addVerticalGradientLayer()
        settingView()
    }

    @IBAction func moveSlider(_ sender: UISlider) {
        switch sender {
        case forseSlider:
            setValueLabel(for: forseValueLabel)
            forseDouble = Double(forseValueLabel.text ?? "") ?? 0.0
        case durationSlider:
            setValueLabel(for: durationValueLabel)
            durationDouble = Double(durationValueLabel.text ?? "") ?? 0.0
        default:
            setValueLabel(for: delayValeeLabel)
            delayDouble = Double(delayValeeLabel.text ?? "") ?? 0.0
        }
    }
    
    @IBAction func tapGoButton(_ sender: SpringButton) {
        springAnimationView.animation = randomAnimation
        springAnimationView.curve = randomCurve
        springAnimationView.force = forseDouble
        springAnimationView.duration = durationDouble
        springAnimationView.delay = delayDouble
        springAnimationView.animate()
    }
    
    @IBAction func nextAnimationButton(_ sender: SpringButton) {
        getRandomAnimation()
        carrentAnimationLabel.text = "animation: \(randomAnimation)"
    }
    
    @IBAction func nextCurveButton(_ sender: SpringButton) {
        getRandomCurve()
        currentCurveLabel.text = "curve: \(randomCurve)"
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
    
    private func getRandomAnimation() {
        if app.present.isEmpty == false {
            randomAnimation = app.present.randomElement() ?? ""
        }
    }
    
    private func getRandomCurve() {
        if app.curve.isEmpty == false {
            randomCurve = app.curve.randomElement() ?? ""
        }
    }
    
    private func settingView() {
        randomAnimation = app.present[0]
        randomCurve = app.curve[0]
        carrentAnimationLabel.text = "animation: \(randomAnimation)"
        currentCurveLabel.text = "curve: \(randomCurve)"
        forseDouble = Double(forseValueLabel.text ?? "") ?? 0.0
        durationDouble = Double(durationValueLabel.text ?? "") ?? 0.0
        delayDouble = Double(delayValeeLabel.text ?? "") ?? 0.0
        springAnimationView.layer.cornerRadius = 10
        goButton.layer.cornerRadius = 10
        setValueLabel(for: forseValueLabel, durationValueLabel, delayValeeLabel)
        forseSlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
        durationSlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
        delaySlider.transform = CGAffineTransformMakeRotation(CGFloat(Double.pi / 2))
    }
    
}

