//
//  Coordinator.swift
//  WeatherAppShowcase
//
//  Created by cobe on 02.09.2021..
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    @discardableResult
    func start() -> UIViewController
}
