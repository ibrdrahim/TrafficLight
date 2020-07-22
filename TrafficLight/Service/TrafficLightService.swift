//
//  TrafficLightService.swift
//  TrafficLight
//
//  Created by ibrahim on 21/07/20.
//  Copyright © 2020 ibrahim. All rights reserved.
//

import Foundation

class TrafficLightService {
    
    func getTrafficLight(color:TrafficLightColor, callBack:(TrafficLight?) -> Void) {
        let trafficLights = [TrafficLight(color: .red, desc: "Stop!"),
                             TrafficLight(color: .green, desc: "Go!"),
                             TrafficLight(color: .yellow, desc: "About to change to red")
        ]
        
        if let foundTrafficLight = trafficLights.first(where: {$0.color == color}) {
            callBack(foundTrafficLight)
        } else {
            callBack(nil)
        }
    }
}
