//
//  TrafficLightViewController.swift
//  Traffict Light
//
//  Created by ibrahim on 21/07/20.
//  Copyright © 2020 ibrahim. All rights reserved.
//

import UIKit

class TrafficLightViewController: UIViewController, TrafficLightViewDelegate {    

    @IBOutlet weak var TrafficLightBackground: UIView!
    @IBOutlet weak var trafficLightDesc: UILabel!
    @IBOutlet weak var trafficLightStack: UIStackView!
    
    private let trafficLightPresenter = TrafficLightPresenter(trafficLightService: TrafficLightService())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trafficLightPresenter.setViewDelegate(trafficLightViewDelegate: self)
        trafficLightPresenter.startTrafficLight()
        TrafficLightBackground.layer.cornerRadius = 5.0
    }
    
    func updateTrafficLight(color:TrafficLightColor, description:String) {
        
        for trafficLight in trafficLightStack.arrangedSubviews {
            if trafficLight.restorationIdentifier == color.rawValue {
                trafficLight.alpha = 1.0
            }else{
                trafficLight.alpha = 0.2
            }
        }
        
        trafficLightDesc.text = description
    }
    
    deinit {
        trafficLightPresenter.stopTrafficLight()
    }
    
}


class TrafficLightView: UIView {
    
    func updateBorder() {
        // rounded corner
        layer.cornerRadius  = self.frame.width / 2
        layer.borderWidth   = 1.0
        layer.borderColor   = UIColor.clear.cgColor
    }

    func updateShadow() {
        // shadow
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 3.0 , height: 3.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = self.frame.width / 2
        self.layer.masksToBounds = false
        self.clipsToBounds = false
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateBorder()
        updateShadow()
    }

}
