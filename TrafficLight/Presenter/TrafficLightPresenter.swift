//
//  TrafficLightPresenter.swift
//  TrafficLight
//
//  Created by ibrahim on 21/07/20.
//  Copyright © 2020 ibrahim. All rights reserved.
//

import Foundation

protocol TrafficLightViewDelegate: NSObjectProtocol {
    func updateTrafficLight(color:TrafficLightColor,description:String)
}

class TrafficLightPresenter {
    private let trafficLightService:TrafficLightService
    weak private var trafficLightViewDelegate:TrafficLightViewDelegate?
    
    private var activeColor:TrafficLightColor = .red
    private var trafficLightTimer:Timer?
    private var trafficLightChangeTime:Double = 3.0
    
    init(trafficLightService:TrafficLightService,trafficLightChangeTime:Double = 3.0) {
        self.trafficLightService = trafficLightService
        self.trafficLightChangeTime = trafficLightChangeTime
    }
    
    func setViewDelegate(trafficLightViewDelegate:TrafficLightViewDelegate?){
        self.trafficLightViewDelegate = trafficLightViewDelegate
    }
    
    // start traffic light, and initialize timer if not set
    func startTrafficLight() {
        
        if trafficLightTimer == nil {
            // for first initialization, when timer is not set
            setTrafficLightColor(color: activeColor)
        }
        
        // initialize timer
        trafficLightTimer = Timer.scheduledTimer(withTimeInterval: trafficLightChangeTime, repeats: true, block: { (_) in
            self.setTrafficLightColor(color: self.trafficLightNextColor())
        })
        
    }
    
    // set traffic light color
    func setTrafficLightColor(color:TrafficLightColor){
        self.trafficLightService.getTrafficLight(color: color) { [weak self] traficLight in
            if let traficLight = traficLight {
                self?.trafficLightViewDelegate?.updateTrafficLight(color: color, description: traficLight.desc)
                activeColor = color
            }
        }
    }
    
    // stop traffic light and invalidate timer
    func stopTrafficLight() {
        trafficLightTimer?.invalidate()
        trafficLightTimer = nil
    }
    
    // get traffic light next color
    func trafficLightNextColor()->TrafficLightColor{
        switch activeColor {
            case .red:
                return .green
            case .green:
                return .yellow
            case .yellow:
                return .red
        }
    }
}
