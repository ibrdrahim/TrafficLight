//
//  TrafficLight.swift
//  Traffict Light
//
//  Created by ibrahim on 21/07/20.
//  Copyright © 2020 ibrahim. All rights reserved.
//

import Foundation

enum TrafficLightColor:String {
    case red
    case green
    case yellow
}

struct TrafficLight {
    let color : TrafficLightColor
    let desc : String
}
