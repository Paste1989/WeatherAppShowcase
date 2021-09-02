//
//  Extension.swift
//  TabBarCoordinatorApp
//
//  Created by cobe on 23.08.2021..
//

import Foundation
import UIKit

public protocol RootShowable: AnyObject {
    func showAsRoot()
}

extension RootShowable where Self: UIViewController {
    public func showAsRoot() {
        guard  let window = window else {
            print("WARNING: no window!")
            return
        }
        window.rootViewController = self
        window.makeKeyAndVisible()
    }
}

extension UIViewController: RootShowable {
    public var window: UIWindow? {
        var appWindow = view.window
        if appWindow == nil {
            if UIApplication.shared.windows.count > 0 {
                appWindow = UIApplication.shared.windows[0]
            }
        }
        return appWindow
    }
 
    public var contentViewController: UIViewController? {
        if let navigationViewController = self as? UINavigationController {
            return navigationViewController.topViewController?.contentViewController
        } else {
            return self
        }
    }
}

extension UIViewController {
    func showMessage(title: String, messagae: String) {
        let alert = UIAlertController(title: title, message: messagae, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
