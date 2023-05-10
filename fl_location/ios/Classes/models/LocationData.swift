//
//  LocationData.swift
//  fl_location
//
//  Created by WOO JIN HWANG on 2021/07/29.
//

import CoreLocation
import Foundation

struct LocationData: Codable {
  let latitude: Double
  let longitude: Double
  let horizontalAccuracy: Double
  let verticalAccuracy: Double
  let altitude: Double
  let course: Double
  let speed: Double
  let speedAccuracy: Double
  let millisecondsSinceEpoch: Double
  let isMock: Bool

  init(from location: CLLocation) {
    self.latitude = location.coordinate.latitude
    self.longitude = location.coordinate.longitude
    self.horizontalAccuracy = location.horizontalAccuracy
    self.verticalAccuracy = location.verticalAccuracy
    self.altitude = location.altitude
    self.course = location.course
    self.speed = location.speed

    if #available(iOS 10.0, *) {
      self.speedAccuracy = location.speedAccuracy
    } else {
      self.speedAccuracy = 0.0
    }

    self.millisecondsSinceEpoch = location.timestamp.timeIntervalSince1970 * 1000.0
    self.isMock = false
  }
}