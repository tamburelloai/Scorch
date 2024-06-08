//
//  TensorData.swift
//  Scorch
//
//  Created by Michael Tamburello on 6/7/24.
//

import Foundation

// MARK: PROTOCOL requiring zero be a static var
protocol TensorData {
  static var zero: Self { get }
}

