//
//  Random.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/7/24.
//

import Foundation

public struct Random {
  /// Generates a random number following a normal distribution using the Box-Muller transform.
  public static func generateNormalRandom() -> Float {
    let u1 = Float.random(in: 0..<1)  // Uniform randoms between 0 and 1
    let u2 = Float.random(in: 0..<1)
    // Box-Muller transform
    let z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * .pi * u2)
    return z0  // Normally distributed random number
  }
  
  public static func generateNormalRandom() -> Double {
    let u1 = Double.random(in: 0..<1)  // Uniform randoms between 0 and 1
    let u2 = Double.random(in: 0..<1)
    // Box-Muller transform
    let z0 = sqrt(-2.0 * log(u1)) * cos(2.0 * .pi * u2)
    return z0  // Normally distributed random number
  }
  
  
}
